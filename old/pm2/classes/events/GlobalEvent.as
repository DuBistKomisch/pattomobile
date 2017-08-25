/**
 *  filename: events/GlobalEvent.as
 *  author: Jake Barnes
 *  modified: 8-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package events {
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.getQualifiedClassName;
	
	public dynamic class GlobalEvent extends Event {
		public static const ESCAPE:String = "PM2.EscapeKey";
		
		private var _t:IEventDispatcher;
		private var _r:Array;
		
		public function GlobalEvent (type:String, target:IEventDispatcher, ...rest) {
			super(type);
			_t = target;
			_r = rest;
		}
		
		public function get t ():IEventDispatcher {
			return _t;
		}
		
		public function get r ():Array {
			return _r;
		}
		
		public override function toString ():String {
			var str:String = "[" + getQualifiedClassName(this) + " type=" + type + " t=" + t;
			for (var i:uint = 0; i < r.length; i++)
				str += " r[" + i + "]=" + r[i];
			return str + "]";
		}
	}
}