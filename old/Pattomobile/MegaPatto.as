package {
	import org.cove.ape.*
	import flash.display.MovieClip
	import flash.events.Event
	import DBK.Global
	
	public class MegaPatto extends MovieClip {
		public var p0:RectangleParticle
		public var axis, max, snap
		private var e = [true, true, true, true, true]
		
		public function MegaPatto (xpos:Number, ypos:Number) {
			p0 = new RectangleParticle(xpos, ypos, 256, 350, 0, false, 1, 0)
			p0.type = "boss"
			p0.data = ["megapatto"]
			
			x = xpos
			y = ypos
			
			addEventListener(Event.ENTER_FRAME, drawFrame)
			p0.addEventListener("smash", smash)
			p0.addEventListener("extra", extra)
			Global.global.mobile.addParticle(p0)
			
			axis = 0
			snap = ypos
			max = 5
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				if (axis == 0) {
					x = p0.px
					y = p0.py = snap
					rotation += p0.velocity.x
					p0.velocity = new Vector(Math.min(p0.velocity.x + .1, max), 0)
				} else {
					x = p0.px = snap
					y = p0.py
					rotation += p0.velocity.y
					p0.velocity = new Vector(0, Math.min(p0.velocity.y + .1, max))
				}
				if (x > 4250 && e[0]) {
					p0.elasticity = -1.3
					e[0] = false
				}
				if (x > 5250 && e[1]) {
					axis = 1
					x = snap = 4625
					hitSwitch(1)
					parent.parent.lheight = 5000
					p0.angle = 90
					p0.elasticity = 0.2
					max = 5
					e[1] = false
				}
				if (y > 3000 && e[2]) {
					p0.elasticity = -1
					max = 7.5
					e[2] = false
				}
				if (y > 5250 && e[3]) {
					axis = 0
					max = 5
					y = snap = 4760
					hitSwitch(2)
					parent.parent.lwidth = 8000
					p0.angle = 0
					p0.elasticity = 0
					e[3] = false
				}
				if (x > 7750 && e[4]) {
					axis = 1
					max = 100
					x = snap = 7750
					e[4] = false
				}
				if (y > 6000) {
					parent.parent.exit(new CollisionEvent("exit", p0, parent.parent.car.leftWheel))
				}
			}
		}
		
		public function smash (event:Event) {
			event.p.mc.smash(90)
		}
		
		public function extra (event:Event) {
			event.p.mc.cleanup()
		}
		
		public function hitSwitch (id) {
			for (var i:uint = parent.parent.surfaces.numChildren; i > 0; i--) {
				parent.parent.surfaces.getChildAt(i-1).remove(id)
			}
		}
		
		public function cleanup () {
			removeEventListener(Event.ENTER_FRAME, drawFrame)
			Global.global.mobile.setForRemoval(p0)
		}
	}
}