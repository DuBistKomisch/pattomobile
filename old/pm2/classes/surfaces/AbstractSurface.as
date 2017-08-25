/**
 *  filename: surfaces/AbstractSurface.as
 *  author: Jake Barnes
 *  modified: 7-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package surfaces {
	import events.GameEvent;
	import flash.display.Sprite;
	import org.cove.ape.*;
	
	public class AbstractSurface extends Sprite implements IGameObject {
		public var p0:AbstractParticle;
		public var colour:uint;
		
		public var exit:Boolean;
		public var fixed:Boolean;
		public var kill:Boolean;
		public var solid:Boolean;
		
		/** init options
		 * colour - [optional, default in level data] what colour to draw the surface as
		 * exit - [optional, default false] whether a character touching this surface will pass the level
		 * fixed - [optional, default true] whether the surface is fixed in place or able to move
		 * kill - [optional, default false] whether a character touching this surface will reset the level
		 * solid - [optional, default true] whether the surface is only for display
		 * visible - [optional, default true] whether the surface should appear on screen
		 * friction - [optional, default 0.5] how sticky the surface should be (ignored if not fixed)
		 */
		
		public function AbstractSurface (init:XML, particle:AbstractParticle) {
			p0 = particle;
			p0.fixed = fixed = String(init.fixed) ? init.fixed != "false" : true;
			p0.solid = solid = String(init.solid) ? init.solid != "false" : true;
			p0.friction = fixed ? String(init.friction) ? Number(init.friction) : 0.05 : 0;
			p0.type = "surface";
			p0.gameObject = this;
			Global.groups[fixed?"fixed":"mobile"].addParticle(p0);
			
			visible = String(init.visible) ? init.visible != "false" : true;
			exit = String(init.exit) ? init.exit == "true" : false;
			kill = String(init.kill) ? init.kill == "true" : false;
			var fallback:String = kill ? "kill" : "normal";
			colour = Util.hex(Util.getColour(init.colour, fallback, Global.global.data.colours[0]));
			
			redraw();
		}
		
		public function step ():void {}
		
		public function redraw ():void {
			x = p0.px;
			y = p0.py;
		}
		
		public function collide (mine:AbstractParticle, other:AbstractParticle):void {
			if (other.type == "car" && exit)
				Global.events.dispatchEvent(new GameEvent(GameEvent.FINISH));
			else if (other.type == "car" && kill)
				Global.events.dispatchEvent(new GameEvent(GameEvent.KILL));
		}
		
		public function cleanup ():void {
			Global.groups[fixed?"fixed":"mobile"].removeParticle(p0);
			p0 = null;
		}
		
		public function get layer ():String {
			return fixed ? "fixed" : "mobile";
		}
		
		public function get needsRedraw ():Boolean {
			return Boolean(!fixed && visible);
		}
	}
}