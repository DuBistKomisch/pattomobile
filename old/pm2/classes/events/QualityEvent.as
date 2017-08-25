/**
 *  filename: events/QualityEvent.as
 *  author: Jake Barnes
 *  modified: 3-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package events {
	public class QualityEvent extends GlobalEvent {
		public static const UPDATE:String = "update";
		
		public function QualityEvent (newQuality:uint) {
			super(QualityEvent.UPDATE, Global.stage, newQuality);
		}
		
		public function get quality ():uint {
			return r[0];
		}
	}
}