/**
 *  filename: events/PlayEvent.as
 *  author: Jake Barnes
 *  modified: 6-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package events {
	public class PlayEvent extends GlobalEvent {
		public static const GAME:String = "game";
		
		public function PlayEvent (gType:uint, m:uint = 0, p = "") {
			super(PlayEvent.GAME, Global.stage, gType, m, p);
		}
		
		public function get gameType ():uint {
			return r[0];
		}
		
		public function get map ():uint {
			return r[1];
		}
		
		public function get pack ():String {
			return r[2];
		}
	}
}