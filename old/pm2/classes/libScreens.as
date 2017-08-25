/**
 *  filename: libScreens.as
 *  author: Jake Barnes
 *  modified: 8-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import flash.display.Sprite
	import flash.text.TextRenderer
	import flash.text.FontStyle
	import flash.text.TextColorType
	import flash.text.CSMSettings
	import flash.net.SharedObject
	import screens.*
	
	public class libScreens extends Sprite {
		private var ss:Array = [options_controls, options_output, options_general,
								extras_cutscenes, null, extras_stuff,
								play_new, play_load, null,
								info_credits, info_licence, info_contact,
								null, highscores_replays, null,
								play_select, extras_ediot, play_cutscene, extras_logviewer]; // ones which aren't directly accessible
		
		public function libScreens () {
			TextRenderer.setAdvancedAntiAliasingTable("hooge 06_66",FontStyle.REGULAR,TextColorType.DARK_COLOR,[new CSMSettings(8,0.1,-0.1)])
			// debug a screen (remove after finished!)
			if (!Global.so) {
				Global.so = SharedObject.getLocal("pm2", "/")
				Global.stage = stage
				Global.functions.newGame = new Function();
				Global.functions.stealFocus = new Function();
				Global.functions.returnFocus = new Function();
				Util.init()
				KeyDown.init();
				RandomSeed.reseed()
				addChild(getScreen(16 + 5))
			}/**/
		}
		
		public function getScreen (id:uint):Screen {
			if (id > 4 && id < ss.length + 5 && ss[id - 5]) {
				return new ss[id - 5]
			} else {
				DebugConsole.trace("screen #" + id + " not found in library", 1)
				return new Screen()
			}
		}
	}
}