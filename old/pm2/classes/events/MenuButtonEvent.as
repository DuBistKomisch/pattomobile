/**
 *  filename: events/MenuButtonEvent.as
 *  author: Jake Barnes
 *  modified: 3-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package events {
	import flash.events.IEventDispatcher;
	
	public class MenuButtonEvent extends GlobalEvent {
		public static const BACK:String = "back";
		public static const CLICK:String = "click";
		
		public function MenuButtonEvent (type:String, index:uint) {
			super(type, Global.stage, index);
		}
		
		public function get id ():uint {
			return r[0];
		}
	}
}