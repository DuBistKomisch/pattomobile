/**
 *  filename: MusicManger.as
 *  author: Jake Barnes
 *  modified: 11-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import flash.events.Event
	import flash.events.IOErrorEvent
	import flash.media.Sound
	import flash.media.SoundChannel
	import flash.media.SoundTransform
	import flash.net.URLRequest
	
	public class MusicManager {
		private static var sound:Sound
		private static var channel:SoundChannel
		private static var position:int = 0
		private static var valid:Boolean = false
		private static var file:String = ""
		private static var active:Boolean = false
		
		public static function setMusic(name:String = null, restart:Boolean = false) {
			if (name == null || name == "") {
				stop();
				soundFail();
			} else if (name == file) {
				if (restart) stop(); // stop and return to start if we want to restart
				play();
			} else {
				stop()
				file = name
				valid = false
				var request = new URLRequest(Global.getConfig("bgm", name))
				sound = new Sound()
				sound.addEventListener(IOErrorEvent.IO_ERROR, soundError)
				sound.addEventListener(Event.COMPLETE, soundLoaded)
				try {
					sound.load(request)
				} catch (error:Error) {
					DebugConsole.trace("failed to load audio file \""+sound.url+"\": " + error.message, 1)
					soundFail();
				}
			}
		}
		
		private static function soundFail () {
			if (sound) {
				sound.removeEventListener(IOErrorEvent.IO_ERROR, soundError);
				sound.removeEventListener(Event.COMPLETE, soundLoaded);
				sound = null;
			}
			file = "";
			valid = false;
		}
		
		private static function soundError (event:IOErrorEvent) {
			DebugConsole.trace("failed to load audio file \""+sound.url+"\": " + event.text, 1)
			soundFail();
		}
		
		private static function soundLoaded (event:Event) {
			DebugConsole.trace("loaded and playing audio file \""+file+"\" (" + Util.fileSize(sound.bytesTotal) + ")")
			sound.removeEventListener(IOErrorEvent.IO_ERROR, soundError);
			sound.removeEventListener(Event.COMPLETE, soundLoaded);
			valid = true
			play()
		}
		
		private static function soundFinished (event:Event) {
			channel.removeEventListener(Event.SOUND_COMPLETE, soundFinished)
			stop()
			play()
		}
		
		public static function play () {
			if (valid && !playing) {
				channel = sound.play(position)
				channel.soundTransform = new SoundTransform(Global.getData("volume_bgm") * Global.getData("en_bgm") * Number(!Global.global.mute))
				channel.addEventListener(Event.SOUND_COMPLETE, soundFinished, false, 0, true)
				active = true
				position = 0
			}
		}
		
		public static function pause () {
			if (valid && playing) {
				position = channel.position
				channel.stop()
				active = false
			}
		}
		
		public static function stop () {
			if (valid && playing) {
				position = 0
				channel.stop()
				active = false
			}
		}
		
		public static function set music (m:String) {
			setMusic(m)
		}
		
		public static function get music ():String {
			return file
		}
		
		public static function set playing (p:Boolean) {
			if (p)
				play()
			else
				stop()
		}
		
		public static function get playing ():Boolean {
			return active
		}
		
		public static function set paused (p:Boolean) {
			if (p)
				pause()
			else
				play()
		}
		
		public static function get paused ():Boolean {
			return Boolean(!active && Boolean(position));
		}
		
		public static function set stopped (p:Boolean) {
			if (p)
				stop()
			else
				play()
		}
		
		public static function get stopped ():Boolean {
			return Boolean(!active && !Boolean(position));
		}
		
		public static function updateVolume () {
			if (valid) channel.soundTransform = new SoundTransform(Global.getData("volume_bgm") * Global.getData("en_bgm") * Number(!Global.global.mute))
		}
	}
}