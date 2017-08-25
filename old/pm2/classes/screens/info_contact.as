/**
 *  filename: screens/info_contact.as
 *  author: Jake Barnes
 *  modified: 1-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.events.MouseEvent
	import fl.controls.Button
	
	public class info_contact extends Screen {
		
		public function info_contact () {
			submenu = "Info"
			title = "Contact"
			initTitle()
			
			menu_btn.addEventListener(MouseEvent.CLICK, back)
		}
		
		public override function fadeout () {
			// remove event listeners
			menu_btn.removeEventListener(MouseEvent.CLICK, back)
		}
	}
}