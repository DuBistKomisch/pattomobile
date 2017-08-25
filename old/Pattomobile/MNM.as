package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import flash.filters.GlowFilter
	import DBK.Global
	
	public class MNM extends Sprite {
		public var p0:RectangleParticle
		var mnm:Sprite
		var bar:HealthBar
		var pbar:HealthBar
		var c:uint = 0
		
		public function MNM (xpos:Number, ypos:Number, bg) {
			p0 = new RectangleParticle(xpos, ypos, 100, 100, 0, false)
			p0.type = "boss"
			p0.data = ["mnm"]
			mnm = new g_minion_yellow()
			mnm.x = xpos
			mnm.y = ypos
			mnm.filters = [new GlowFilter(0xFFFFFF, 100, 20, 20, 2, 1)]
			
			addEventListener(Event.ENTER_FRAME, drawFrame)
			p0.addEventListener("", resetPos)
			p0.addEventListener("sparkb", sparkb)
			
			Global.global.mobile.addParticle(p0)
			addChild(mnm)
			bar = bg.addChild(new HealthBar(5))
			bar.x = 420
			bar.y = 10
			p0.data.push(bar)
			pbar = bg.addChild(new HealthBar(10))
			pbar.x = 10
			pbar.y = 10
			p0.data.push(pbar)
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				c++
				mnm.x = p0.px
				mnm.y = p0.py
				mnm.rotation = p0.angle
				if (c % 90 == 0) {
					if (c % 450 == 0) {
						parent.addChild(new SparkB(p0.px, p0.py-116, parent.parent.car.patto, this))
					} else {
						parent.addChild(new Spark(p0.px, p0.py-116, parent.parent.car.patto, this))
					}
				}
			}
		}
		
		public function resetPos (event:Event) {
			p0.py = 150
			p0.px = 100 + RandomSeed.nextFloat() * 1080
		}
		
		public function cleanup () {
			removeEventListener(Event.ENTER_FRAME, drawFrame)
			Global.global.mobile.setForRemoval(p0)
		}
		
		public function sparkb (event:Event) {
			if (event.p.data.track) {
				if (bar.lose()) {
					parent.parent.exit(new CollisionEvent("exit", p0, parent.parent.car.leftWheel))
				} else {
					hitSwitch(6 - bar.h)
				}
			}
		}
		
		public function hitSwitch (id) {
			for (var i:uint = parent.parent.surfaces.numChildren; i > 0; i--) {
				parent.parent.surfaces.getChildAt(i-1).remove(id)
			}
		}
	}
}