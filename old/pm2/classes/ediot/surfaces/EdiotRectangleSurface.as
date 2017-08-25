/**
 *  filename: ediot/surfaces/EdiotRectangleSurface.as
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
	
	public class EdiotRectangleSurface extends Sprite implements IEdiotObject {
		public var node:XML;
		
		public function initialise (init:XML):void {
			node = init;
		}
		
		public function redraw ():void {
			x = node.x;
			y = node.y;
			rotation = node.rotation;
			graphics.clear();
			graphics.beginFill(Util.hex(Util.getColour(node.colour, node.kill == "true" ? "kill" : "normal", node.parent().parent().colours[0])));
			graphics.drawRect(-node.width/2, -node.height/2, node.width, node.height);
			graphics.endFill();
		}
		
		public static function preview (s:Sprite, data:XML) {
			s.x = data.x;
			s.y = data.y;
			s.rotation = Number(data.rotation) ? Number(data.rotation) : 0;
			s.graphics.drawRect(-data.width/2, -data.height/2, data.width, data.height);
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
			return Toolability.COMPLEX;
		}
		
		public function resizeBy (ds:Number):void {
			// nope, we're COMPLEX
		}
		
		public function resize (od:Object, perm:Boolean = false) {
			var here:Point = new Point(x, y);
			var start:Point = Util.rotatePoint(od.start.subtract(here), Number(myNode.rotation));
			var end:Point = Util.rotatePoint(od.end.subtract(here), Number(myNode.rotation));
			scaleX = end.x / start.x;
			scaleY = end.y / start.y;
			if (perm) {
				myNode.width = Number(myNode.width) * scaleX;
				myNode.height = Number(myNode.height) * scaleY;
				scaleX = scaleY = 1;
				redraw();
			}
		}
		
		public function get rotatability ():uint {
			return Toolability.NORMAL;
		}
		
		public function rotateBy (dr:Number):void {
			myNode.rotation = rotation = Number(myNode.rotation) + dr;
		}
	}
}