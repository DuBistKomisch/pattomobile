/**
 *  filename: Util.as
 *  author: Jake Barnes
 *  modified: 11-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import flash.display.StageQuality;
	import flash.geom.Point;
	
	public class Util {
		private static var key:Array = new Array()
		
		public static function init () {
			key[8] = "BACKSPACE"
			key[9] = "TAB"
			key[13] = "ENTER"
			key[16] = "SHIFT"
			key[17] = "CONTROL"
			key[19] = "PAUSE"
			key[20] = "CAPS LOCK"
			key[27] = "ESCAPE"
			key[32] = "SPACE"
			key[33] = "PAGE UP"
			key[34] = "PAGE DOWN"
			key[35] = "END"
			key[36] = "HOME"
			key[37] = "LEFT"
			key[38] = "UP"
			key[39] = "RIGHT"
			key[40] = "DOWN"
			key[45] = "INSERT"
			key[46] = "DELETE"
			key[96] = "NUMPAD 0"
			key[97] = "NUMPAD 1"
			key[98] = "NUMPAD 2"
			key[99] = "NUMPAD 3"
			key[100] = "NUMPAD 4"
			key[101] = "NUMPAD 5"
			key[102] = "NUMPAD 6"
			key[103] = "NUMPAD 7"
			key[104] = "NUMPAD 8"
			key[105] = "NUMPAD 9"
			key[111] = "NUMPAD /"
			key[106] = "NUMPAD *"
			key[109] = "NUMPAD -"
			key[107] = "NUMPAD +"
			key[110] = "NUMPAD ."
			key[112] = "F1"
			key[113] = "F2"
			key[114] = "F3"
			key[115] = "F4"
			key[116] = "F5"
			key[117] = "F6"
			key[118] = "F7"
			key[119] = "F8"
			key[120] = "F9"
			key[121] = "F10"
			key[122] = "F11"
			key[123] = "F12"
			key[144] = "NUM LOCK"
			key[145] = "SCROLL LOCK"
			key[186] = "; :"
			key[187] = "= +"
			key[188] = ", <"
			key[189] = "- _"
			key[190] = ". >"
			key[191] = "/ ?"
			key[192] = "` ~"
			key[219] = "[ {"
			key[220] = "\\ |"
			key[221] = "] }"
			key[222] = "' \""
		}
		
		//get the display name of a key code
		public static function getKeyLabel (code:uint):String {
			if (key[code] == null) {
				return String.fromCharCode(code)
			} else {
				return key[code]
			}
		}
		
		//replace all instances of 'old' with 'newStr' in 'text'
		public static function replaceAll(old, newStr, text):String {
			return text.replace(new RegExp(old,"g"), newStr)
		}
		
		// pack a vector of boolean values into the bits of a uint
		// the value at v[0] will end up in the left-most bit and v[v.length-1] right-most
		public static function packBoolean (v:Vector.<Boolean>):uint {
			var p:uint = 0;
			for (var i:uint = 0; i < v.length; i++)
				p = (p << 1) | uint(v[i]);
			return p;
		}
		
		// does the opposite job of packBoolean(), turning a uint into a vector of boolean values
		// the left-most bit of p will end up in v[0] and the right-most in v[v.length-1]
		public static function unpackBoolean (p:uint, l:uint = 0):Vector.<Boolean> {
			var v:Vector.<Boolean> = new Vector.<Boolean>();
			for (var n:uint = 0; n < l; n++) {
				v.push(Boolean(p & 1));
				p = p >> 1;
			}
			v = v.reverse();
			return v;
		}
		
		public static function getQualityString ():String {
			return [StageQuality.LOW,StageQuality.MEDIUM,StageQuality.HIGH,StageQuality.BEST][Global.getData("quality")]
		}
		
		public static function round (n:Number, p:int = 0):Number {
			return Math.round(n * Math.pow(10, p)) / Math.pow(10, p)
		}
		
		public static function hex (value:String) {
			return Number("0x"+value);
		}
		
		public static function clamp (value:Number, min:Number, max:Number):Number {
			if (value > max) return max;	
            if (value < min) return min;
            return value;
		}
		
		public static function getColour (value:String, fallback:String, colours:XML):String {
			if (value)
				return value;
			else if (String(colours.child(fallback)))
				return colours.child(fallback);
			else if (String(colours.normal))
				return colours.normal;
			else return "000000";
		}
		
		public static function deleteNode (node:XML):void {
			if (node != null && node.parent() != null)
				delete node.parent().children()[node.childIndex()];
		}
		
		public static function sign (n:Number):int {
			if (n > 0) return 1;
			if (n < 0) return -1;
			return 0;
		}
		
		public static function plural (n:Number, s:String = "s", s1:String = ""):String {
			return (n == 1 ? s1 : s);
		}
		
		public static function repeat (s:String, n:uint):String {
			var out:String = "";
			while (n) {
				out += s;
				n--;
			}
			return out;
		}
		
		public static function rotatePoint (p:Point, r:Number, radians:Boolean = false):Point {
			return Point.polar(p.length, Math.atan2(p.y, p.x) + r * (radians ? 1 : Math.PI / 180));
		}
		
		public static function framesToTime (frames:uint, fps:uint = 60) {
			var time:uint = Math.floor(frames / fps);
			var out:String = time % 60 + "s"; // seconds
			time = Math.floor(time / 60);
			if (time == 0) return out;
			out = time % 60 + "m " + out; // minutes
			time = Math.floor(time / 60);
			if (time == 0) return out;
			out = time + "h " + out; // hours
			return out;
		}
		
		public static function fileSize (s:uint):String {
			if (s < 1024) return s + " B";
			else return Util.round(s / 1024, 1) + " KiB";
		}
	}
}