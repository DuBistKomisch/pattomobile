/**
 *  filename: surfaces/LineSurface.as
 *  author: Jake Barnes
 *  modified: 11-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package surfaces {
	import org.cove.ape.APEVector;
	
	/** init settings
	 * x1,y1 - co-ordinates of the left-most point to connect
	 * x2,y2 - co-ordinates of the right-most point to connect
	 * thickness - how thick to make the line
	 * size - [optional, default 1] the percentage of width between the end points to take up
	 * position - [optional, default 0] offset the centre perpendicular to the line by the thickness this many times
	 */
	
	public class LineSurface extends RectangleSurface {
		public function LineSurface (init:XML) {
			var width:Number = Math.sqrt(Math.pow(init.x2-init.x1,2)+Math.pow(init.y2-init.y1,2))*(Number(init.size)?init.size:1);
			var rotation:Number = Math.atan2(init.y2-init.y1,init.x2-init.x1);
			var centre:APEVector = new APEVector((Number(init.x1)+Number(init.x2))/2,(Number(init.y1)+Number(init.y2))/2);
			if (Number(init.position)) {
				var offset:APEVector = new APEVector(init.thickness/2*Math.sin(rotation),-init.thickness/2*Math.cos(rotation));
				centre.plusEquals(offset.mult(init.position));
			}
			var init2:XML = init.copy();
			init2.appendChild(XML("<x>"+centre.x+"</x>"));
			init2.appendChild(XML("<y>"+centre.y+"</y>"));
			init2.appendChild(XML("<width>"+width+"</width>"));
			init2.appendChild(XML("<height>"+init.thickness+"</height>"));
			init2.appendChild(XML("<rotation>"+(rotation*180/Math.PI)+"</rotation>"));
			super(init2);
		}
	}
}