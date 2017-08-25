package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import DBK.Global
	
	public class CircleSurface extends Sprite {
		public var p0:CircleParticle
		var circ:Sprite
		var data
		var ghost:Boolean
		public var id:Number
		
		public function CircleSurface (xpos:Number, ypos:Number, r:Number, col:String, type:String, f:String, ghost = false, d = null, i:Number = 0) {
			p0 = new CircleParticle(xpos, ypos, r, f != "true")
			p0.visible = type != "fake"
			p0.type = type
			p0.data = d
			p0.mc = this
			circ = new Sprite()
			circ.graphics.beginFill(Number("0x"+col))
			circ.graphics.drawCircle(0, 0, r)
			circ.graphics.endFill()
			circ.x = xpos
			circ.y = ypos
			if (isNaN(i) || i >= 0) {
				Global.global.fixed.addParticle(p0)
				addChild(circ)
			}
			id = i
			addEventListener(Event.ENTER_FRAME, drawFrame)
			this.ghost = ghost
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				circ.x = p0.px
				circ.y = p0.py
				if (ghost && parent.parent.car != null) {
					p0.visible = parent.parent.car.sparkg == null
				}
			}
		}
		
		public function remove (i) {
			if (i == id) {
				cleanup()
				parent.removeChild(this)
			} else if (-i == id) {
				Global.global.fixed.addParticle(p0)
				addChild(circ)
			}
		}
		
		public function cleanup () {
			removeEventListener(Event.ENTER_FRAME, drawFrame)
			Global.global.fixed.setForRemoval(p0)
		}
	}
}