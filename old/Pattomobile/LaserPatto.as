package {
	import org.cove.ape.*
	import flash.display.MovieClip
	import flash.events.Event
	import flash.geom.Point
	import DBK.Global
	
	public class LaserPatto extends MovieClip {
		public var ball:CircleParticle
		public var laser:RectangleSurface
		public var laserball:CircleSurface
		public var py:Number
		public var minx:Number
		public var maxx:Number
		public var pos:Vector
		public var vis:Vector
		public var c:uint
		public var i:uint
		
		public function LaserPatto (xpos:Number, ypos:Number, xmin:Number, xmax:Number, interval:uint) {
			ball = new CircleParticle(xpos, ypos, 30, false, 1, 0.7)
			ball.type = "laserpatto"
			ball.data = this
			Global.global.mobile.addParticle(ball)
			x = ball.px
			y = ball.py
			addEventListener(Event.ENTER_FRAME, drawFrame)
			py = ypos
			minx = xmin
			maxx = xmax
			i = interval
			c = 0
			addEvent("kill", kill)
			addEvent("laser", kill)
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				c++
				x = ball.px
				y = ball.py = py
				if (laser == null) {
					rotation += ball.velocity.x
					ball.velocity = new Vector(ball.velocity.x + (parent.parent.car.patto.x - x) / Math.abs(parent.parent.car.patto.x - x + .0001) * .1, 0)
				}
				if (ball.px > maxx) {
					x = ball.px = maxx
					ball.velocity = new Vector(0, 0)
				} else if (ball.px < minx) {
					x = ball.px = minx
					ball.velocity = new Vector(0, 0)
				}
				vis = new Vector(x + parent.parent.x, y + parent.parent.y)
				if (c % i == 0 && vis.x > -patto.width / 2 && vis.x < 640 + patto.width / 2 && vis.y > -patto.height / 2 && vis.y < 480 + patto.height / 2) {
					laser = parent.parent.surfaces.addChild(new RectangleSurface((pos.x + x)/2, (pos.y + y)/2, Math.sqrt(Math.pow(pos.x - x, 2) + Math.pow(pos.y - y, 2)), 10, Math.atan2(pos.y - y, pos.x - x) * 180 / Math.PI, "FF0000", "laser", "", false, null, 999))
					laserball = parent.parent.surfaces.addChild(new CircleSurface(pos.x, pos.y, 10, "FF0000", "laser", "", false, null, 999))
					ball.fixed = true
				}
				if (c % i == 20) {
					if (laser != null) {
						laser.p0.type = "kill"
						laserball.p0.type = "kill"
					}
				}
				if (c % i == 30) {
					if (laser != null) {
						laser.cleanup()
						laser.p0.type = ""
						parent.parent.surfaces.removeChild(laser)
						laser = null
					}
					if (laserball != null) {
						laserball.cleanup()
						laserball.p0.type = ""
						parent.parent.surfaces.removeChild(laserball)
						laserball = null
					}
					ball.fixed = false
				}
				if (c % i == i - 30) {
					pos = new Vector(parent.parent.car.patto.x, parent.parent.car.patto.y)
				}
			}
		}
		
		public function addEvent (type, func) {
			ball.addEventListener(type, func)
		}
		
		public function cleanup () {
			Global.global.mobile.setForRemoval(ball)
			removeEventListener(Event.ENTER_FRAME, drawFrame)
		}
		
		public function kill (event:Event) {
			cleanup()
			parent.removeChild(this)
		}
	}
}