package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import DBK.Global
	
	public class Exit extends Sprite {
		var p0:RectangleParticle
		
		public function Exit (xpos:Number, ypos:Number, w:Number, h:Number, rot:Number) {
			p0 = new RectangleParticle(xpos, ypos, w, h, rot/180*Math.PI, true)
			p0.type = "exit"
			Global.global.fixed.addParticle(p0)
		}
		
		public function cleanup () {
			Global.global.fixed.setForRemoval(p0)
		}
	}
}