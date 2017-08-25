/**
 *  filename: MenuButton.as
 *  author: Jake Barnes
 *  modified: 7-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import events.MenuButtonEvent;
	import flash.display.Sprite
	import flash.filters.GradientBevelFilter
	import flash.filters.GlowFilter
	import flash.events.Event
	import flash.events.MouseEvent
	import flash.events.FocusEvent
	import flash.events.KeyboardEvent
	import flash.text.TextField
	import flash.text.TextFormat
	import flash.text.TextFormatAlign
	import flash.text.TextFieldAutoSize
	import flash.ui.Keyboard
	import fl.transitions.Tween
	import fl.transitions.easing.None
	
	public class MenuButton extends Sprite {
		private var circ:Sprite
		private var button:Sprite
		private var label:TextField
		private var fs:Array = new Array()
		private var c:Number = 0
		private var t:Number = 1
		private var s:Number = 0
		private var record:String = ""
		private var text:String
		private var _enabled:Boolean = false
		private var _goBack:Boolean = false
		private var bfi:Tween
		public var selected:Boolean = false
		
		public function MenuButton (ref:uint, lbl:String, xp:Number, yp:Number, ti:uint) {
			x = xp
			y = yp
			text = lbl
			
			circ = new Sprite()
			circ.graphics.beginFill(0x000000)
			circ.graphics.drawEllipse(-40, -40, 80, 80)
			circ.mouseEnabled = false
			circ.visible = false
			addChild(circ)
			
			button = Global.libs.menu.getItem(ref)
			fs.push(new GradientBevelFilter(0, 45, [0xC0C0C0, 0xFFFFFF, 0x404040], [1, 0, 1], [0, 127, 255], 0, 0, 1, 3, "full"))
			fs.push(new GlowFilter(0xFFFFFF, 1, 0, 0, 1, 3))
			button.filters = fs
			button.hitArea = circ
			button.buttonMode = true
			button.tabIndex = ti
			button.alpha = 0
			bfi = new Tween(button, "alpha", None.easeNone, 0, 1, 15)
			addChild(button)
			
			label = new TextField()
			label.embedFonts = true
			label.defaultTextFormat = new TextFormat("FFF Harmony",16,0x808080,false,false,false,null,null,TextFormatAlign.CENTER,null,null,null)
			label.filters = [new GlowFilter(0x000000, 1, 2, 2, 10, 3), new GradientBevelFilter(2, 225, [0xC0C0C0, 0xFFFFFF, 0x404040], [1, 0, 1], [0, 127, 255], 4, 4, 1, 3)]
			label.selectable = false
			label.x = -50
			label.y = 40
			label.alpha = 0
			label.autoSize = TextFieldAutoSize.CENTER
			label.text = lbl
			addChild(label)
			
			addEventListener(Event.ENTER_FRAME, drawFrame, false, 0, true)
			enabled = true
			button.addEventListener(MouseEvent.CLICK, mouseClick, false, 0, true)
			button.addEventListener(KeyboardEvent.KEY_DOWN, keyDown, false, 0, true)
		}
		
		private function drawFrame (event:Event) {
			var d = c + (t - c) * .3
			if (Math.abs(t - d) > 0.01) {
				c = d
				fs[0].distance = 2 * c
				fs[0].blurX = fs[0].blurY = 4 * c
				fs[1].blurX = fs[1].blurY = 16 * c
				button.filters = fs
				d = int(128 + Math.min(Math.max(0, c - 2), 1) * 64)
				label.setTextFormat(new TextFormat(null,null,d*256*256+d*256+d))
				label.alpha = Math.min(Math.max(0, c - 1), 1)
			}
			button.rotation += s
		}
		
		private function mouseOver (event:MouseEvent) { stage.focus = button }
		private function mouseOut (event:MouseEvent) { if (stage.focus == button) stage.focus = null }
		private function focusIn (event:FocusEvent) { t = 2 }
		private function focusOut (event:FocusEvent) { t = 1; label.setTextFormat(new TextFormat(null,null,null,false)) }
		private function mouseDown (event:MouseEvent) { t = 3; stage.focus = button; label.setTextFormat(new TextFormat(null,null,null,true)) }
		private function mouseUp (event:MouseEvent) { t = 2; stage.focus = button; label.setTextFormat(new TextFormat(null,null,null,false)) }
		
		private function keyDown (event:KeyboardEvent) {
			if (event.keyCode == Keyboard.ENTER || event.keyCode == Keyboard.SPACE) {
				mouseClick(event)
			} else if (event.charCode) {
				record += String.fromCharCode(event.charCode)
				if (record.substr(record.length - 3).toLowerCase() == "low") t = 0.1
				if (record.substr(record.length - 4).toLowerCase() == "high") t = 6
				if (record.substr(record.length - 5).toLowerCase() == "split") t = -4
				if (record.substr(record.length - 6).toLowerCase() == "normal") label.setTextFormat(new TextFormat(null,16))
				if (record.substr(record.length - 6, 4).toLowerCase() == "size") label.setTextFormat(new TextFormat(null,isNaN(Number(record.substr(record.length - 2)))?16:record.substr(record.length - 2)))
				if (record.substr(record.length - 4).toLowerCase() == "spin") s = s ? s * 2 : 1
				if (record.substr(record.length - 4).toLowerCase() == "back") s = -s
				if (record.substr(record.length - 4).toLowerCase() == "stop") s = 0
				if (record.substr(record.length - 6).toLowerCase() == "miriam") { label.text = "=_=\""; filters = [new GlowFilter(0x00C000)] }
			}
		}
		
		public function mouseClick (event:Event) {
			stage.focus = null
			if (_enabled) {
				enabled = false
				if (_goBack)
					Global.events.dispatchEvent(new MenuButtonEvent(MenuButtonEvent.BACK, button.tabIndex))
				else
					Global.events.dispatchEvent(new MenuButtonEvent(MenuButtonEvent.CLICK, button.tabIndex))
			}
		}
		
		public function set goBack (value:Boolean) {
			_goBack = value
			label.text = _goBack ? "BACK" : text
		}
		
		public function set enabled (value:Boolean) {
			_enabled = value
			if (_enabled) {
				button.addEventListener(MouseEvent.MOUSE_OVER, mouseOver, false, 0, true)
				button.addEventListener(MouseEvent.MOUSE_OUT, mouseOut, false, 0, true)
				button.addEventListener(FocusEvent.FOCUS_IN, focusIn, false, 0, true)
				button.addEventListener(FocusEvent.FOCUS_OUT, focusOut, false, 0, true)
				button.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown, false, 0, true)
				button.addEventListener(MouseEvent.MOUSE_UP, mouseUp, false, 0, true)
			} else {
				button.removeEventListener(MouseEvent.MOUSE_OVER, mouseOver)
				button.removeEventListener(MouseEvent.MOUSE_OUT, mouseOut)
				button.removeEventListener(FocusEvent.FOCUS_IN, focusIn)
				button.removeEventListener(FocusEvent.FOCUS_OUT, focusOut)
				button.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown)
				button.removeEventListener(MouseEvent.MOUSE_UP, mouseUp)
			}
		}
		
		public function get id () {
			return button.tabIndex
		}
	}
}