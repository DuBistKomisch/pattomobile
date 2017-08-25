/**
 *  filename: screens/play_cutscene.as
 *  author: Jake Barnes
 *  modified: 8-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.display.BlendMode;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	
	public class play_cutscene extends Screen {
		private var cutscene:MovieClip;
		private var watermark:TextField;
		
		public function play_cutscene() {
			// load cutscene
			cutscene = Global.packs[Global.global.cutscene[0]].getCutscene(Global.global.cutscene[1]);
			cutscene.gotoAndStop(0);
			addChild(cutscene);
			
			// add watermark
			watermark = new TextField();
			watermark.width = 630;
			watermark.embedFonts = true;
			watermark.defaultTextFormat = new TextFormat("header 08_66", 8, 0xFFFFFF, false, false, false, null, null, TextFormatAlign.RIGHT);
			watermark.blendMode = BlendMode.INVERT;
			watermark.text = "PRESS END TO SKIP";
			watermark.autoSize = TextFieldAutoSize.RIGHT;
			watermark.y = 470 - watermark.height;
			watermark.alpha = 0.25;
			addChild(watermark);
			
			// stop playing music
			MusicManager.setMusic();
			
			// hide mouse
			Mouse.hide();
		}
		
		public override function fadein () {
			// tell us when to stop, last frame reached and pressing the end key
			cutscene.addEventListener(Event.EXIT_FRAME, cutsceneFrame);
			Global.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyEnd);
			
			// start playing cutscene
			cutscene.play();
		}
		
		private function cutsceneFrame (event:Event) {
			// have we reached the final frame of our cutscene?
			if (cutscene.currentFrame == cutscene.totalFrames - 1)
				donePlaying()
		}
		
		private function keyEnd (event:KeyboardEvent) {
			// have we pressed end?
			if (event.keyCode == Keyboard.END)
				donePlaying();
		}
		
		private function donePlaying () {
			cutscene.stop();
			if (Global.global.cutscene[2]) {
				if (Global.global.cutscene[1] == Global.packs[Global.global.cutscene[0]].length) {
					// finished level pack -> play_select
					toScreen(20);
				} else {
					// continue playing -> gameplay
					level_normal(Global.global.cutscene[1], Global.global.cutscene[0]);
				}
			} else {
				// didn't come from gameplay -> extras_cutscenes
				toScreen(8);
			}
		}

		public override function fadeout () {
			cutscene.stop();
			cutscene.removeEventListener(Event.EXIT_FRAME, cutsceneFrame);
			Global.stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyEnd);
		}
		
		public override function unload () {
			// get rid of cutscene
			removeChild(cutscene);
			cutscene = null;
			
			// get rid of watermark
			removeChild(watermark);
			watermark = null;
			
			// show mouse
			Mouse.show();
		}
	}
}