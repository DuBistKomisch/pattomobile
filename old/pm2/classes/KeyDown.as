/**
 *  filename: KeyDown.as
 *  author: Jake Barnes
 *  modified: 20/11/2008
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import flash.display.Stage
	import flash.ui.Keyboard
	import flash.events.EventDispatcher
	import flash.events.KeyboardEvent
	import flash.events.Event
	
	public class KeyDown {
		private static var keys:Array = new Array()
		private static var hup:String = ""
		private static var hdown:String = ""
		private static var lup:Object = new Object()
		private static var ldown:Object = new Object()
		private static var gup:Function = new Function()
		private static var gdown:Function = new Function()
		private static var events:EventDispatcher
		
		public static function init () {
			Global.stage.addEventListener(KeyboardEvent.KEY_DOWN, down)
			Global.stage.addEventListener(KeyboardEvent.KEY_UP, up)
			events = new EventDispatcher(Global.stage)
		}
		
		public static function isDown (key:int):Boolean {
			return keys[key]
		}
		
		public static function addEvent (key:uint, func:Function, up:Boolean = false) {
			if (up) events.addEventListener("up"+key, func, false, 0, true)
			else events.addEventListener("down"+key, func, false, 0, true)
		}
		
		public static function removeEvent (key:uint, func:Function, up:Boolean = false) {
			if (up) events.removeEventListener("up"+key, func)
			else events.removeEventListener("down"+key, func)
		}
		
		public static function setGlobal (listener:Function = null, up:Boolean = false) {
			if (up) gup = Boolean(listener) ? listener : new Function()
			else gdown = Boolean(listener) ? listener : new Function()
		}
		
		public static function addHistoryEvent (seq:String, func:Function, up:Boolean = false) {
			if (up) lup[seq] = func
			else ldown[seq] = func
		}
		
		public static function removeHistoryEvent (seq:String, up:Boolean = false) {
			if (up) delete lup[seq]
			else delete ldown[seq]
		}
		
		private static function up (event:KeyboardEvent):void {
			hup += String.fromCharCode(event.charCode)
			if (isDown(event.keyCode)) {
				gup(event)
				events.dispatchEvent(new Event("up"+event.keyCode))
			}
			for (var seq:String in lup) if (hup.substr(-seq.length) == seq) lup[seq]()
			keys[event.keyCode] = false
		}
		
		private static function down (event:KeyboardEvent):void {
			hdown += String.fromCharCode(event.charCode)
			if (!isDown(event.keyCode)) {
				gdown(event)
				events.dispatchEvent(new Event("down"+event.keyCode))
			}
			for (var seq:String in ldown) if (hdown.substr(-seq.length) == seq) ldown[seq]()
			keys[event.keyCode] = true
		}
		
		public static function clearHistory () {
			hup = ""
			hdown = ""
		}
		
		public static function clearEvents () {
			lup = new Object()
			ldown = new Object()
			events = new EventDispatcher(Global.stage)
		}
	}
}