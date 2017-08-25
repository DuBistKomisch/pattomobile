/**
 *  filename: ediot/characters/EdiotCar.as
 *  author: Jake Barnes
 *  modified: 2-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package ediot.characters {
	import flash.display.Sprite;
	
	public class EdiotCar extends EdiotAbstractCharacter {
		public override function redraw ():void {
			super.redraw();
			graphics.clear();
			graphics.beginFill(0xFF0000);
			graphics.drawCircle(-40,0,20);
			graphics.drawCircle(40,0,20);
			graphics.beginFill(0x0080FF);
			graphics.drawRect(-30,-10,60,20);
			graphics.endFill();
		}
		
		public static function preview (s:Sprite, data:XML) {
			EdiotAbstractCharacter.preview(s, data);
			s.graphics.drawCircle(-40,0,20);
			s.graphics.drawCircle(40,0,20);
			s.graphics.drawRect(-30,-10,60,20);
		}
		
		public override function outline (s:Sprite):void {
			preview(s, node);
		}
	}
}