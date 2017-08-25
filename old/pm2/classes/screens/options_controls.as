/**
 *  filename: screens/options_controls.as
 *  author: Jake Barnes
 *  modified: 1-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.events.MouseEvent
	import flash.events.TimerEvent
	import flash.events.KeyboardEvent
	import fl.controls.Button
	import flash.utils.Timer
	import flash.ui.Keyboard
	
	public class options_controls extends Screen {
		private var selected:Button
		private var timer:Timer = new Timer(1000, 5)
		private var rtbs:Array = new Array()
		
		public function options_controls () {
			submenu = "Options"
			title = "Controls"
			initTitle()
			
			var btns:Array = ["escape", "quit", "debug", "mute", "help", "fullscreen", "quality", "pause"]
			for (var i:uint = 0; i < btns.length; i++) {
				var btn:Button = new Button()
				btn.move(46, 72 + i * 30)
				btn.setSize(80, 22)
				btn.name = "key_" + btns[i]
				if (btns[i] == "quality") btn.label = Util.getKeyLabel(Global.getData("key_low")) + " / " + Util.getKeyLabel(Global.getData("key_medium")) + " / " + Util.getKeyLabel(Global.getData("key_high")) + " / " + Util.getKeyLabel(Global.getData("key_best"))
				else if (btns[i] == "pause") btn.label = Util.getKeyLabel(Global.getData("key_pause1")) + " / " + Util.getKeyLabel(Global.getData("key_pause2"))
				else btn.label = Util.getKeyLabel(Global.getData("key_"+btns[i]))
				btn.enabled = false
				rtbs.push(addChild(btn))
			}
			
			btns = ["left", "right", "up", "down", "swap", "primary", "secondary", "cycle", "reset"]
			for (i = 0; i < btns.length; i++) {
				btn = new Button()
				btn.move(516, 72 + i * 30)
				btn.setSize(80, 22)
				btn.toggle = true
				btn.name = "key_" + btns[i]
				btn.label = Util.getKeyLabel(Global.getData(btn.name))
				btn.addEventListener(MouseEvent.CLICK, clickButton)
				rtbs.push(addChild(btn))
			}
			
			menu_btn.addEventListener(MouseEvent.CLICK, back)
			reset_btn.addEventListener(MouseEvent.CLICK, resetAll)
		}
		
		private function clickButton (event:MouseEvent) {
			disableTimer()
			if (event.target.selected) {
				if (selected) resetSelected()
				selected = event.target
				selected.label = Util.getKeyLabel(Global.getData(selected.name)) + " (" + (timer.repeatCount) + ")"
				timer.addEventListener(TimerEvent.TIMER, countDown)
				timer.addEventListener(TimerEvent.TIMER_COMPLETE, timerComplete)
				timer.start()
				KeyDown.setGlobal(bindKey, true)
			} else resetSelected()
		}
		
		private function countDown (event:TimerEvent) {
			selected.label = Util.getKeyLabel(Global.getData(selected.name)) + " (" + (timer.repeatCount - timer.currentCount) + ")"
		}
		
		private function timerComplete (event:TimerEvent) {
			disableTimer()
			resetSelected()
		}
		
		private function bindKey (event:KeyboardEvent) {
			Global.setData(selected.name, event.keyCode)
			disableTimer()
			resetSelected()
		}
		
		private function resetSelected () {
			selected.label = Util.getKeyLabel(Global.getData(selected.name))
			selected.selected = false
			selected = null
		}
		
		private function disableTimer () {
			timer.reset()
			timer.removeEventListener(TimerEvent.TIMER, countDown)
			timer.removeEventListener(TimerEvent.TIMER_COMPLETE, timerComplete)
			KeyDown.setGlobal(null, true)
		}
		
		private function resetAll (event:MouseEvent) {
			disableTimer()
			if (selected) resetSelected()
			Global.functions.defaultKeys(false)
			//refresh all button labels
			var btns:Array = ["escape", "quit", "debug", "mute", "help", "fullscreen", "left", "right", "up", "down", "swap", "primary", "secondary", "cycle", "reset"]
			for (var i:uint = 0; i < btns.length; i++) getChildByName("key_"+btns[i]).label = Util.getKeyLabel(Global.getData("key_"+btns[i]))
			getChildByName("key_quality").label = Util.getKeyLabel(Global.getData("key_low")) + " / " + Util.getKeyLabel(Global.getData("key_medium")) + " / " + Util.getKeyLabel(Global.getData("key_high")) + " / " + Util.getKeyLabel(Global.getData("key_best"))
			getChildByName("key_pause").label = Util.getKeyLabel(Global.getData("key_pause1")) + " / " + Util.getKeyLabel(Global.getData("key_pause2"))
		}
		
		public override function fadeout () {
			disableTimer()
			if (selected) resetSelected()
			//remove event listeners
			menu_btn.removeEventListener(MouseEvent.CLICK, back)
			reset_btn.removeEventListener(MouseEvent.CLICK, resetAll)
			//nullify remaining objects
			timer = null
		}
		
		public override function unload () {
			//remove buttons created at runtime
			while (rtbs.length) {
				rtbs[0].removeEventListener(MouseEvent.CLICK, clickButton)
				removeChild(rtbs[0])
				rtbs.splice(0, 1)
			}
			//nullify remaining objects
			btns = null;
			// super
			super.unload();
		}
	}
}