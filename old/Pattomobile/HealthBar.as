package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import DBK.Global
	
	public class HealthBar extends Sprite {
		var bg:Sprite
		var fill:Sprite
		public var h:Number
		var total:Number
		var cols:Array = [0xFF0000, 0xFF8000, 0xFFFF00, 0x80FF00, 0x00FF00]
		
		public function HealthBar (t) {
			bg = new Sprite()
			bg.graphics.beginFill(0x000000)
			bg.graphics.drawRect(0, 0, 210, 30)
			bg.graphics.endFill()
			addChild(bg)
			fill = new Sprite()
			fill.graphics.beginFill(0x00FF00)
			fill.graphics.drawRect(5, 5, 200, 20)
			fill.graphics.endFill()
			addChild(fill)
			total = t
			h = t
		}
		
		public function lose () {
			h = Math.max(h - 1, 0)
			fill.graphics.clear()
			fill.graphics.beginFill(cols[Math.floor(h/total*5)])
			fill.graphics.drawRect(5, 5, 200 * (h/total), 20)
			fill.graphics.endFill()
			return h == 0
		}
		
		public function cleanup () {
			//for OOD only
		}
	}
}