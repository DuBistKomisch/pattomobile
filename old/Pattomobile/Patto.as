package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import flash.ui.Keyboard
	import flash.net.SharedObject
	import DBK.Global
	
	public class Patto extends Sprite {
		public var ball:CircleParticle
		var so:SharedObject
		public var control:Boolean = false
		
		public function Patto (xpos:Number, ypos:Number) {
			so = SharedObject.getLocal("pattomobile", "/")
			ball = new CircleParticle(xpos, ypos, 30, false)
			ball.type = "patto"
			Global.global.mobile.addParticle(ball)
			patto.x = ball.px
			patto.y = ball.py
			patto.rotation += ball.velocity.x
			addEventListener(Event.ENTER_FRAME, drawFrame)
			addEvent("boss", boss)
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				if (control) {
					if (Global.global.replay) {
						if (Global.global.fdata[0] == "1") {
							if (ball.velocity.x > -20) ball.velocity = ball.velocity.plus(new Vector(-.5, 0))
						} 
						if (Global.global.fdata[1] == "1") {
							if (ball.velocity.x < 20) ball.velocity = ball.velocity.plus(new Vector(.5, 0))
						}
						if (Global.global.fdata[3] == "1") {
							if (ball.velocity.y < 20) ball.velocity = ball.velocity.plus(new Vector(0, .5))
						}
						if (Global.global.fdata[2] == "1") {
							ball.velocity = ball.velocity.plus(new Vector(0, -.5))
						}
					} else {
						if (Global.global.key.isDown(so.data.key1)) {
							if (ball.velocity.x > -20) ball.velocity = ball.velocity.plus(new Vector(-.5, 0))
						} 
						if (Global.global.key.isDown(so.data.key2)) {
							if (ball.velocity.x < 20) ball.velocity = ball.velocity.plus(new Vector(.5, 0))
						}
						if (Global.global.key.isDown(so.data.key4)) {
							if (ball.velocity.y < 20) ball.velocity = ball.velocity.plus(new Vector(0, .5))
						}
						if (Global.global.key.isDown(so.data.key3)) {
							ball.velocity = ball.velocity.plus(new Vector(0, -.5))
						}
					}
				}
				
				patto.x = ball.px
				patto.y = ball.py
				patto.rotation += ball.velocity.x
			}
		}
		
		public function addEvent (type, func) {
			ball.addEventListener(type, func)
		}
		
		public function cleanup () {
			removeEventListener(Event.ENTER_FRAME, drawFrame)
			Global.global.mobile.setForRemoval(ball)
		}
		
		private function boss (event:Event) {
			switch (event.p.data[0]) {
				case "bgm":
					if (event.s.velocity.magnitude() - event.p.velocity.magnitude() > 0) {
						if (event.p.data[1].lose()) {
							parent.exit(new CollisionEvent("exit", event.p, parent.car.leftWheel))
							parent.exit(new CollisionEvent("exit", event.p, ball))
						} else {
							event.p.velocity = new Vector(-event.p.velocity.x, -event.p.velocity.y).normalize().multEquals(10)
						}
					} else {
						if (event.p.data[2].lose()) {
							parent.death(new CollisionEvent("kill", event.p, ball))
						} else {
							event.p.velocity = new Vector(-event.p.velocity.x, -event.p.velocity.y).normalize().multEquals(30)
						}
					}
					break
			}
		}
	}
}