/**
 *  filename: HUD.as
 *  author: Jake Barnes
 *  modified: 9-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class HUD extends Sprite {
		private var title_txt:TextField;
		private var time_txt:TextField;
		
		public function HUD () {
			// make us always a clearly visible colour
			blendMode = BlendMode.INVERT;
			alpha = 0.6;
			
			title_txt = new TextField();
			title_txt.x = 10;
			title_txt.y = 10;
			title_txt.autoSize = TextFieldAutoSize.LEFT;
			title_txt.embedFonts = true;
			title_txt.defaultTextFormat = new TextFormat("hooge 06_66", 8, 0xFFFFFF);
			addChild(title_txt);
			
			time_txt = new TextField();
			time_txt.x = 630 - time_txt.width;
			time_txt.y = 10;
			time_txt.autoSize = TextFieldAutoSize.RIGHT;
			time_txt.embedFonts = true;
			time_txt.defaultTextFormat = new TextFormat("hooge 06_66", 8, 0xFFFFFF, null, null, null, null, null, TextFormatAlign.RIGHT);
			addChild(time_txt);
		}
		
		public function setTitle (text:String) {
			//title_txt.text = text;
		}
		
		public function unload () {
			removeChild(title_txt);
			title_txt = null;
			
			removeChild(time_txt);
			time_txt = null;
		}
	}
}