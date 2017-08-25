/**
 *  filename: events/EdiotEvent.as
 *  author: Jake Barnes
 *  modified: 3-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package events {
	public class EdiotEvent extends GlobalEvent {
		public static const UI_HIDE:String = "hideUI";
		public static const UI_SHOW:String = "showUI";
		
		public function EdiotEvent (type:String) {
			super(type, Global.stage);
		}
	}
}