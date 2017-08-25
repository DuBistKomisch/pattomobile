package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import DBK.Global
	
	public class MoveRectangle extends Sprite {
		var p0:RectangleParticle
		var rect:Sprite
		var vel:Vector
		var minx,maxx,miny,maxy
		var mode:String
		public var id:Number
		
		public function MoveRectangle (xpos:Number, ypos:Number, w:Number, h:Number, rot:Number, col:String, mnx:Number, mxx:Number, mny:Number, mxy:Number, dir:Number, speed:Number, m:String, i:Number) {
			p0 = new RectangleParticle(xpos, ypos, w, h, rot/180*Math.PI, true)
			p0.type = "kill"
			rect = new Sprite()
			rect.graphics.beginFill(Number("0x"+col))
			rect.graphics.drawRect(-w/2, -h/2, w, h)
			rect.graphics.endFill()
			rect.x = xpos
			rect.y = ypos
			rect.rotation = rot
			if (isNaN(i) || i >= 0) {
				Global.global.fixed.addParticle(p0)
				addChild(rect)
			}
			addEventListener(Event.ENTER_FRAME, drawFrame)
			vel = new Vector(Math.sin(dir/180*Math.PI)*speed, -Math.cos(dir/180*Math.PI)*speed)
			minx = mnx
			maxx = mxx
			miny = mny
			maxy = mxy
			id = i
			mode = m.substr(0, 1)
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				p0.px += vel.x
				p0.py += vel.y
				if (mode == "r") {
					if (p0.px > maxx || p0.px < minx) {
						vel.x = -vel.x
					}
					if (p0.py > maxy || p0.py < miny) {
						vel.y = -vel.y
					}
				} else {
					if (p0.px > maxx) {
						p0.px = minx + (p0.px - maxx)
					} else if (p0.px < minx) {
						p0.px = maxx - (minx - p0.px)
					}
					if (p0.py > maxy) {
						p0.py = miny + (p0.py - maxy)
					} else if (p0.py < miny) {
						p0.py = maxy - (miny - p0.py)
					}
				}
				rect.x = p0.px
				rect.y = p0.py
				rect.rotation = p0.angle
			}
		}
		
		public function remove (i) {
			if (i == id) {
				cleanup()
				parent.removeChild(this)
			} else if (-i == id) {
				Global.global.fixed.addParticle(p0)
				addChild(rect)
				Global.global.fixed._particles.sort(parent.parent.arrangeParticles)
			}
		}
		
		public function cleanup () {
			removeEventListener(Event.ENTER_FRAME, drawFrame)
			Global.global.fixed.setForRemoval(p0)
		}
	}
}