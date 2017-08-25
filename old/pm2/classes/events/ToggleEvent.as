/**
 *  filename: events/ToggleEvent.as
 *  author: Jake Barnes
 *  modified: 3-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package events {
	public class ToggleEvent extends GlobalEvent {
		public static const MUTE:String = "mute";
		public static const PAUSE:String = "pause";
		
		public function ToggleEvent (type:String, nowOn:Boolean) {
			super(type, Global.stage, nowOn);
		}
		
		public function get toggle ():Boolean {
			return r[0];
		}
	}
}