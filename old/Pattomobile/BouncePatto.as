package {
	import org.cove.ape.*
	import flash.display.MovieClip
	import flash.events.Event
	import flash.geom.Point
	import DBK.Global
	
	public class BouncePatto extends MovieClip {
		public var ball:CircleParticle
		
		public function BouncePatto (xpos:Number, ypos:Number, xvel:Number, yvel:Number) {
			ball = new CircleParticle(xpos, ypos, 30, false, 1, 0.7)
			ball.type = "bouncepatto"
			ball.velocity = new Vector(xvel, yvel)
			Global.global.mobile.addParticle(ball)
			patto.x = ball.px
			patto.y = ball.py
			patto.rotation += ball.velocity.x
			addEventListener(Event.ENTER_FRAME, drawFrame)
			addEvent("kill", kill)
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				pos = new Point(patto.x + parent.parent.x, patto.y + parent.parent.y)
				patto.visible = pos.x > -patto.width / 2 && pos.x < 640 + patto.width / 2 && pos.y > -patto.height / 2 && pos.y < 480 + patto.height / 2
				patto.x = ball.px
				patto.y = ball.py
				patto.rotation += ball.velocity.x
				if (ball.velocity.magnitude() > 20) {
					ball.velocity = ball.velocity.normalize()
					ball.velocity = ball.velocity.multEquals(20)
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
			event.p.mc.cleanup()
			event.p.mc.parent.removeChild(event.p.mc)
		}
	}
}