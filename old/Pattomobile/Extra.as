package {
	import org.cove.ape.*
	import flash.display.MovieClip
	import flash.events.Event
	import flash.geom.Point
	import DBK.Global
	
	public class Extra extends MovieClip {
		var p0:CircleParticle
		var collected:Boolean = false
		var pos:Point
		
		public function Extra (xpos:Number, ypos:Number, r:Number, id:String) {
			p0 = new CircleParticle(xpos, ypos, r, true)
			p0.type = "extra"
			p0.data = id
			p0.mc = this
			Global.global.fixed.addParticle(p0)
			star.x = xpos
			star.y = ypos
			star.scaleX = star.scaleY = r / 50
			addEventListener(Event.ENTER_FRAME, pulseStar)
			p0.addEventListener("collect", collectExtra)
		}
		
		private function pulseStar (event:Event) {
			if (! Global.global.paused) {
				pos = new Point(star.x + parent.parent.x, star.y + parent.parent.y)
				star.visible = pos.x > -star.width / 2 && pos.x < 640 + star.width / 2 && pos.y > -star.height / 2 && pos.y < 480 + star.height / 2
				star.rotation += 2
				star.scaleX = star.scaleY = (.75 + Math.sin(star.rotation / 90 * Math.PI) / 4) * (p0.radius / 50)
				if (collected) {
					star.alpha -= 0.01
					if (star.alpha <= 0) {
						cleanup()
					}
				}
			}
		}
		
		private function collectExtra (event:Event) {
			collected = true
		}
		
		public function cleanup () {
			if (star != null) {
				removeChild(star)
				star = null
			}
			p0.removeEventListener("collect", collectExtra)
			removeEventListener(Event.ENTER_FRAME, pulseStar)
			Global.global.fixed.setForRemoval(p0)
		}
	}
}