/**
 *  filename: libLevels.as
 *  author: Jake Barnes
 *  modified: 4-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import flash.display.Sprite;
	import flash.display.MovieClip;
	
	public class libLevels extends Sprite {
		protected var levels:Vector.<XML> = new Vector.<XML>();
		protected var arts:Vector.<Sprite> = new Vector.<Sprite>();
		protected var cutsceneArts:Array = new Array();
		protected var cutscenes:Array = new Array();
		private var _label:String;
		private var _desc:String;
		private var _splash;
		
		public function libLevels (l:String = "", d:String = "", s = null) {
			_label = l;
			_desc = d;
			if (s) _splash = s;
		}
		
		public final function get label ():String {
			return _label;
		}
		
		public final function get desc ():String {
			return _desc;
		}
		
		public final function get length ():uint {
			return levels.length;
		}
		
		public final function get splash ():Sprite {
			return _splash ? new _splash() : new Sprite();
		}
		
		public final function getData (id:uint):XML {
			if (id < levels.length)
				return levels[id];
			else throw new RangeError("No level with that ID.");
		}
		
		public final function getArt (id:uint):Sprite {
			if (arts[id])
				return arts[id];
			else return new Sprite();
		}
		
		public final function numCutscenes (upto:uint):uint {
			for (var i:uint = 0, count:uint = 0; i <= upto; i++)
				if (isCutscene(i))
					count++;
			return count;
		}
		
		public final function isCutscene (id:uint):Boolean {
			return cutscenes[id] != null;
		}
		
		public final function getCutsceneArt (id:uint):Sprite {
			if (isCutscene(id)) {
				if (cutsceneArts[id])
					return cutsceneArts[id];
				else
					return new Sprite();
			} else return null;
		}
		
		public final function getCutscene (id:uint):MovieClip {
			if (isCutscene(id))
				return new cutscenes[id]();
			else return null;
		}
	}
}