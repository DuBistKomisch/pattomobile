/**
 *  filename: SaveFile.as
 *  author: Jake Barnes
 *  modified: 9-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	
	public class SaveFile {
		public var last:Number;
		public var started:Number;
		public var progress:uint;
		public var pack:String;
		public var id:Number;
		
		public function SaveFile (init = null) {
			if (init is uint) {
				last     = Global.so.data.save[init][0];
				started  = Global.so.data.save[init][1];
				progress = Global.so.data.save[init][2];
				pack     = Global.so.data.save[init][3];
				id       = init;
			} else if (init is String) {
				last     = (new Date()).time;
				started  = (new Date()).time;
				progress = 0;
				pack     = init;
				id       = Global.so.data.save.length;
			} else throw new ArgumentError("SaveFile must be instatiated either with the id of a save file or the name a level pack to start a new game.");
		}
		
		public function flush () {
			DebugConsole.trace("saving game " + id + ": pack = " + pack + ", progress = " + progress);
			if (Global.so.data.save[id] == null) {
				// prepare new save file
				Global.so.data.save[id] = new Array();
			}
			Global.so.data.save[id][0] = last = (new Date()).time;
			Global.so.data.save[id][1] = started;
			Global.so.data.save[id][2] = progress;
			Global.so.data.save[id][3] = pack;
			// save to disk
			Global.so.flush();
		}
		
		public function finishedLevel (level:uint):Boolean {
			if (level == progress) {
				// passed the level we're up to
				progress++;
				flush();
				// return whether we've passed the last level in the level pack
				return (progress == Global.packs[pack].length);
			}
			return false;
		}
	}
}