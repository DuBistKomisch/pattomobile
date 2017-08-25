/**
 *  filename: IEdiotObject.as
 *  author: Jake Barnes
 *  modified: 2-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package ediot {
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public interface IEdiotObject {
		// management
		function initialise (init:XML):void;
		function redraw ():void;
		function outline (s:Sprite):void;
		function cleanup ():void;
		
		// properties
		function get myNode ():XML;
		function parentNode (rootNode:XML):XML;
		function get layer ():String;
		
		// tools and flags
		function get moveability ():uint;
		function moveBy (dx:Number, dy:Number):void;
		function get resizability ():uint;
		function resizeBy (ds:Number):void; 
		function get rotatability ():uint;
		function rotateBy (dr:Number):void;
	}
}