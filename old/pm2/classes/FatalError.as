/**
 *  filename: FatalError.as
 *  author: Jake Barnes
 *  modified: 12/7/2008
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import flash.display.MovieClip
	import flash.display.Sprite
	import flash.events.MouseEvent
	import flash.text.TextField
	
	public class FatalError extends Sprite {
		public var title_txt:TextField
		public var message_txt:TextField
		
		public function FatalError (title, message) {
			title_txt.text = title
			message_txt.text = message
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDown)
			addEventListener(MouseEvent.MOUSE_UP, mouseUp)
		}
		
		private function mouseDown (event:MouseEvent) {
			startDrag()
		}
		
		private function mouseUp (event:MouseEvent) {
			stopDrag()
		}
	}
}