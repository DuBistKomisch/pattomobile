package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import DBK.Global
	
	public class BGM extends Sprite {
		public var p0:RectangleParticle
		var bgm:Sprite
		var trigger:uint
		var bar:HealthBar
		var pbar:HealthBar
		
		public function BGM (xpos:Number, ypos:Number, t:uint) {
			p0 = new RectangleParticle(xpos, ypos, 100, 100, 0, false)
			p0.type = "boss"
			p0.data = ["bgm"]
			bgm = new g_minion()
			bgm.x = xpos
			bgm.y = ypos
			trigger = t
			
			addEventListener(Event.ENTER_FRAME, drawFrame)
		}
		
		private function drawFrame (event:Event) {
			if (contains(bgm) && ! Global.global.paused) {
				bgm.x = p0.px
				bgm.y = p0.py
				bgm.rotation = p0.angle
				p0.velocity = p0.velocity.plus(
					new Vector(
						Math.sin(Math.atan2(
							parent.parent.patto.patto.y - p0.py,
							parent.parent.patto.patto.x - p0.px
						)+Math.PI/2)/5,
						-Math.cos(Math.atan2(
							parent.parent.patto.patto.y - p0.py,
							parent.parent.patto.patto.x - p0.px
						)+Math.PI/2)/2
					)
				)
			}
		}
		
		public function checkTrigger(t:uint) {
			if (t == trigger) {
				Global.global.mobile.addParticle(p0)
				addChild(bgm)
				trigger = 0
				bar = parent.parent.bg.addChild(new HealthBar(15))
				bar.x = 420
				bar.y = 10
				p0.data.push(bar)
				pbar = parent.parent.bg.addChild(new HealthBar(10))
				pbar.x = 10
				pbar.y = 10
				p0.data.push(pbar)
				parent.parent.car.control = false
				parent.parent.patto.control = true
				parent.parent.lheight = Number.MAX_VALUE
			}
		}
		
		public function cleanup () {
			Global.global.fixed.setForRemoval(p0)
			removeEventListener(Event.ENTER_FRAME, drawFrame)
		}
	}
}