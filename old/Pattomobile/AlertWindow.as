package {
	import flash.display.MovieClip
	import flash.text.TextField
	import flash.events.MouseEvent
	import flash.display.SimpleButton
	import flash.system.fscommand
	
	public class AlertWindow extends MovieClip {
		public function AlertWindow (h, m, xpos, ypos, c) {
			close.addEventListener(MouseEvent.CLICK, closeDialog)
			heading.text = h
			message.text = m
			x = xpos
			y = ypos
			crash = c
		}
		
		public function closeDialog (event:MouseEvent) {
			parent.removeChild(this)
			if (crash) fscommand("quit")
		}
	}
}