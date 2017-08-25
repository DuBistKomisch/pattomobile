/**
 *  filename: screens/info_licence.as
 *  author: Jake Barnes
 *  modified: 1-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.events.MouseEvent
	import fl.controls.Button
	
	public class info_licence extends Screen {
		
		public function info_licence () {
			submenu = "Info"
			title = "Licence"
			initTitle()
			
			menu_btn.addEventListener(MouseEvent.CLICK, back)
		}
		
		public override function fadeout () {
			// remove event listeners
			menu_btn.removeEventListener(MouseEvent.CLICK, back)
		}
	}
}