/**
 *  filename: Screen.as
 *  author: Jake Barnes
 *  modified: 7-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import events.PlayEvent;
	import events.ReplayEvent;
	import events.ScreenEvent;
	import flash.display.Sprite;
	import flash.utils.ByteArray;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import flash.text.TextFieldAutoSize;
	
	public class Screen extends Sprite {
		public var submenu:String = "-";
		public var title:String = "-";
		public var title_txt:TextField = new TextField();
		
		public function initTitle (ypos:Number = 25) {
			title_txt.embedFonts = true;
			title_txt.defaultTextFormat = new TextFormat("hooge 06_66",8,0xFFFFFF,null,null,null,null,null,TextFormatAlign.CENTER);
			title_txt.autoSize = TextFieldAutoSize.CENTER;
			title_txt.selectable = false;
			title_txt.text = "Pattomobile II : " + submenu + " : " + title;
			title_txt.x = 320 - title_txt.width / 2;
			title_txt.y = ypos;
			addChild(title_txt);
			title_txt.x = Math.floor(title_txt.x);
		}
		
	// --- transfer
		
		public function back (event:Event = null) {
			Global.events.dispatchEvent(new ScreenEvent(ScreenEvent.BACK));
		}
		
		public function toScreen (id:uint) {
			Global.global.screen = id;
			back();
		}
		
	// --- level
		
		public function level_normal (map:uint, pack:String) {
			Global.events.dispatchEvent(new PlayEvent(GameType.NORMAL, map, pack));
		}
		
		public function level_downloaded (map:uint) {
			Global.events.dispatchEvent(new PlayEvent(GameType.DOWNLOADED, map));
		}
		
		public function level_ediot () {
			Global.events.dispatchEvent(new PlayEvent(GameType.EDIOT));
		}
		
	// --- replay
		
		public function replay_normal (id:uint) {
			Global.events.dispatchEvent(new ReplayEvent(GameType.NORMAL, id));
		}
		
		public function replay_downloaded (id:uint) {
			Global.events.dispatchEvent(new ReplayEvent(GameType.DOWNLOADED, id));
		}
		
	// --- fadeout/unload
		
		public function fadein () {
			// nothing to do here
		}
		
		public function fadeout () {
			// nothing to do here
		}
		
		public function unload () {
			if (contains(title_txt)) removeChild(title_txt);
			title_txt = null;
		}
	}
}