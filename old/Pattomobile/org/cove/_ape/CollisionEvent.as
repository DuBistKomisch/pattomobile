package org.cove.ape {
	import flash.events.Event
	
	public class CollisionEvent extends Event {
		public var data
		public var p
		public var s
		
		public function CollisionEvent (type, part, self) {
			super(type)
			p = part
			s = self
		}
	}
}