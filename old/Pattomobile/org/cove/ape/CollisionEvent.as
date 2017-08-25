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
		
		/**
		 * Stops APE from continuing to check collisions. Call this if APE needs to be disassembled in the middle of collision checking.
		 */
		public override function preventDefault ():void {
			//stop collision checking
		}
	}
}