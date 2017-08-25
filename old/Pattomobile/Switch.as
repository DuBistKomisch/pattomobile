package {
	import org.cove.ape.*
	import flash.display.MovieClip
	import flash.events.Event
	import flash.text.TextField
	import DBK.Global
	
	public class Switch extends MovieClip {
		public var p0:CircleParticle
		public var id:Number
		public var pressed:Boolean = false
		
		public function Switch (xpos:Number, ypos:Number, i:Number) {
			label_txt.text = id = i
			x = xpos
			y = ypos
			p0 = new CircleParticle(xpos, ypos, 50, true)
			Global.global.fixed.addParticle(p0)
			p0.addEventListener("car", hitPlayer)
			p0.addEventListener("patto", hitPlayer)
		}
		
		private function hitPlayer (event:Event) {
			p0.removeEventListener("car", hitPlayer)
			p0.removeEventListener("patto", hitPlayer)
			pressed = true
			gotoAndPlay("pressed")
			
			for (var i:uint = parent.parent.surfaces.numChildren; i > 0; i--) {
				parent.parent.surfaces.getChildAt(i-1).remove(id)
			}
			for (i = parent.parent.objects.numChildren; i > 0; i--) {
				if (parent.parent.objects.getChildAt(i-1).p0.type == "boss") {
					parent.parent.objects.getChildAt(i-1).checkTrigger(id)
				}
			}
		}
		
		public function cleanup () {
			Global.global.fixed.setForRemoval(p0)
		}
	}
}