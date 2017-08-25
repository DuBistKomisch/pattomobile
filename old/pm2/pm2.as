/**
 *  filename: pm2.as
 *  author: Jake Barnes
 *  modified: 11-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import air.update.ApplicationUpdaterUI;
	import air.update.events.DownloadErrorEvent;
	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.NativeWindowSystemChrome;
	import flash.display.NativeWindowType;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.filesystem.File;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.SharedObject;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.profiler.showRedrawRegions;
	import flash.system.fscommand;
	import flash.text.TextField;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import flash.utils.ByteArray;
	import flash.utils.Timer;
	import fl.transitions.easing.*;
	import fl.transitions.Tween;
	import fl.transitions.TweenEvent;
	// global events
	import events.GlobalEvent;
	import events.GameEvent;
	import events.MenuButtonEvent;
	import events.PlayEvent;
	import events.QualityEvent;
	import events.ReplayEvent;
	import events.ScreenEvent;
	import events.ToggleEvent;
	// APE
	import org.cove.ape.APEngine;
	import org.cove.ape.APEVector;
	import org.cove.ape.Group;
	// IGameObjects
	import characters.*
	import surfaces.*
	
	public class pm2 extends MovieClip {
		// general variables
		private var logViewerOptions:NativeWindowInitOptions;
		private var logViewerWindow:NativeWindow;
		private var tempLog:String = "";
		// startup variables
		private var appUpdater:ApplicationUpdaterUI;
		private var cfgs:Array = [{name:"bgm"}];
		private var configs:Array = new Array(cfgs.length);
		private var configsCount:uint = 0;
		private var assets:Array = [{name:"screens", vital:true},{name:"menu", vital:true}];
		private var packs:Array = [{name:"test"}];
		private var loaders:Array = new Array(assets.length + packs.length);
		private var loadersCount:uint = 0;
		private var introOptions:NativeWindowInitOptions;
		private var introWindow:NativeWindow;
		private var introTween:Tween;
		// // private var progressTween:Tween;
		// mainmenu variables
		private var tbmp:Bitmap;
		private var title_mc:Sprite;
		private var tdata:BitmapData;
		private var sbmp:Bitmap;
		private var subtitle_mc:Sprite;
		private var sdata:BitmapData;
		private var ttwn:Tween;
		private var stwn:Tween;
		private var tmr:Timer;
		private var clicked:Object;
		private var fades:Array;
		private var mbs:Array;
		private var lastMenu:uint = 2;
		// screen variables
		private var screen:Screen;
		private var screen_bmp:Bitmap;
		private var screen_tween:Tween;
		// game variables
		private var game:Sprite;
		private var game_mask:Sprite;
		private var game_bmp:Bitmap;
		private var game_tween:Tween;
		private var bg:Sprite;
		private var hud:HUD;
		private var layers:Array = ["below","fixed","middle","mobile","above"];
		private var data:XML;
		private var objectsList:Object = {car:Car, rectangle:RectangleSurface, circle:CircleSurface, line:LineSurface};
		private var chars:Object;
		private var control:String;
		private var gameObjects:Vector.<IGameObject>;
		private var replayData:ByteArray;
		private var seed:uint;
		// constants
		private const FADE_TIME:uint = 30;
		
		public function pm2 () {
			// make stage and application globally accessible
			Global.stage = stage;
			Global.application = NativeApplication.nativeApplication;
			
			// define global functions
			Global.functions.defaultKeys = defaultKeys; // reset key settings to default
			Global.functions.setQuality = setQuality; // change quality
			Global.functions.stealFocus = stealFocus; // stop processing global keyboard shortcuts
			Global.functions.returnFocus = returnFocus; // start processing again ^
			Global.functions.openLog = openLog; // show the log viewer window
			Global.functions.log = log; // write something to the log
			Global.functions.quit = quit; // close the application
			Global.functions.newGame = newGame; // create a new save file and load it
			Global.functions.loadGame = loadGame; // load a save file
			Global.functions.setControl = setControl; // change the control character
			Global.functions.topProgress = topProgress; // find the highest progress in a given level pack
			Global.functions.bestTime = bestTime; // find the replay with the best time for a given map/pack
			
			// prevent default behaviours of keys, e.g. escape closing fullscreen
			fscommand("trapallkeys", "true");
			
			// don't show the silly rectangle around the currently tabbed item
			stage.stageFocusRect = false;
			
			// initialise debugging
			DebugConsole.init();
			
			// create splash screen with logo
			introOptions = new NativeWindowInitOptions()
			introOptions.type = NativeWindowType.NORMAL;
			introOptions.transparent = true;
			introOptions.systemChrome = NativeWindowSystemChrome.NONE;
			introOptions.type = NativeWindowType.UTILITY;
			introWindow = new NativeWindow(introOptions);
			introWindow.title = "Loading...";
			// position window in centre of visible screen area
			introWindow.width = 400;
			introWindow.height = 300;
			var bounds:Rectangle = flash.display.Screen.mainScreen.visibleBounds;
			introWindow.x = bounds.x + bounds.width / 2 - introWindow.width / 2;
			introWindow.y = bounds.y + bounds.height / 2 - introWindow.height / 2;
			// add logo and open window
			introWindow.stage.scaleMode = StageScaleMode.NO_SCALE;
			introWindow.stage.addChild(new dbk_splash());
			// fade in and wait for it to finish
			introWindow.addEventListener(Event.CLOSE, closeMainWindow);
			introTween = new Tween(introWindow.stage.getChildAt(0), "alpha", Regular.easeInOut, 0, 1, FADE_TIME);
			introTween.addEventListener(TweenEvent.MOTION_FINISH, en_startup, false, 0, true);
			// // progress bar animation tween
			// // progressTween = new Tween(Sprite(introWindow.stage.getChildAt(0)).getChildByName("pm"), "x", Regular.easeIn, -120, -120, FADE_TIME);
			// aaaaaaand... let's open the window
			DebugConsole.trace("displaying splash screen");
			introWindow.activate();
		}
		
	// --- general functions
		
		private function pressFunction (event:KeyboardEvent) {
			if (Global.global.typing) {
				Global.events.dispatchEvent(event)
			} else if (event.keyCode == Global.getData("key_quit")) {
				Global.functions.quit()
			} else if (event.keyCode == Global.getData("key_debug")) {
				Global.global.debugMode = Global.toggleData("debug_mode")
				showRedrawRegions(Global.global.debugMode)
				DebugConsole.visible = Global.global.debugMode
			} else if (event.keyCode == Global.getData("key_fullscreen")) {
				stage.displayState = Global.toggleData("fullscreen") ? StageDisplayState.FULL_SCREEN_INTERACTIVE : StageDisplayState.NORMAL
			} else if (event.keyCode == Global.getData("key_low")) {
				Global.functions.setQuality(0);
			} else if (event.keyCode == Global.getData("key_medium")) {
				Global.functions.setQuality(1);
			} else if (event.keyCode == Global.getData("key_high")) {
				Global.functions.setQuality(2);
			} else if (event.keyCode == Global.getData("key_best")) {
				Global.functions.setQuality(3);
			} else if (event.keyCode == Global.getData("key_reset")) {
				Global.events.dispatchEvent(new GameEvent(GameEvent.RESET))
			} else if (event.keyCode == Global.getData("key_escape")) {
				Global.events.dispatchEvent(new GlobalEvent(GlobalEvent.ESCAPE, stage))
			} else if (event.keyCode == Global.getData("key_mute")) {
				Global.global.mute = Global.toggleData("mute");
				MusicManager.updateVolume()
				Global.events.dispatchEvent(new ToggleEvent(ToggleEvent.MUTE, Global.global.mute))
			} else if (event.keyCode == Global.getData("key_pause1") || event.keyCode == Global.getData("key_pause2")) {
				Global.global.paused = !Global.global.paused
				DebugConsole.trace("game "+(Global.global.paused?"":"un")+"paused");
				Global.events.dispatchEvent(new ToggleEvent(ToggleEvent.PAUSE, Global.global.paused))
			} else {
				Global.events.dispatchEvent(event)
			}
		}
		
		public function defaultKeys (checkOnly:Boolean = true) {
			var fn:Function = checkOnly ? Global.checkData : Global.setData
			//default built-in shortcut keys
			fn("key_escape", Keyboard.ESCAPE)
			fn("key_quit", Keyboard.F12)
			fn("key_debug", Keyboard.F11)
			fn("key_mute", Keyboard.F4)
			fn("key_help", Keyboard.F1)
			fn("key_fullscreen", 70)	// F
			fn("key_low", 76) 			// L
			fn("key_medium", 77)		// M
			fn("key_high", 72)			// H
			fn("key_best", 66)			// B
			fn("key_pause1", 80)		// P
			fn("key_pause2", 19)		// PAUSE
			//default customisable shortcut keys
			fn("key_left", Keyboard.LEFT)
			fn("key_right", Keyboard.RIGHT)
			fn("key_up", Keyboard.UP)
			fn("key_down", Keyboard.DOWN)
			fn("key_swap", Keyboard.TAB)
			fn("key_primary", Keyboard.SPACE)
			fn("key_secondary", Keyboard.SHIFT)
			fn("key_cycle", Keyboard.CONTROL)
			fn("key_checkpoint", 67)	// C
			fn("key_reset", 82)			// R
		}
		
		public function setQuality (quality:uint):String {
			Global.setData("quality", quality)
			Global.stage.quality = Util.getQualityString()
			BitmapManager.update(quality)
			Global.events.dispatchEvent(new QualityEvent(quality))
			return Global.stage.quality
		}
		
		private function closeMainWindow (event:Event) {
			// close log viewer window
			if (logViewerWindow)
				logViewerWindow.close();
			// quit application
			Global.functions.quit();
		}
		
		private function deactivate (event:Event) {
			if (Global.global.paused) {
				if (hasEventListener(Event.ACTIVATE)) removeEventListener(Event.ACTIVATE, activate)
			} else {
				Global.global.paused = true
				if (!hasEventListener(Event.ACTIVATE)) addEventListener(Event.ACTIVATE, activate)
				Global.events.dispatchEvent(new ToggleEvent(ToggleEvent.PAUSE, true))
			}
		}
		
		private function activate (event:Event) {
			Global.global.paused = false
			Global.events.dispatchEvent(new ToggleEvent(ToggleEvent.PAUSE, false))
		}
		
		public function stealFocus (event:FocusEvent = null) {
			Global.global.typing = true
		}
		
		public function returnFocus (event:FocusEvent = null) {
			Global.global.typing = false
		}
		
		public function openLog () {
			if (logViewerWindow == null || logViewerWindow.closed) {
				// create new window
				logViewerOptions = new NativeWindowInitOptions();
				logViewerOptions.type = NativeWindowType.UTILITY;
				logViewerWindow = new NativeWindow(logViewerOptions);
				logViewerWindow.title = "PM2 Log Viewer";
				logViewerWindow.minSize = new Point(400, 300);
				logViewerWindow.stage.scaleMode = StageScaleMode.NO_SCALE;
				logViewerWindow.stage.align = StageAlign.TOP_LEFT;
				logViewerWindow.stage.addChild(Global.libs.screens.getScreen(23));
				logViewerWindow.addEventListener(Event.CLOSE, closeLogViewer);
			}
			// show the window
			logViewerWindow.activate();
		}
		
		public function closeLogViewer (event:Event) {
			logViewerWindow.removeEventListener(Event.CLOSE, closeLogViewer);
			logViewerWindow.stage.removeChildAt(0);
		}
		
		public function log (text:String) {
			if (tempLog != null) tempLog += text;
			else Global.so.data.log[0].text += text
		}
		
		public function quit (event:Event = null) {
			if (Global.so && Global.so.data.log) Global.so.data.log[0].quit = true;
			Global.application.exit()
		}
		
		public function newGame (pack:String) {
			Global.save = new SaveFile(pack);
			Global.save.flush();
		}
		
		public function loadGame (id:uint) {
			if (id < Global.so.data.save.length) {
				Global.save = new SaveFile(id);
				Global.save.flush();
			} else throw new RangeError("The loadGame() function must be called with the id of an existing save file.");
		}
		
		public function topProgress (pack:String):uint {
			var top:uint = 0;
			for each (var save:Object in Global.so.data.save)
				if (save[3] == pack)
					top = Math.max(top, save[2]);
			return top;
		}
		
		public function bestTime (type:uint, map:uint, pack:String = ""):Array {
			var best:uint = uint(-1);
			var id:int = -1;
			for (var i:uint = 0; i < Global.so.data.replays.length; i++) {
				if (Global.so.data.replays[i][0] != type)
					continue; // wrong game type altogether 
				if (Global.so.data.replays[i][6] != map)
					continue; // wrong map
				if (type == GameType.NORMAL && Global.so.data.replays[i][7] != pack)
					continue; // wrong level pack (for GameType.NORMAL)
				if (best < Global.so.data.replays[i][3])
					continue; // this time isn't better than ours
				// this is the best so far, set it
				best = Global.so.data.replays[i][3];
				id = i;
			}
			return [best, id];
		}
		
	// --- startup functions
		
		private function en_startup (event:TweenEvent) {
			// cleanup after fatal error on this frame
			Global.fatalCleanup = fc_startup;
			
			// initialise utility classes
			Util.init();
			KeyDown.init();
			RandomSeed.reseed();
			
			DebugConsole.trace("beginning to load data");
			
			// load (or create) user data file
			try {
				Global.so = SharedObject.getLocal("pm2", "/");
				DebugConsole.trace("loaded pm2 user data file (" + Util.fileSize(Global.so.size) + ")");
			} catch (error:Error) {
				DebugConsole.trace("couldn't load/create user data file: " + error.message, 1);
				Global.fatalError(error.message.match(/\d+/), "Data File Error", "Failed to load/create the pattomobile 2 user data file. Right-click and select 'Settings...', check your Local Storage amount and raise if needed.");
			}
			
			// set up save files
			Global.checkData("save", new Array());
			DebugConsole.trace("found " + Global.so.data.save.length + " save files");
			
			// set up replay files
			Global.checkData("replays", new Array());
			DebugConsole.trace("found " + Global.so.data.replays.length + " replays");
			
			// set up log
			Global.checkData("log", new Array());
			DebugConsole.trace("found " + Global.so.data.log.length + " logs");
			Global.so.data.log.unshift({time:(new Date()).getTime(), quit:false, text:tempLog});
			tempLog = null;
			
			// keyboard shourtcuts defaults
			defaultKeys();
			// audio settings defaults
			Global.checkData("volume_bgm", 0.8);
			Global.checkData("volume_sfx", 1);
			Global.checkData("en_bgm", true);
			Global.checkData("en_sfx", true);
			Global.checkData("en_stereo", true);
			Global.checkData("en_pan", true);
			// replay settings defaults
			Global.checkData("replay_death", false);
			Global.checkData("replay_win", true);
			Global.checkData("replay_reset", false);
			Global.checkData("replay_exit", false);
			// other settings defaults
			Global.checkData("update_check", true);
			Global.checkData("loop_replay", true);
			// animate settings default
			Global.checkData("animate_titles", true);
			Global.checkData("animate_mbs", true);
			Global.checkData("animate_screens", true);
			// online settings default
			Global.checkData("username", "");
			Global.checkData("password", "");
			
			// set up debug mode
			Global.global.debugMode = Global.checkData("debug_mode", false);
			showRedrawRegions(Global.global.debugMode);
			DebugConsole.visible = Global.global.debugMode;
			
			// apply some settings and default values
			Global.functions.setQuality(Global.checkData("quality", 2));
			Global.global.mute = Global.checkData("mute", false);
			Global.global.paused = false; // stop game action
			Global.global.typing = false; // ignore global keypresses
			
			// load config files
			for (var i:uint = 0; i < cfgs.length; i++) {
				configs[i] = new URLLoader();
				configs[i].dataFormat = URLLoaderDataFormat.VARIABLES;
				configs[i].addEventListener(IOErrorEvent.IO_ERROR, configIOError, false, 0, true);
				configs[i].addEventListener(Event.COMPLETE, loadConfig, false, 0, true);
				try {
					configs[i].load(new URLRequest("cfg/" + cfgs[i].name + ".cfg"));
				} catch (error:Error) {
					DebugConsole.trace("failed to load config file \""+cfgs[i].name+"\": " + error.message, 1);
				}
			}
			
			// load asset libraries
			for (i = 0; i < assets.length; i++) {
				assets[i].loader = new Loader();
				loaders[i] = assets[i].loader.contentLoaderInfo;
				loaders[i].addEventListener(IOErrorEvent.IO_ERROR, loadIOError, false, 0, true);
				loaders[i].addEventListener(Event.INIT, loadAsset, false, 0, true);
				try {
					assets[i].loader.load(new URLRequest("lib/" + assets[i].name + ".swf"));
				} catch (error:Error) {
					DebugConsole.trace("failed to load asset library \""+assets[i].name+"\": " + error.message, 1);
					if (assets[i].vital) Global.fatalError(error.errorID, "Failed to load vital asset library \"" + assets[i].name + "\", located in file named \"lib/" + assets[i].name + ".swf\". Check that this file exists; If not, reinstall. If it does exist, or if reinstalling doesn't fix the problem, contact DBK Software for assistance.");
				}
			}
			
			// load level packs
			for (i = 0; i < packs.length; i++) {
				packs[i].loader = new Loader();
				loaders[assets.length+i] = packs[i].loader.contentLoaderInfo;
				loaders[assets.length+i].addEventListener(IOErrorEvent.IO_ERROR, loadIOError, false, 0, true);
				loaders[assets.length+i].addEventListener(Event.INIT, loadPack, false, 0, true);
				try {
					packs[i].loader.load(new URLRequest("levels/" + packs[i].name + ".swf"));
				} catch (error:Error) {
					DebugConsole.trace("failed to load level pack \""+packs[i].name+"\": " + error.message, 1);
					if (packs[i].vital) Global.fatalError(error.errorID, "Failed to load vital level pack \"" + packs[i].name + "\", located in file named \"levels/" + packs[i].name + ".swf\". Check that this file exists; If not, reinstall. If it does exist, or if reinstalling doesn't fix the problem, contact DBK Software for assistance.");
				}
			}
			
			// begin update check
			if (Global.getData("update_check")) {
				appUpdater = new ApplicationUpdaterUI();
				appUpdater.updateURL = "http://software.dbkmedia.com/update/1";
				appUpdater.isCheckForUpdateVisible = false;
				appUpdater.addEventListener(DownloadErrorEvent.DOWNLOAD_ERROR, downloadError);
				appUpdater.initialize();
				appUpdater.checkNow();
			}
		}
		
		private function fc_startup () {
			//stop loaders if still running
			while (configs.length) try { configs.shift().close() } catch (error:Error) { DebugConsole.trace("couldn't close config loader: " + error.message, 1) }
			while (assets.length) try { assets.shift().loader.close() } catch (error:Error) { DebugConsole.trace("couldn't close asset loader: " + error.message, 1) }
			//nullify remaining objects
			cfgs = configs = null	// Array
			assets = loaders = null	// Array
			introOptions = null		// NativeWindowInitOptions
			introWindow = null		// NativeWindow
		}
		
		private function cu_startup (event:TweenEvent) {
			// remove splash
			introTween.removeEventListener(TweenEvent.MOTION_FINISH, cu_startup);
			introWindow.removeEventListener(Event.CLOSE, closeMainWindow);
			introWindow.stage.removeChildAt(0);
			introWindow.close();
			// get rid of movieclip containing the fonts we want embedded, no use clogging up the stage
			removeChild(embeddedFonts);
			embeddedFonts = null;
			// nullify remaining objects
			cfgs = configs = assets = packs = loaders = null	// Array
			introOptions = null;	// NativeWindowInitOptions
			introWindow = null;		// NativeWindow
			introTween = null;		// Tween
			
			// respond to global function key presses
			KeyDown.setGlobal(pressFunction);
			KeyDown.addHistoryEvent("lolog", openLog);
			
			// pause/unpause game when application loses/regains focus
			addEventListener(Event.DEACTIVATE, deactivate);
			
			// show the main window and close everything when it is closed
			Global.stage.nativeWindow.addEventListener(Event.CLOSE, closeMainWindow);
			Global.stage.nativeWindow.activate();
			
			// go tot he main menu
			en_mainmenu();
		}
		
		private function configIOError (event:IOErrorEvent) {
			var index:uint = configs.indexOf(event.target);
			DebugConsole.trace("failed to load config file \""+cfgs[index].name+"\": " + event.text, 1);
			loadCount("configs");
		}
		
		private function loadConfig (event:Event) {
			var index:uint = configs.indexOf(event.target);
			Global.config[cfgs[index].name] = event.target.data;
			DebugConsole.trace("loaded config file \""+cfgs[index].name+"\" (" + Util.fileSize(event.target.bytesTotal) + ")");
			loadCount("configs");
		}
		
		private function loadIOError (event:IOErrorEvent) {
			var index:uint = loaders.indexOf(event.target)
			if (index < assets.length) {
				DebugConsole.trace("failed to load asset library \""+assets[index].name+"\": " + event.text, 1)
				if (assets[index].vital) Global.fatalError(event.errorID, "Asset Error", "Failed to load asset library \""+assets[index].name+"\", located in file named \"lib/" + assets[index].name + ".swf\". Check that this file exists; If not, reinstall. If it does exist, or if reinstalling doesn't fix the problem, contact DBK Software for assistance.")
			} else {
				index -= assets.length;
				DebugConsole.trace("failed to load level pack \""+packs[index].name+"\": " + event.text, 1)
				if (packs[index].vital) Global.fatalError(event.errorID, "Level Pack Error", "Failed to load level pack \""+packs[index].name+"\", located in file named \"levels/" + packs[index].name + ".swf\". Check that this file exists; If not, reinstall. If it does exist, or if reinstalling doesn't fix the problem, contact DBK Software for assistance.")
			}
			loadCount("loaders");
		}
		
		private function loadAsset (event:Event) {
			var index:uint = loaders.indexOf(event.target);
			Global.libs[assets[index].name] = event.target.loader.content;
			DebugConsole.trace("loaded asset library \""+assets[index].name+"\" (" + Util.fileSize(event.target.bytesTotal) + ")");
			event.target.loader.unload();
			loadCount("loaders");
			
		}
		
		private function loadPack (event:Event) {
			var index:uint = loaders.indexOf(event.target);
			Global.packs[packs[index-assets.length].name] = event.target.loader.content;
			DebugConsole.trace("loaded level pack \""+packs[index-assets.length].name+"\" (" + Util.fileSize(event.target.bytesTotal) + ")");
			event.target.loader.unload();
			loadCount("loaders");
		}
		
		private function loadCount (type:String) {
			if (type == "configs") configsCount++;
			if (type == "loaders") loadersCount++;
			// // update progress bar
			// // progressTween.begin = Sprite(introWindow.stage.getChildAt(0)).getChildByName("pm").x;
			// // progressTween.finish = -120 + 240 * (configsCount + loadersCount) / (configs.length + loaders.length);
			// // progressTween.start();
			// fade out splash screen if all done
			if (configsCount == configs.length && loadersCount == loaders.length) {
				DebugConsole.trace("all loading complete");
				introTween.removeEventListener(TweenEvent.MOTION_FINISH, en_startup);
				introTween = new Tween(introWindow.stage.getChildAt(0), "alpha", Regular.easeInOut, 1, 0, FADE_TIME);
				introTween.addEventListener(TweenEvent.MOTION_FINISH, cu_startup, false, 0, true);
			}
		}
		
		private function downloadError (event:DownloadErrorEvent) {
			DebugConsole.trace("update check failed: " + event.text)
		}
		
	// --- mainmenu functions
		
		private function en_mainmenu () {
			//cleanup after fatal error on this frame
			Global.fatalCleanup = fc_mainmenu
			//variables to hold titles
			title_mc = Global.libs.menu.getItem(20)
			subtitle_mc = Global.libs.menu.getItem(21)
			//play music
			MusicManager.setMusic("theme")
			//draw title images to bitmap data
			tdata = new BitmapData(640, 240, true, 0x00000000)
			tdata.draw(title_mc)
			tbmp = new Bitmap(tdata)
			sdata = new BitmapData(640, 80, true, 0x00000000)
			sdata.draw(subtitle_mc)
			sbmp = new Bitmap(sdata)
			BitmapManager.addBitmaps([tbmp, sbmp])
			//add bitmap images to display titles
			sbmp.y = 180
			addChild(tbmp)
			addChild(sbmp)
			//animate cached fade in of title
			if (Global.getData("animate_titles")) {
				ttwn = new Tween(tbmp, "alpha", Regular.easeOut, 0, 1, FADE_TIME * 3 / 2)
				stwn = new Tween(sbmp, "alpha", Bounce.easeOut, 0, 1, FADE_TIME * 2)
				stwn.addEventListener(TweenEvent.MOTION_FINISH, pastFadeIn, false, 0, true)
			} else pastFadeIn()
			//listen for a menu button to be clicked
			Global.events.addEventListener(MenuButtonEvent.CLICK, clickMenuButton)
			//listen for a back button to be clicked
			Global.events.addEventListener(MenuButtonEvent.BACK, clickBackButton)
			//listen for escape key press
			Global.events.addEventListener(GlobalEvent.ESCAPE, mainmenuEscapeKey, false, 0, true)
			//show main window
			stage.nativeWindow.activate()
		}
		
		private function fc_mainmenu () {
			//stop listening for menu buttons to be pressed
			Global.events.removeEventListener(MenuButtonEvent.CLICK, clickMenuButton)
			Global.events.removeEventListener(MenuButtonEvent.BACK, clickBackButton)
			Global.events.removeEventListener(GlobalEvent.ESCAPE, mainmenuEscapeKey)
			if (stwn) stwn.removeEventListener(TweenEvent.MOTION_FINISH, pastFadeIn)
			if (tmr) tmr.removeEventListener(TimerEvent.TIMER_COMPLETE, finishFlyOut)
			//remove children
			if (tbmp) if (contains(tbmp)) removeChild(tbmp)
			if (title_mc) if (contains(title_mc)) removeChild(title_mc)
			if (sbmp) if (contains(sbmp)) removeChild(sbmp)
			if (subtitle_mc) if (contains(subtitle_mc)) removeChild(subtitle_mc)
			if (clicked) if (clicked.mb) if (contains(clicked.mb)) removeChild(clicked.mb)
			while (fades.length) removeChild(fades.shift().mc)
			while (mbs.length) removeChild(mbs.shift())
			//deregister bitmaps
			BitmapManager.removeBitmaps([tbmp, sbmp])
			//nullify remaining objects
			tbmp = sbmp = null 				// flash.display.Bitmap
			title_mc = subtitle_mc = null 	// flash.display.Sprite
			ttwn = stwn = null 				// fl.transitions.Tween
			tmr = null 						// flash.utils.Timer
			clicked = null					// Object
			fades = mbs = null 				// Array
		}
		
		private function cu_mainmenu () {
			//stop listening for menu buttons to be pressed
			Global.events.removeEventListener(MenuButtonEvent.CLICK, clickMenuButton)
			Global.events.removeEventListener(MenuButtonEvent.BACK, clickBackButton)
			Global.events.removeEventListener(GlobalEvent.ESCAPE, mainmenuEscapeKey)
			//remove title images
			if (contains(tbmp)) removeChild(tbmp)
			if (contains(sbmp)) removeChild(sbmp)
			//deregister bitmaps
			BitmapManager.removeBitmaps([tbmp, sbmp])
			//store screen id
			Global.global.screen = clicked.id
			//nullify remaining objects
			tbmp = sbmp = null 				// flash.display.Bitmap
			title_mc = subtitle_mc = null 	// flash.display.Sprite
			ttwn = stwn = null 				// fl.transitions.Tween
			tmr = null 						// flash.utils.Timer
			clicked = null					// Object
			fades = mbs = null 				// Array
			//go to screen frame
			en_screen()
		}
		
		private function pastFadeIn (event:TweenEvent = null) {
			if (stwn) stwn.removeEventListener(TweenEvent.MOTION_FINISH, pastFadeIn)
			if (contains(tbmp)) removeChild(tbmp)
			if (contains(sbmp)) removeChild(sbmp)
			BitmapManager.removeBitmaps([tbmp, sbmp])
			subtitle_mc.y = 180
			addChild(title_mc)
			addChild(subtitle_mc)
			makeMainMenu()
		}
		
		private function clickMenuButton (event:MenuButtonEvent) {
			if (event.r[0] < 5) {
				lastMenu = event.id
				clicked = new Object()
				clicked.mb = mbs.splice(event.id, 1)[0]
				clicked.x = clicked.mb.x
				clicked.y = clicked.mb.y
				clicked.id = event.id;
				clicked.finished = clickedToSubMenu
				if (Global.getData("animate_mbs")) {
					clicked.t1 = new Tween(clicked.mb, "x", Regular.easeInOut, clicked.x, 100, FADE_TIME)
					clicked.t2 = new Tween(clicked.mb, "y", Back.easeInOut, clicked.y, 320, FADE_TIME)
				} else {
					clicked.mb.x = 100
					clicked.mb.y = 320
				}
			} else {
				mbs.push(clicked.mb)
				clicked = new Object()
				clicked.id = event.id
				clicked.finished = cu_mainmenu
				removeChild(title_mc)
				removeChild(subtitle_mc)
				if (Global.getData("animate_titles")) {
					addChild(tbmp)
					addChild(sbmp)
					clicked.t1 = new Tween(tbmp, "alpha", Regular.easeIn, 1, 0, FADE_TIME)
					clicked.t2 = new Tween(sbmp, "alpha", Regular.easeIn, 1, 0, FADE_TIME)
				}
			}
			startFlyOut()
		}
		
		private function clickBackButton (event:MenuButtonEvent) {
			clicked.finished = clickedToMainMenu
			if (Global.getData("animate_mbs")) {
				clicked.t1 = new Tween(clicked.mb, "x", Regular.easeInOut, 100, clicked.x, FADE_TIME)
				clicked.t2 = new Tween(clicked.mb, "y", Back.easeInOut, 320, clicked.y, FADE_TIME)
			} else {
				clicked.mb.x = clicked.x
				clicked.mb.y = clicked.y
			}
			startFlyOut()
		}
		
		private function mainmenuEscapeKey (event:GlobalEvent) {
			if (clicked) {
				if (clicked.mb) clicked.mb.mouseClick(event)
			} else if (mbs)
				if (mbs.length == 5) mbs[lastMenu].mouseClick(event)
		}
		
		private function startFlyOut () {
			fades = new Array()
			while (mbs.length) {
				var mb = mbs.shift()
				if (Global.getData("animate_mbs")) {
					var data = new BitmapData(256, 256, true, 0x00000000)
					data.draw(mb, new Matrix(1,0,0,1,128,128))
					var obj = new Object()
					obj.mc = addChild(new Sprite())
					obj.mc.addChild(new Bitmap(data))
					obj.mc.getChildAt(0).x = obj.mc.getChildAt(0).y = -128
					obj.t1 = new Tween(obj.mc, "alpha", Regular.easeIn, 1, 0, ((mb.id == clicked.id) + 1) * FADE_TIME)
					obj.t2 = new Tween(obj.mc, "scaleX", Regular.easeIn, 1, 3, ((mb.id == clicked.id) + 1) * FADE_TIME)
					obj.t3 = new Tween(obj.mc, "scaleY", Regular.easeIn, 1, 3, ((mb.id == clicked.id) + 1) * FADE_TIME)
					if (mb.id == clicked.id) {
						obj.t4 = new Tween(obj.mc, "x", Back.easeInOut, mb.x, 320, FADE_TIME * 2)
						obj.t5 = new Tween(obj.mc, "y", Back.easeInOut, mb.y, 240, FADE_TIME * 2)
					} else {
						obj.t4 = new Tween(obj.mc, "x", Back.easeIn, mb.x, 2 * mb.x - 320, FADE_TIME)
						obj.t5 = new Tween(obj.mc, "y", Back.easeIn, mb.y, 2 * mb.y - 240, FADE_TIME)
					}
					fades.push(obj)
					BitmapManager.addBitmap(obj.mc.getChildAt(0), false)
				}
				mb.enabled = false
				removeChild(mb)
			}
			if (Global.getData("animate_mbs")) {
				tmr = new Timer(clicked.id >= 5 ? 2500 : 1000, 1)
				tmr.addEventListener(TimerEvent.TIMER_COMPLETE, finishFlyOut, false, 0, true)
				tmr.start()
			} else finishFlyOut()
		}
		
		private function finishFlyOut (event:TimerEvent = null) {
			if (tmr) tmr.removeEventListener(TimerEvent.TIMER_COMPLETE, finishFlyOut)
			while (fades.length) {
				var f:Object = fades.shift()
				removeChild(f.mc)
				BitmapManager.removeBitmap(f.mc.getChildAt(0))
			}
			fades = new Array()
			clicked.finished()
		}
		
		private function clickedToSubMenu () {
			clicked.mb.enabled = clicked.mb.goBack = true
			makeSubMenu(clicked.id)
		}
		
		private function clickedToMainMenu () {
			clicked.mb.enabled = true
			clicked.mb.goBack = false
			makeMainMenu(clicked.id)
		}
		
		private function makeSubMenu (id:uint) {
			mbs = new Array()
			for each (var d in MenuButtonMap.getSub(id))
				mbs.push(addChild(new MenuButton(d[0], d[1], d[2], d[3], d[4])))
		}
		
		private function makeMainMenu (ex:int = -1) {
			mbs = new Array()
			for each (var d in MenuButtonMap.getMain()) {
				if (d[4] == ex) mbs.push(clicked.mb)
				else mbs.push(addChild(new MenuButton(d[0], d[1], d[2], d[3], d[4])))
			}
		}
		
	// --- screen functions
		
		private function en_screen () {
			//cleanup after fatal error on this frame
			Global.fatalCleanup = fc_screen
			// play music
			MusicManager.setMusic("theme");
			// load selected screen
			screen = Global.libs.screens.getScreen(Global.global.screen)
			addChild(screen)
			screen_bmp = new Bitmap(new BitmapData(640, 480, false, 0x000000))
			addChild(screen_bmp)
			Global.global.screen = null;
			// fade screen in
			if (Global.getData("animate_screens")) {
				screen_tween = new Tween(screen_bmp, "alpha", Regular.easeOut, 1, 0, FADE_TIME)
				screen_tween.addEventListener(TweenEvent.MOTION_FINISH, finishScreenFadeIn)
			} else finishScreenFadeIn();
		}
		
		private function fc_screen () {
			//stop listening for events
			if (screen_tween) screen_tween.removeEventListener(TweenEvent.MOTION_FINISH, finishScreenFadeIn)
			if (screen_tween) screen_tween.removeEventListener(TweenEvent.MOTION_FINISH, cu_screen)
			Global.events.removeEventListener(GlobalEvent.ESCAPE, screenEscapeKey)
			Global.events.removeEventListener(ScreenEvent.BACK, screenEscapeKey)
			Global.events.removeEventListener(PlayEvent.GAME, screenGame)
			Global.events.removeEventListener(ReplayEvent.REPLAY, screenReplay)
			//remove children
			if (screen) if (contains(screen)) removeChild(screen)
			if (screen_bmp) if (contains(screen_bmp)) removeChild(screen_bmp)
			//nullify remaining objects
			screen = null		// flash.display.Sprite
			screen_bmp = null	// flash.display.Bitmap
		}
		
		private function cu_screen (event:TweenEvent = null) {
			//stop listening for events
			if (screen_tween) screen_tween.removeEventListener(TweenEvent.MOTION_FINISH, cu_screen)
			//remove screen image
			if (screen) {
				screen.unload();
				if (contains(screen)) removeChild(screen);
			}
			if (contains(screen_bmp)) removeChild(screen_bmp);
			//nullify remaining objects
			screen = null		// Screen
			screen_bmp = null	// flash.display.Bitmap
			//go to next place
			if (Global.global.game) en_game()
			else if (Global.global.screen) en_screen()
			else en_mainmenu()
		}
		
		private function finishScreenFadeIn (event:TweenEvent = null) {
			if (screen_tween) screen_tween.removeEventListener(TweenEvent.MOTION_FINISH, finishScreenFadeIn)
			removeChild(screen_bmp)
			// event listeners
			Global.events.addEventListener(GlobalEvent.ESCAPE, screenEscapeKey, false, 0, true)
			Global.events.addEventListener(ScreenEvent.BACK, screenEscapeKey, false, 0, true)
			Global.events.addEventListener(PlayEvent.GAME, screenGame, false, 0, true)
			Global.events.addEventListener(ReplayEvent.REPLAY, screenReplay, false, 0, true)
			// mostly for haxx
			screen.fadein();
		}
		
		private function screenEscapeKey (event:GlobalEvent = null) {
			screen.mouseChildren = false
			screen.tabChildren = false
			screen.fadeout()
			stage.focus = null
			Global.events.removeEventListener(GlobalEvent.ESCAPE, screenEscapeKey)
			Global.events.removeEventListener(ScreenEvent.BACK, screenEscapeKey)
			Global.events.removeEventListener(PlayEvent.GAME, screenGame)
			Global.events.removeEventListener(ReplayEvent.REPLAY, screenReplay)
			if (Global.getData("animate_screens")) {
				addChild(screen_bmp)
				screen_tween = new Tween(screen_bmp, "alpha", Regular.easeIn, 0, 1, FADE_TIME)
				screen_tween.addEventListener(TweenEvent.MOTION_FINISH, cu_screen)
			} else cu_screen()
		}
		
		private function screenGame (event:PlayEvent) {
			DebugConsole.trace("loading game: " + event.toString());
			Global.global.replay = null;
			Global.global.game = event;
			screenEscapeKey();
		}
		
		private function screenReplay (event:ReplayEvent) {
			DebugConsole.trace("loading replay: " + event.toString());
			Global.global.replay = Global.so.data.replays[event.id];
			Global.global.game = {gameType:Global.global.replay[0], map:Global.global.replay[6], pack:Global.global.replay[7]};
			screenEscapeKey();
		}
		
	// --- game
	
		private function en_game () {
			// cleanup after fatal error on this frame
			Global.fatalCleanup = fc_game;
			// hide mouse cursor
			Mouse.hide();
			// clear cutscene
			Global.global.cutscene = null;
			// handle changing levels
			Global.events.addEventListener(PlayEvent.GAME, changeLevel);
			// initialise physics engine
			Global.stage.frameRate = 60;
			APEngine.init(1/3);
			APEngine.container = new Sprite();
			// prepare collisions list
			Global.collisions = new Array();
			// add groups
			Global.groups = new Object();
			Global.groups.fixed = new Group(false);
			Global.groups.mobile = new Group(true);
			Global.groups.mobile.addCollidable(Global.groups.fixed)
			APEngine.addGroup(Global.groups.fixed)
			APEngine.addGroup(Global.groups.mobile)
			// create background layer
			bg = new Sprite();
			addChild(bg);
			// create game area
			game = new Sprite();
			game.visible = false;
			addChild(game);
			// bitmap for fading effects
			game_bmp = new Bitmap(new BitmapData(640, 480, false, 0x000000));
			// hide areas outside 4:3 in fullscreen, fuck you people with widescreen
			game_mask = new Sprite();
			game_mask.graphics.beginFill(0xFFFFFF);
			game_mask.graphics.drawRect(0, 0, 640, 480);
			game_mask.graphics.endFill();
			addChild(game_mask);
			game.mask = game_mask;
			// add layers
			Global.layers = new Object();
			for each (var layer:String in layers)
				Global.layers[layer] = game.addChild(new Sprite());
			// create HUD
			hud = new HUD();
			addChild(hud);
			// load level data
			loadLevelData();
			loadLevel();
		}
		
		private function fc_game () {
			// give up XD
		}
		
		private function cu_game (event:TweenEvent = null) {
			// stop fade
			if (game_tween) game_tween.removeEventListener(TweenEvent.MOTION_FINISH, cu_game);
			// remove layers
			for each (var layer:String in layers) {
				game.removeChild(Global.layers[layer]);
				Global.layers[layer] = null;
			}
			Global.layers = null;
			// remove game area etc.
			removeChild(game);
			game = null;
			removeChild(game_mask);
			game_mask = null;
			game_bmp = null;
			game_tween = null;
			// remove background
			removeChild(bg);
			bg = null;
			// remove HUD
			hud.unload();
			removeChild(hud);
			hud = null;
			// remove groups
			APEngine.removeGroup(Global.groups.fixed);
			APEngine.removeGroup(Global.groups.mobile);
			Global.groups.mobile.removeCollidable(Global.groups.fixed)
			Global.groups.mobile = null;
			Global.groups.fixed = null;
			Global.groups = null;
			// remove collisions list
			Global.collisions = null;
			// stop handling change level
			Global.events.removeEventListener(PlayEvent.GAME, changeLevel);
			// show mouse cursor
			Mouse.show();
			// which menu screen do we want to go to?
			if (Global.global.replay) {
				Global.global.screen = 18; // replays
			} else if (Global.global.cutscene) {
				Global.global.screen = 22; // cutscene
			} else if (Global.global.game.gameType == GameType.NORMAL) {
				Global.global.screen = 20; // level select
			} else if (Global.global.game.gameType == GameType.DOWNLOADED) {
				// TODO downloaded
			} else if (Global.global.game.gameType == GameType.EDIOT) {
				Global.global.screen = 21; // ediot
			}
			// clear variables
			Global.global.data = null;
			Global.global.game = null;
			Global.global.replay = null;
			// return to menu screen
			Global.stage.frameRate = 30;
			en_screen();
		}
		
		// levels
		
		private function loadLevelData () {
			if (Global.global.game.gameType == GameType.NORMAL) {
				Global.global.data = data = Global.packs[Global.global.game.pack].getData(Global.global.game.map);
			} else if (Global.global.game.gameType == GameType.DOWNLOADED) {
				// TODO downloaded
			} else if (Global.global.game.gameType == GameType.EDIOT) {
				Global.global.data = data = Global.global.ediotData;
			}
		}
		
		private function loadLevel () {
			// start playing music
			MusicManager.setMusic(data.music);
			// reseed random number generator
			seed = RandomSeed.reseed(Global.global.replay ? Global.global.replay[4] : Math.floor(Math.random() * RandomSeed.LIMIT));
			// handle replay data
			replayData = new ByteArray();
			if (Global.global.replay) {
				// decode recorded replay data
				for (var i:uint = 0; i < Global.global.replay[5].length; i++)
					replayData.writeByte(Global.global.replay[5].charCodeAt(i));
				replayData.position = 0;
			}
			// add gravity to physics engine
			APEngine.addMasslessForce(new APEVector(0, Number(data.gravity)));
			// draw background
			bg.graphics.beginFill(Util.hex(data.colours.background));
			bg.graphics.drawRect(0, 0, 640, 480);
			bg.graphics.endFill();
			// set up HUD
			if (Global.global.game.gameType == GameType.NORMAL) {
				hud.setTitle(Global.packs[Global.global.game.pack].label + " - " + (Global.global.game.map + 1) + " / " + Global.packs[Global.global.game.pack].length + " - " + data.title);
			} else if (Global.global.game.gameType == GameType.DOWNLOADED) {
				// TODO downloaded
				// add in name of author?
				hud.setTitle("Downloaded Level - " + data.title);
			} else if (Global.global.game.gameType == GameType.EDIOT) {
				hud.setTitle("Ediot Test Level - " + data.title);
			}
			hud.visible = true;
			// add objects
			gameObjects = new Vector.<IGameObject>();
			// set up characters
			chars = new Object();
			control = data.control;
			for each (var character:XML in data.characters.children()) {
				chars[character.name()] = addGameObject(character);
				chars[character.name()].control = Boolean(character.name() == control);
			}
			// scroll to start where the control character is
			scroll(1.0); // 1.0 means no easing, go straight there
			// set up surfaces
			for each (var surface:XML in data.surfaces.children())
				addGameObject(surface);
			// fade in
			game.visible = true;
			if (Global.getData("animate_screens")) {
				addChild(game_bmp);
				game_tween = new Tween(game_bmp, "alpha", Regular.easeOut, 1, 0, FADE_TIME);
				game_tween.addEventListener(TweenEvent.MOTION_FINISH, finishGameFadeIn);
			} else finishGameFadeIn();
		}
		
		private function finishGameFadeIn (event:TweenEvent = null) {
			if (game_tween) game_tween.removeEventListener(TweenEvent.MOTION_FINISH, finishGameFadeIn)
			if (contains(game_bmp)) removeChild(game_bmp)
			Global.events.addEventListener(GlobalEvent.ESCAPE, escapeGame);
			Global.events.addEventListener(GameEvent.FINISH, finishLevel);
			Global.events.addEventListener(GameEvent.RESET, resetLevel);
			Global.events.addEventListener(GameEvent.KILL, killLevel);
			addEventListener(Event.ENTER_FRAME, step);
		}
		
		private function unloadLevel(fadeout:Boolean = false) {
			// capture frame
			game_bmp.bitmapData.draw(this);
			// remove event listeners
			Global.events.removeEventListener(GlobalEvent.ESCAPE, escapeGame);
			Global.events.removeEventListener(GameEvent.FINISH, finishLevel);
			Global.events.removeEventListener(GameEvent.RESET, resetLevel);
			Global.events.removeEventListener(GameEvent.KILL, killLevel);
			removeEventListener(Event.ENTER_FRAME, step);
			// remove gravity
			APEngine.removeForces();
			// clear background
			bg.graphics.clear();
			// hide HUD
			hud.visible = false;
			// remove objects
			while (gameObjects.length) removeGameObject(gameObjects[0]);
			chars = null;
			control = "";
			// delete any replay data
			replayData = null;
			// fadeout
			game.visible = false;
			if (fadeout) {
				addChild(game_bmp);
				game_tween = new Tween(game_bmp, "alpha", Regular.easeOut, 1, 0, FADE_TIME);
				game_tween.addEventListener(TweenEvent.MOTION_FINISH, cu_game);
			}
		}
		
		private function reloadLevel () {
			unloadLevel();
			loadLevel();
		}
		
		private function loopReplay() {
			if (Global.getData("loop_replay")) {
				// loop replay
				reloadLevel();
			} else {
				// done watching, return to menu
				unloadLevel(true);
			}
		}
		
		// global events
		
		private function changeLevel (event:PlayEvent) {
			DebugConsole.trace("loading game: " + event.toString());
			Global.global.replay = null;
			Global.global.game = event;
			unloadLevel();
			loadLevelData();
			loadLevel();
		}
		
		private function escapeGame (event:GlobalEvent) {
			saveReplay(ReplayType.EXIT);
			unloadLevel(true);
		}
		
		private function resetLevel (event:GameEvent) {
			saveReplay(ReplayType.RESET);
			reloadLevel();
		}
		
		private function killLevel (event:GameEvent) {
			saveReplay(ReplayType.DEATH);
			if (Global.global.replay) {
				loopReplay();
			} else {
				reloadLevel();
			}
		}
		
		private function finishLevel (event:GameEvent) {
			saveReplay(ReplayType.WIN);
			if (Global.global.replay) {
				loopReplay();
			} else if (Global.global.game.gameType == GameType.NORMAL) {
				// passed the level, update save file if necessary
				Global.save.finishedLevel(Global.global.game.map);
				var nextLevel:uint = Global.global.game.map + 1;
				if (Global.packs[Global.global.game.pack].isCutscene(nextLevel)) {
					// there is a cutscene now, watch it
					Global.global.cutscene = [Global.global.game.pack, nextLevel, true];
					Global.global.screen = 22;
					unloadLevel(true);
				} else if (nextLevel == Global.packs[Global.global.game.pack].length) {
					// finished last level in level pack, return to menu
					unloadLevel(true);
				} else {
					// change to next level
					Global.events.dispatchEvent(new PlayEvent(GameType.NORMAL, nextLevel, Global.global.game.pack));
				}
			} else if (Global.global.game.gameType == GameType.DOWNLOADED) {
				// finished downloaded level, return to menu
				unloadLevel(true);
			} else if (Global.global.game.gameType == GameType.EDIOT) {
				// finished test level, keep testing
				reloadLevel();
			}
		}
		
		// game objects
		
		private function addGameObject (init:XML):IGameObject {
			var object:IGameObject = new (objectsList[init.name()])(init);
			gameObjects.push(object);
			Global.layers[object.layer].addChild(object);
			return object;
		}
		
		private function removeGameObject (gameObject:IGameObject) {
			gameObject.cleanup();
			Global.layers[gameObject.layer].removeChild(gameObject);
			gameObjects.splice(gameObjects.indexOf(gameObject),1);
		}
		
		// other
		
		private function step (event:Event) {
			if (Global.global.paused) return;
			// handle replay data
			if (Global.global.replay) {
				if (replayData.position < replayData.length) {
					Global.global.controls = Util.unpackBoolean(replayData.readUnsignedByte(), 8);
				} else {
					// no more replay data left, must've reset of quit
					loopReplay();
				}
			} else {
				Global.global.controls = new Vector.<Boolean>();
				Global.global.controls.push(
					KeyDown.isDown(Global.getData("key_left")),
					KeyDown.isDown(Global.getData("key_right")),
					KeyDown.isDown(Global.getData("key_up")),
					KeyDown.isDown(Global.getData("key_down")),
					KeyDown.isDown(Global.getData("key_swap")),
					KeyDown.isDown(Global.getData("key_primary")),
					KeyDown.isDown(Global.getData("key_secondary")),
					KeyDown.isDown(Global.getData("key_cycle"))
				);
				replayData.writeByte(Util.packBoolean(Global.global.controls));
			}
			// next physics step
			APEngine.step();
			// handle collision events
			while (Global.collisions && Global.collisions.length) {
				var collision:Array = Global.collisions.pop();
				collision[0].gameObject.collide(collision[0], collision[1]);
				collision[1].gameObject.collide(collision[1], collision[0]);
			}
			// step and redraw each game object
			for each (var object:IGameObject in gameObjects) {
				object.step();
				if (object.needsRedraw) object.redraw();
			}
			// update scrolling
			scroll();
		}
		
		private function scroll (easing:Number = 0.25, point:Point = null) {
			if (point == null)
				if (chars && chars.hasOwnProperty(control))
					point = chars[control].scroll;
				else return;
			var target:Point = new Point();
			target.x = Util.clamp(320 - point.x, 640 - data.width, 0);
			target.y = Util.clamp(240 - point.y, 480 - data.height, 0);
			game.x = Util.round(game.x + (target.x - game.x) * easing, 1);
			game.y = Util.round(game.y + (target.y - game.y) * easing, 1);
		}
		
		private function setControl (newControl:String):Boolean {
			if (chars[newControl])
				control = newControl;
			return Boolean(control == newControl);
		}
		
		private function saveReplay (type:uint) {
			if (Global.global.replay) return; // don't want to save a replay of watching a replay nyur
			if (Global.global.game.gameType == GameType.EDIOT) return; // no saving replays of test levels
			// [GameType, ReplayType, timestamp, frames, seed, data, map, pack]
			var replay:Array = new Array();
			// game type
			replay[0] = Global.global.game.gameType;
			// replay type
			replay[1] = type;
			// timestamp of completion time
			replay[2] = (new Date()).time;
			// frames to complete
			replay[3] = replayData.length;
			// seed used for our random number generator
			replay[4] = seed;
			// encode replay data
			replay[5] = "";
			replayData.position = 0;
			while (replayData.position < replayData.length) {
				replay[5] += String.fromCharCode(replayData.readUnsignedByte());
			}
			// level identification
			replay[6] = Global.global.game.map;
			replay[7] = Global.global.game.pack;
			// are we meant to save this replay type?
			var highest:Array = bestTime(replay[0], Global.global.game.map, Global.global.game.pack);
			if (replay[1] == ReplayType.WIN && replay[3] < highest[0]) {
				// aw yis, highscore - always save
			} else if (replay[1] == ReplayType.DEATH && !Global.getData("replay_death")) return;
			else if (replay[1] == ReplayType.WIN && !Global.getData("replay_win")) return;
			else if (replay[1] == ReplayType.RESET && !Global.getData("replay_reset")) return;
			else if (replay[1] == ReplayType.EXIT && !Global.getData("replay_exit")) return;
			// write to file
			Global.so.data.replays.push(replay);
			Global.so.flush();
		}
	}
}