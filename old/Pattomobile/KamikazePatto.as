package {
	import org.cove.ape.*
	import flash.display.MovieClip
	import flash.events.Event
	import flash.geom.Point
	import DBK.Global
	
	public class KamikazePatto extends MovieClip {
		public var ball:CircleParticle
		public var vis:Vector
		public var n:uint
		public var c:uint
		public var hit:Boolean = false
		
		public function KamikazePatto (xpos:Number, ypos:Number, num:uint) {
			ball = new CircleParticle(xpos, ypos, 30, false, 1, 0.5)
			ball.type = "kamikazepatto"
			ball.data = this
			ball.fixed = true
			Global.global.mobile.addParticle(ball)
			x = ball.px
			y = ball.py
			addEventListener(Event.ENTER_FRAME, drawFrame)
			n = num
			c = 1
			addEvent("car", car)
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				x = ball.px
				y = ball.py
				if (! hit) {
					rotation += ball.velocity.x
					ball.velocity = new Vector(ball.velocity.x + (parent.parent.car.patto.x - x) / Math.abs(parent.parent.car.patto.x - x + .0001) * .1, ball.velocity.y + (parent.parent.car.patto.y - y) / Math.abs(parent.parent.car.patto.y - y + .0001) * .1)
					if (ball.velocity.magnitude() > 30) {
						ball.velocity = ball.velocity.normalize()
						ball.velocity = ball.velocity.multEquals(30)
					}
					vis = new Vector(x + parent.parent.x, y + parent.parent.y)
					if (ball.fixed && vis.x > -patto.width / 2 && vis.x < 640 + patto.width / 2 && vis.y > -patto.height / 2 && vis.y < 480 + patto.height / 2) {
						ball.velocity = new Vector(0, 0)
						ball.fixed = false
					}
				} else {
					while (currentFrame - 1 == Math.round(100 / n * c)) {
						parent.parent.surfaces.addChild(new CircleSurface(RandomSeed.nextFloat()*640 - parent.parent.x, RandomSeed.nextFloat()*480 - parent.parent.y, 25, "FF0000", "kill", "", false))
						c++
					}
					if (c > n) {
						cleanup()
						parent.removeChild(this)
					}
				}
			}
		}
		
		public function addEvent (type, func) {
			ball.addEventListener(type, func)
		}
		
		public function car (event:Event) {
			hit = true
			ball.fixed = true
			ball.visible = false
			play()
		}
		
		public function cleanup () {
			Global.global.mobile.setForRemoval(ball)
			removeEventListener(Event.ENTER_FRAME, drawFrame)
		}
	}
}