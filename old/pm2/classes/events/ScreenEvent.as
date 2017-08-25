/**
 *  filename: events/ScreenEvent.as
 *  author: Jake Barnes
 *  modified: 3-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package events {
	public class ScreenEvent extends GlobalEvent {
		public static const BACK:String = "back";
		
		public function ScreenEvent (type:String) {
			super(type, Global.stage);
		}
	}
}