/**
 *  filename: surfaces/RectangleSurface.as
 *  author: Jake Barnes
 *  modified: 11-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package surfaces {
	import org.cove.ape.*
	
	/** init settings
	 * x,y - co-ordinates of the centre of the rectangle
	 * width - how large x-wise rectangle should be
	 * height - how large y-wise the rectangle should be
	 * rotation - [optional, default 0] how much to rotate the rectangle by in degrees clockwise
	 */
	
	public class RectangleSurface extends AbstractSurface {
		var rw:Number;
		var rh:Number;
		
		public function RectangleSurface (init:XML) {
			rw = Math.abs(init.width);
			rh = Math.abs(init.height);
			
			super(init, new RectangleParticle(init.x, init.y, rw, rh, (Number(init.rotation)?init.rotation/180*Math.PI:0)));
			
			graphics.beginFill(colour);
			graphics.drawRect(-rw/2, -rh/2, rw, rh);
			graphics.endFill();
		}
		
		public override function redraw ():void {
			super.redraw();
			rotation = RectangleParticle(p0).angle;
		}
	}
}