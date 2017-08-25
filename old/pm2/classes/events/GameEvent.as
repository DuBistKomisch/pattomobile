/**
 *  filename: events/GameEvent.as
 *  author: Jake Barnes
 *  modified: 5-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package events {
	public class GameEvent extends GlobalEvent {
		public static const FINISH:String = "finish";
		public static const RESET:String = "reset";
		public static const KILL:String = "kill";
		
		public function GameEvent (type:String) {
			super(type, Global.stage);
		}
	}
}