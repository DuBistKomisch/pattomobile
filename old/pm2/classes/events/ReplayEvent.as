/**
 *  filename: events/ReplayEvent.as
 *  author: Jake Barnes
 *  modified: 6-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package events {
	public class ReplayEvent extends GlobalEvent {
		public static const REPLAY:String = "replay";
		
		public function ReplayEvent (gType:uint, i:uint) {
			super(ReplayEvent.REPLAY, Global.stage, gType, i);
		}
		
		public function get gameType ():uint {
			return r[0];
		}
		
		public function get id ():uint {
			return r[1];
		}
	}
}