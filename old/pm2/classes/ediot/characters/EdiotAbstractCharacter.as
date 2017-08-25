/**
 *  filename: ediot/characters/EdiotAbstractCharacter.as
 *  author: Jake Barnes
 *  modified: 2-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package ediot.characters {
	import flash.display.Sprite;
	import ediot.IEdiotObject;
	import ediot.Toolability;
	
	public class EdiotAbstractCharacter extends Sprite implements IEdiotObject {
		public var node:XML;
		
		public function initialise (init:XML):void {
			node = init;
		}
		
		public function redraw ():void {
			x = node.x;
			y = node.y;
		}
		
		public static function preview (s:Sprite, data:XML) {
			s.x = data.x;
			s.y = data.y;
		}
		
		public function outline (s:Sprite):void {
			preview(s, node);
		}
		
		public function cleanup ():void {
			graphics.clear();
			node = null;
			location = null;
		}
		
		public function get myNode ():XML {
			return node;
		}
		
		public function parentNode (rootNode:XML):XML {
			return rootNode.characters[0];
		}
		
		public function get layer ():String {
			return "middle";
		}
		
		public function get moveability ():uint {
			return Toolability.NORMAL;
		}
		
		public function moveBy (dx:Number, dy:Number):void {
			myNode.x = x = Number(myNode.x) + dx;
			myNode.y = y = Number(myNode.y) + dy;
		}
		
		public function get resizability ():uint {
			return Toolability.NONE;
		}
		
		public function resizeBy (ds:Number):void {
			// nope
		}
		
		public function get rotatability ():uint {
			return Toolability.NONE;
		}
		
		public function rotateBy (dr:Number):void {
			// nope
		}
	}
}