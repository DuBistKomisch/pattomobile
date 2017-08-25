/**
 *  filename: Global.as
 *  author: Jake Barnes
 *  modified: 30/12/2009
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 *
 *	changelog:
 *		27/9/2009 - updated server-side script URLs
 *					move save file functionality to SaveFile class
 *		29/9/2009 - added groups and layers lists
 *		30/9/2009 - added collisions array
 */

package {
	import flash.events.Event
	import flash.events.EventDispatcher
	import flash.net.SharedObject
	import flash.desktop.NativeApplication
	import flash.display.Stage
	
	public dynamic class Global {
		public static var global:Object = new Object() // various other globally accessible information
		public static var libs:Object = new Object() // holds loaded library swf files
		public static var packs:Object = new Object() // holds loaded level packs
		public static var config:Object = new Object() // holds config file contents in URLVariables format
		public static var functions:Object = new Object() // holds functions that need to be accesible everywhere
		public static var events:Object = new EventDispatcher() // manages global events
		public static var so:SharedObject = null // data file shared object
		public static var save:SaveFile = null // currently loaded save file 
		public static var stage:Stage = null
		public static var application:NativeApplication = null
		public static var groups:Object = null // hold groups of physics objects
		public static var layers:Object = null // hold graphics layers
		public static var collisions:Array = null; // holds a list of particles which have collided this frame
		
		// --- shared object functions
		
		//function to get data from data file, or set default value it is doesn't exist
		public static function checkData (name, def) {
			if (so.data[name] == undefined) so.data[name] = def
			return so.data[name]
		}
		
		//function to set data in the data file
		public static function setData (name, value) {
			if (so.data[name] != value) DebugConsole.trace("pm2." + name + " = \"" + value + "\"")
			so.data[name] = value
			return so.data[name]
		}
		
		//function to get data from the data file
		public static function getData (name) {
			return so.data[name]
		}
		
		//function to swap a boolean value in the data file
		public static function toggleData (name) {
			so.data[name] = !so.data[name]
			DebugConsole.trace("pm2." + name + " = \"" + so.data[name] + "\"")
			return so.data[name]
		}
		
		// --- other functions
		
		//retrieve data from a config file
		public static function getConfig (file:String, prop:String):String {
			if (config[file])
				return config[file][prop]
			else
				return ""
		}
		
		public static function get domain ():String {
			return global.debugMode ? "http://localhost/sss/" : "http://sss.dbkmedia.com/"
		}
		
		//create function to handle a fatal error
		public static function fatalError (num:int = 0, title:String = "Fatal Error", message:String = "[no help availiable]") {
			//KeyDown.setGlobal(KeyboardEvent.KEY_DOWN, quit)
			KeyDown.setGlobal(Global.functions.quit)
			fatalCleanup()
			stage.addChild(new FatalError(title + " #" + num, message))
			DebugConsole.visible = true
			DebugConsole.trace("FATAL: " + title + " #" + num, 2)
			DebugConsole.trace("cleanup: fatal override script")
		}
		
		//placeholder for cleanup routine in case of fatal error
		public static var fatalCleanup:Function = function () {}
	}
}