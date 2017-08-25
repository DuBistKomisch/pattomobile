/**
 *  filename: screens/extras_stuff.as
 *  author: Jake Barnes
 *  modified: 1-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import fl.controls.Button;
	
	public class extras_stuff extends Screen {
		public function extras_stuff() {
			submenu = "Extras";
			title = "Stuff";
			initTitle();
			
			menu_btn.addEventListener(MouseEvent.CLICK, back)
			editor_btn.addEventListener(MouseEvent.CLICK, openEditor)
			log_btn.addEventListener(MouseEvent.CLICK, openLog)
		}
		
		public function openEditor (event:MouseEvent = null) {
			Global.global.screen = 21;
			back();
		}
		
		public function openLog (event:MouseEvent) {
			Global.functions.openLog();
		}

		public override function fadeout() {
			// remove event listeners
			menu_btn.removeEventListener(MouseEvent.CLICK, back)
			editor_btn.removeEventListener(MouseEvent.CLICK, openEditor)
			log_btn.removeEventListener(MouseEvent.CLICK, openLog)
		}
	}
}