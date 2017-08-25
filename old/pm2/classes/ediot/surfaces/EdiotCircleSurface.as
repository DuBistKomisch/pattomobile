/**
 *  filename: ediot/surfaces/EdiotCircleSurface.as
 *  author: Jake Barnes
 *  modified: 2-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package ediot.surfaces {
	import flash.display.Sprite;
	import flash.geom.Point;
	import ediot.IEdiotObject;
	import ediot.Toolability;
	
	public class EdiotCircleSurface extends Sprite implements IEdiotObject {
		public var node:XML;
		
		public function initialise (init:XML):void {
			node = init;
		}
		
		public function redraw ():void {
			x = node.x;
			y = node.y;
			graphics.clear();
			graphics.beginFill(Util.hex(Util.getColour(node.colour, node.kill == "true" ? "kill" : "normal", node.parent().parent().colours[0])));
			graphics.drawCircle(0,0,node.radius);
			graphics.endFill();
		}
		
		public static function preview (s:Sprite, data:XML) {
			s.x = data.x;
			s.y = data.y;
			s.graphics.drawCircle(0,0,data.radius);
		}
		
		public function outline (s:Sprite):void {
			preview(s, node);
		}
		
		public function cleanup ():void {
			graphics.clear();
			node = null;
			start = end = null;
			centred = false;
		}
		
		public function get myNode ():XML {
			return node;
		}
		
		public function parentNode (rootNode:XML):XML {
			return rootNode.surfaces[0];
		}
		
		public function get layer ():String {
			return node.fixed == "true" ? "fixed" : "mobile";
		}
		
		public function get moveability ():uint {
			return Toolability.NORMAL;
		}
		
		public function moveBy (dx:Number, dy:Number):void {
			myNode.x = x = Number(myNode.x) + dx;
			myNode.y = y = Number(myNode.y) + dy;
		}
		
		public function get resizability ():uint {
			return Toolability.NORMAL;
		}
		
		public function resizeBy (ds:Number):void {
			myNode.radius = Number(myNode.radius) * ds;
			scaleX = scaleY = 1;
			redraw();
		}
		
		public function get rotatability ():uint {
			return Toolability.NONE;
		}
		
		public function rotateBy (dr:Number):void {
			// nope
		}
	}
}