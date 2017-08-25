/**
 *  filename: screens/options_general.as
 *  author: Jake Barnes
 *  modified: 7-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.HTTPStatusEvent;
	import flash.events.MouseEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.text.TextField;
	import fl.controls.Button;
	import fl.controls.CheckBox;
	import fl.controls.TextInput;
	import g.updating;
	
	public class options_general extends Screen {
		//replay settings
		private var cbls:Array = ["death", "win", "reset", "exit"];
		private var death_cb:CheckBox = new CheckBox();
		private var win_cb:CheckBox = new CheckBox();
		private var reset_cb:CheckBox = new CheckBox();
		private var exit_cb:CheckBox = new CheckBox();
		//top-right checkboxes
		private var update_cb:CheckBox = new CheckBox();
		private var loop_cb:CheckBox = new CheckBox();
		//online settings
		private const idleText:String = "Connection Idle"
		private var uc:uint = 0
		private var username_txt:TextInput = new TextInput()
		private var password_txt:TextInput = new TextInput()
		private var test_btn:Button = new Button()
		private var create_btn:Button = new Button()
		private var idle:Boolean = true
		private var loader:URLLoader = new URLLoader()
		private var request:URLRequest = new URLRequest(Global.domain + "pm2.php")
		private var httpStatus:uint = 0
		
		public function options_general () {
			submenu = "Options"
			title = "General"
			initTitle()
			
			for (var i:uint = cbls.length; i > 0; i--) {
				var cb:CheckBox = this[cbls[i-1]+"_cb"]
				cb.x = 95
				cb.y = 78 + (i-1) * 20
				cb.label = ""
				cb.selected = Global.getData("replay_"+cbls[i-1])
				cb.addEventListener(Event.CHANGE, replayCheck)
				cb.name = cbls[i-1]
				cb.tabIndex = i
				addChild(cb)
			}
			
			update_cb.x = 525
			update_cb.y = 78
			update_cb.label = ""
			update_cb.selected = Global.getData("update_check")
			update_cb.addEventListener(Event.CHANGE, updateCheck)
			update_cb.tabIndex = 6
			addChild(update_cb)
			
			loop_cb.x = 525;
			loop_cb.y = 98;
			loop_cb.label = "";
			loop_cb.selected = Global.getData("loop_replay");
			loop_cb.addEventListener(Event.CHANGE, loopCheck);
			loop_cb.tabIndex = 7;
			addChild(loop_cb);
			
			updating.visible = false
			updating.addEventListener(Event.ENTER_FRAME, spinUpdating)
			addChild(updating)
			updating_txt.text = idleText
			
			username_txt.x = password_txt.x = 140
			username_txt.y = 220
			password_txt.y = 250
			username_txt.maxChars = password_txt.maxChars = 16
			username_txt.restrict = password_txt.restrict = "a-zA-Z0-9_\- "
			password_txt.displayAsPassword = true
			username_txt.text = Global.getData("username")
			password_txt.text = Global.getData("password")
			username_txt.addEventListener(Event.CHANGE, changeText)
			password_txt.addEventListener(Event.CHANGE, changeText)
			username_txt.addEventListener(FocusEvent.FOCUS_IN, Global.functions.stealFocus)
			password_txt.addEventListener(FocusEvent.FOCUS_IN, Global.functions.stealFocus)
			username_txt.addEventListener(FocusEvent.FOCUS_OUT, Global.functions.returnFocus)
			password_txt.addEventListener(FocusEvent.FOCUS_OUT, Global.functions.returnFocus)
			addChild(username_txt)
			addChild(password_txt)
			
			test_btn.x = 250
			test_btn.y = 218
			test_btn.label = "Test Login"
			test_btn.addEventListener(MouseEvent.CLICK, testLogin)
			test_btn.enabled = false
			addChild(test_btn)
			
			create_btn.x = 250
			create_btn.y = 248
			create_btn.label = "Create User"
			create_btn.addEventListener(MouseEvent.CLICK, createUser)
			create_btn.enabled = false
			addChild(create_btn)
			
			loader.addEventListener(HTTPStatusEvent.HTTP_STATUS, loaderHTTP)
			loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, loaderSecurity)
			loader.addEventListener(IOErrorEvent.IO_ERROR, loaderIOError)
			loader.addEventListener(Event.COMPLETE, loaderComplete)
			request.method = URLRequestMethod.POST
			
			settings_btn.addEventListener(MouseEvent.CLICK, resetSettings)
			savefiles_btn.addEventListener(MouseEvent.CLICK, resetSaveFiles)
			replays_btn.addEventListener(MouseEvent.CLICK, resetReplays)
			everything_btn.addEventListener(MouseEvent.CLICK, resetEverything)
			
			menu_btn.addEventListener(MouseEvent.CLICK, back)
			reset_btn.addEventListener(MouseEvent.CLICK, resetAll)
		}
		
		private function changeText (event:Event = null) {
			test_btn.enabled = (username_txt.text.length >= 3 && password_txt.text.length >= 3)
			create_btn.enabled = false
			updating_txt.text = idleText
		}
		
		private function loaderHTTP (event:HTTPStatusEvent) {
			httpStatus = event.status
		}
		
		private function loaderSecurity (event:SecurityErrorEvent) {
			DebugConsole.trace("url request failed: " + event.text, 1)
			updating_txt.text = "Request Failed!\n"+event.text+"\nHTTP Status: "+httpStatus
			finishRequest()
		}
		
		private function loaderIOError (event:IOErrorEvent) {
			DebugConsole.trace("url request failed: " + event.text, 1)
			updating_txt.text = "Request Failed!\n"+event.text+"\nHTTP Status: "+httpStatus
			finishRequest()
		}
		
		private function loaderComplete (event:Event) {
			try {
				var d:URLVariables = new URLVariables(loader.data)
				if (d.error == "true") {
					DebugConsole.trace("url request failed: " + d.message, 1)
					updating_txt.text = "Server Error!\n" + d.message + "\nHTTP Status: "+httpStatus
				} else if (d.action == "test") {
					if (d.exists == "true") {
						updating_txt.text = "This user exists!"
						if (d.pwmatch == "true") {
							updating_txt.appendText("\nLogged in successfully.\nThe settings have been saved.")
							Global.setData("username", d.username)
							Global.setData("password", d.password)
							test_btn.enabled = false
						} else {
							updating_txt.appendText("\nIncorrect password entered.\nPlease try again.")
							test_btn.enabled = false
						}
					} else {
						updating_txt.text = "This user does not exist!\nClick on 'Create User' if you\nwant to make this account."
						test_btn.enabled = false
						create_btn.enabled = true
					}
				} else if (d.action == "create") {
					if (d.success == "true") {
						updating_txt.text = "User created successfully.\nThe settings have been saved."
						Global.setData("username", d.username)
						Global.setData("password", d.password)
						create_btn.enabled = false
					} else {
						updating_txt.text = "Couldn't create user.\n" + d.message
						create_btn.enabled = false
					}
				} else {
					updating_txt.text = "Server Error!\nInvalid Returned Data?\nHTTP Status: "+httpStatus
				}
			} catch (error:Error) {
				DebugConsole.trace("url request failed: " + error.message, 1)
				updating_txt.text = "Error Processing Request!\n"+error.message
			}
			finishRequest()
		}
		
		private function testLogin (event:MouseEvent) {
			if (idle) {
				request.data = new URLVariables("action=test&username="+username_txt.text+"&password="+password_txt.text)
				try {
					loader.load(request)
					startRequest()
					test_btn.label = "(Cancel)"
					updating_txt.text = "Performing Test Login..."
				} catch (error:Error) {
					DebugConsole.trace("url request failed: " + error.message, 1)
					updating_txt.text = "Request Failed!\n"+error.message
				}
			} else {
				updating_txt.text = idleText
				finishRequest()
			}
		}
		
		private function createUser (event:MouseEvent) {
			if (idle) {
				request.data = new URLVariables("action=create&username="+username_txt.text+"&password="+password_txt.text)
				try {
					loader.load(request)
					startRequest()
					create_btn.label = "(Cancel)"
					updating_txt.text = "Creating User..."
				} catch (error:Error) {
					DebugConsole.trace("url request failed: " + error.message, 1)
					updating_txt.text = "Request Failed!\n"+error.message
				}
			} else {
				updating_txt.text = idleText
				finishRequest()
			}
		}
		
		private function startRequest () {
			username_txt.enabled = false
			password_txt.enabled = false
			idle = false
			updating.visible = true
		}
		
		private function finishRequest () {
			username_txt.enabled = true
			password_txt.enabled = true
			test_btn.label = "Test Login"
			create_btn.label = "Create User"
			idle = true
			updating.visible = false
			try { loader.close() } catch (error:Error) {}
			request = new URLRequest(Global.domain + "pm2.php")
			request.method = URLRequestMethod.POST
		}
		
		private function spinUpdating (event:Event) {
			uc++
			if (updating.visible) {
				if (uc % 5 == 0) updating.rotation += 45
				updating.alpha = uc / 30
			} else updating.rotation = uc = 0
		}
		
		private function updateCheck (event:Event) {
			Global.setData("update_check", event.target.selected)
		}
		
		private function loopCheck (event:Event) {
			Global.setData("loop_replay", event.target.selected)
		}
		
		private function replayCheck (event:Event) {
			Global.setData("replay_"+event.target.name, event.target.selected)
		}
		
		private function resetSettings (event:MouseEvent) {
			Global.functions.defaultKeys(false)
			Global.functions.setQuality(2)
			Global.setData("animate_titles", true)
			Global.setData("animate_mbs", true)
			Global.setData("animate_screens", true)
			Global.setData("volume_bgm", 0.8)
			Global.setData("volume_sfx", 1)
			Global.setData("en_bgm", true)
			Global.setData("en_sfx", true)
			Global.setData("en_stereo", true)
			Global.setData("en_pan", true)
			resetAll()
			MusicManager.updateVolume()
		}
		
		private function resetSaveFiles (event:MouseEvent) {
			Global.so.data.save = new Array();
			Global.so.flush();
			savefiles_btn.enabled = false;
		}
		
		private function resetReplays (event:MouseEvent) {
			Global.so.data.save = new Array();
			Global.so.flush();
			replays_btn.enabled = false;
		}
		
		private function resetEverything (event:MouseEvent) {
			Global.so.clear();
			Global.so.flush();
			Global.functions.quit();
		}
		
		private function resetAll (event:MouseEvent = null) {
			death_cb.selected = Global.setData("replay_death", false)
			win_cb.selected = Global.setData("replay_win", true)
			reset_cb.selected = Global.setData("replay_reset", false)
			exit_cb.selected = Global.setData("replay_exit", false)
			update_cb.selected = Global.setData("update_check", true)
			loop_cb.selected = Global.setData("loop_replay", true)
			try { loader.close() } catch (error:Error) {}
			username_txt.text = Global.setData("username", "")
			password_txt.text = Global.setData("password", "")
			updating_txt.text = idleText
			updating.visible = false
		}
		
		public override function fadeout () {
			menu_btn.removeEventListener(MouseEvent.CLICK, back)
			reset_btn.removeEventListener(MouseEvent.CLICK, resetAll)
			for (var i:uint = 0; i < cbls.length; i++) this[cbls[i]+"_cb"].removeEventListener(Event.CHANGE, replayCheck)
			update_cb.removeEventListener(Event.CHANGE, updateCheck)
			loop_cb.removeEventListener(Event.CHANGE, loopCheck)
			updating.removeEventListener(Event.ENTER_FRAME, spinUpdating)
			username_txt.removeEventListener(Event.CHANGE, changeText)
			password_txt.removeEventListener(Event.CHANGE, changeText)
			username_txt.removeEventListener(FocusEvent.FOCUS_IN, Global.functions.stealFocus)
			password_txt.removeEventListener(FocusEvent.FOCUS_IN, Global.functions.stealFocus)
			username_txt.removeEventListener(FocusEvent.FOCUS_OUT, Global.functions.returnFocus)
			password_txt.removeEventListener(FocusEvent.FOCUS_OUT, Global.functions.returnFocus)
			test_btn.removeEventListener(MouseEvent.CLICK, testLogin)
			create_btn.removeEventListener(MouseEvent.CLICK, createUser)
			if (!idle) { loader.close(); idle = true }
			loader.removeEventListener(HTTPStatusEvent.HTTP_STATUS, loaderHTTP)
			loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, loaderSecurity)
			loader.removeEventListener(IOErrorEvent.IO_ERROR, loaderIOError)
			loader.removeEventListener(Event.COMPLETE, loaderComplete)
			settings_btn.removeEventListener(MouseEvent.CLICK, resetSettings)
			savefiles_btn.removeEventListener(MouseEvent.CLICK, resetSaveFiles)
			replays_btn.removeEventListener(MouseEvent.CLICK, resetReplays)
			everything_btn.removeEventListener(MouseEvent.CLICK, resetEverything)
		}
		
		public override function unload () {
			// remove display objects
			for (var i:uint = 0; i < cbls.length; i++) removeChild(this[cbls[i]+"_cb"]);
			removeChild(update_cb);
			removeChild(loop_cb);
			removeChild(username_txt);
			removeChild(password_txt);
			removeChild(test_btn);
			removeChild(create_btn);
			// nullify remaining objects
			death_cb = win_cb = reset_cb = exit_cb = high_cb = update_cb = null;
			username_txt = password_txt = null;
			test_btn = create_btn = null;
			loader = null;
			request = null;
			cbls = cbrs = null;
			// super
			super.unload();
		}
	}
}