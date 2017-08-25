/**
 *  filename: screens/info_credits.as
 *  author: Jake Barnes
 *  modified: 12-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.events.MouseEvent
	import fl.controls.Button
	
	public class info_credits extends Screen {
		
		public function info_credits () {
			submenu = "Info"
			title = "Credits"
			initTitle()
			
			credits_txt.htmlText = [
"&nbsp;<b>DBK Media</b>",
"Jake Barnes",
"Thai Phan",
"David Stojanovski",
"",
"&nbsp;<b>Beta Testers</b>",
"Thomas Bishop",
"<i>(awaiting consent for more)</i>",
"",
"&nbsp;<b>Audio Contributions</b>",
"Suresh Haikerwal - <i>theme song</i>"
].join("<br />")
			
			menu_btn.addEventListener(MouseEvent.CLICK, back)
		}
		
		public override function fadeout () {
			// remove event listeners
			menu_btn.removeEventListener(MouseEvent.CLICK, back)
		}
	}
}