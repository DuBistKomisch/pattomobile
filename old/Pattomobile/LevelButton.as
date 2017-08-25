package {
	import flash.display.MovieClip
	import flash.text.TextField
	import flash.events.MouseEvent
	
	public class LevelButton extends MovieClip {
		public var data:String
		public var a:Number
		
		public function LevelButton () {
			label.text = "-"
			gotoAndStop("locked")
			addEventListener(MouseEvent.MOUSE_OVER, hoverButton)
			addEventListener(MouseEvent.MOUSE_OUT, unhoverButton)
			addEventListener(MouseEvent.MOUSE_DOWN, pressButton)
			addEventListener(MouseEvent.MOUSE_UP, releaseButton)
		}
		
		public function setData (l:String, s:String, d:String) {
			label.text = l
			gotoAndStop(s)
			data = d
			a = back.alpha
		}
		
		public function hoverButton (event:MouseEvent) {
			if (currentLabel != "locked") {
				back.alpha = a * 0.5
			}
		}
		
		public function unhoverButton (event:MouseEvent) {
			if (currentLabel != "locked") {
				back.alpha = a
			}
		}
		
		public function pressButton (event:MouseEvent) {
			if (currentLabel != "locked") {
				back.alpha = a * 0.25
			}
		}
		
		public function releaseButton (event:MouseEvent) {
			if (currentLabel != "locked") {
				back.alpha = a * 0.5
				parent.data = data
				parent.gotoAndStop("game")
			}
		}
	}
}