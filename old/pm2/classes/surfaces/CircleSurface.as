/**
 *  filename: surfaces/CircleSurface.as
 *  author: Jake Barnes
 *  modified: 11-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package surfaces {
	import org.cove.ape.*
	
	/** init settings
	 * x,y - co-ordinates of the centre of the rectangle
	 * radius - how large the circle should be from the centre
	 */
	
	public class CircleSurface extends AbstractSurface {
		
		public function CircleSurface (init:XML) {
			var r:Number = Math.abs(init.radius);
			super(init, new CircleParticle(init.x, init.y, r));
			
			graphics.beginFill(colour);
			graphics.drawEllipse(-r, -r, r * 2, r * 2);
			graphics.endFill();
		}
	}
}