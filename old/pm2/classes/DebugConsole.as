/**
 *  filename: DebugConsole.as
 *  author: Jake Barnes
 *  modified: 11-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import flash.display.Sprite
	import flash.display.Stage
	import flash.system.System
	import flash.text.TextField
	import flash.text.TextFormat
	import flash.text.TextFormatAlign
	import flash.text.TextFieldAutoSize
	import flash.events.Event
	import flash.events.KeyboardEvent
	import flash.ui.Keyboard
	import flash.display.BlendMode
	import flash.utils.getTimer
	
	public class DebugConsole {
		private static var main:Sprite
		private static var status:TextField
		private static var title:TextField
		private static var output:TextField
		private static var timer:uint
		private static var rate:uint = 15
		private static var count:uint = 0
		private static var tmrs:Array = new Array()
		public static var loaded:Boolean = false
		private static const TIMER_LIFE = 6000
		
		public static function init () {
			main = new Sprite()
			main.blendMode = BlendMode.INVERT
			main.addEventListener(Event.ENTER_FRAME, drawFrame)
			Global.stage.addChild(main)
			
			status = new TextField()
			status.embedFonts = true
			status.defaultTextFormat = new TextFormat("hooge 06_55",8,0xFFFFFF,false,false,false,null,null,TextFormatAlign.RIGHT,null,null,null)
			status.selectable = false
			status.multiline = true
			status.mouseEnabled = false
			status.x = 640 - status.width
			status.autoSize = TextFieldAutoSize.RIGHT
			main.addChild(status)
			
			title = new TextField()
			title.embedFonts = true
			title.defaultTextFormat = new TextFormat("header 08_66",8,0xFFFFFF)
			title.selectable = false
			title.mouseEnabled = false
			title.autoSize = TextFieldAutoSize.LEFT
			title.text = "◊◊◊◊◊ PM2 DEBUG CONSOLE ◊◊◊◊◊"
			main.addChild(title)
			
			output = new TextField()
			output.embedFonts = true
			output.defaultTextFormat = new TextFormat("hooge 06_55",8,0xFFFFFF)
			output.selectable = false
			output.multiline = true
			output.mouseEnabled = false
			output.autoSize = TextFieldAutoSize.LEFT
			output.y = title.height
			main.addChild(output)
			
			Global.events.addEventListener(KeyboardEvent.KEY_DOWN, pressKey)
			timer = getTimer()
			loaded = true
			
			trace("debugging initialised");
		}
		
		private static function drawFrame (event:Event) {
			if (count % rate == 0) {
				status.text = "RES: " + Global.stage.stageWidth + " x " + Global.stage.stageHeight + " (" + Global.stage.stageWidth * Global.stage.stageHeight + " px)"
				status.appendText("\nMEM: " + System.totalMemory / 1024 + " kb (" + Math.round(System.totalMemory / 10485.76) / 100 + " mb)")
				status.appendText("\nFPS: " + Math.round(10000 / (getTimer() - timer)) / 10 + " (" + (getTimer() - timer) + " ms)")
				status.appendText("\n[rate:" + rate + "; -/+]")
				if (tmrs[0] < timer - TIMER_LIFE) {
					tmrs.shift()
					clearTrace()
				}
			}
			
			if (Global.stage.getChildIndex(main) != Global.stage.numChildren - 1)
				Global.stage.setChildIndex(main, Global.stage.numChildren - 1)
			timer = getTimer()
			count++
			
			if (Global.stage.stageHeight / Global.stage.stageWidth > 3 / 4) {
				main.scaleX = main.scaleY = 640 / Global.stage.stageWidth
				status.x = Global.stage.stageWidth - status.width
			} else {
				main.scaleX = main.scaleY = 480 / Global.stage.stageHeight
				status.x = 640 * Global.stage.stageHeight / 480 - status.width
			}
		}
		
		private static function pressKey (event:KeyboardEvent) {
			if (event.keyCode == 189) {
				rate = Math.max(rate - 1, 1)
				count = 0
			}
			else if (event.keyCode == 187) {
				rate = Math.min(rate + 1, Global.stage.frameRate)
				count = 0
			}
		}
		
		public static function set visible (v:Boolean) {
			main.visible = v
		}
		
		public static function trace (text:String, type:uint = 0) {
			if (!loaded) return
			
			var html:String;
			var stamp:String = Math.floor(getTimer() / 1000) + "." + getTimer() % 1000;
			stamp += Util.repeat("0", 4 - (stamp.length - stamp.indexOf(".")));
			
			switch (type) {
				case 1:
					// underline
					html = "\t<u>" + text + "</u>\u200c"
					break
				case 2:
					// bold
					html = "<b>" + text + "</b>\u200c"
					break
				case 3:
					// italic
					html = "\t<font face='italic 08_55'>" + text + "</font>\u200c"
					break
				default:
					// no style
					html = "\t" + text + "\u200c"
					break
			}
			
			output.htmlText += " [" + stamp + "]" + html
			Global.functions.log("[" + stamp + "]\t" + text + "\n")
			tmrs.push(getTimer())
		}
		
		private static function clearTrace () {
			output.htmlText = output.htmlText.substr(output.htmlText.indexOf("\u200c") + 1)
		}
	}
}