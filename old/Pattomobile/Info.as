package {
	import flash.display.MovieClip
	import flash.text.TextField
	
	public class Info extends MovieClip {
		var onClose:Function
		var char:Array = new Array()
		
		public function Info (ep, lv, nm, desc, so) {
			char[8] = "BACKSPACE"
			char[9] = "TAB"
			char[13] = "ENTER"
			char[16] = "SHIFT"
			char[17] = "CONTROL"
			char[19] = "PAUSE"
			char[20] = "CAPS LOCK"
			char[27] = "ESCAPE"
			char[32] = "SPACE"
			char[33] = "PAGE UP"
			char[34] = "PAGE DOWN"
			char[35] = "END"
			char[36] = "HOME"
			char[37] = "LEFT"
			char[38] = "UP"
			char[39] = "RIGHT"
			char[40] = "DOWN"
			char[45] = "INSERT"
			char[46] = "DELETE"
			char[112] = "F1"
			char[113] = "F2"
			char[114] = "F3"
			char[115] = "F4"
			char[116] = "F5"
			char[117] = "F6"
			char[118] = "F7"
			char[119] = "F8"
			char[120] = "F9"
			char[121] = "F10"
			char[122] = "F11"
			char[123] = "F12"
			char[186] = "; :"
			char[187] = "= +"
			char[188] = ", <"
			char[189] = "- _"
			char[190] = ". >"
			char[191] = "/ ?"
			char[192] = "` ~"
			char[219] = "[ {"
			char[220] = "\\ |"
			char[221] = "] }"
			char[222] = "' \""
			
			heading.text = "Episode " + ep + "\nLevel " + lv + "\n\n" + nm
			heading.embedFonts = true
			desc = replaceAll("_left_", getChar(so.data.key1), desc)
			desc = replaceAll("_right_", getChar(so.data.key2), desc)
			desc = replaceAll("_space_", getChar(so.data.key10), desc)
			descript.text = desc
		}
		
		public function close (cb) {
			gotoAndPlay(90 - Math.floor(currentFrame / 2))
			onClose = cb
		}
		
		private function getChar (code:uint) {
			if (char[code] == null) {
				return String.fromCharCode(code)
			} else {
				return char[code]
			}
		}
		
		private function replaceAll(old, newStr, text) {
			var found = text.indexOf(old, 0)
			while (found > -1) {
				text = text.substr(0, found) + newStr + text.substr(found + old.length)
				found = text.indexOf(old, found + newStr.length)
			}
			return text
		}
	}
}