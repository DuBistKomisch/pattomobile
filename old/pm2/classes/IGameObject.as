package {
	import org.cove.ape.AbstractParticle;
	
	public interface IGameObject {
		function step ():void;
		function redraw ():void;
		function collide (mine:AbstractParticle, other:AbstractParticle):void;
		function cleanup ():void;
		
		function get layer ():String;
		function get needsRedraw ():Boolean;
	}
}