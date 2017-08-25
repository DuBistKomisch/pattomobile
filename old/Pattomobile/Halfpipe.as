package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import DBK.Global
	
	public class Halfpipe extends Sprite {
		
		public function Halfpipe (cx:Number, cy:Number, radius:Number, start:Number, end:Number, n:uint, wi:Number, he:Number, col:String) {
			var rects = new Array(n+1)
			
			rects[0] = new RectangleSurface(cx+Math.sin(start)*(radius+Math.abs(Math.sin(start)*he/2)), cy+Math.cos(start)*(radius+Math.abs(Math.cos(start)*he/2)), wi, he, -start*180/Math.PI, col, "", "")
			addChild(rects[0])
			for (var i:uint = 1; i < n; i++) {
				rects[i] = new RectangleSurface(cx+Math.sin(start+(end-start)*i/n)*(radius+Math.abs(Math.sin(start+(end-start)*i/n)*he/2)), cy+Math.cos(start+(end-start)*i/n)*(radius+Math.abs(Math.cos(start+(end-start)*i/n)*he/2)), wi, he, -(start+(end-start)*i/n)*180/Math.PI, col, "", "")
				addChild(rects[i])
			}
			rects[n] = new RectangleSurface(cx+Math.sin(end)*(radius+Math.abs(Math.sin(end)*he/2)), cy+Math.cos(end)*(radius+Math.abs(Math.cos(end)*he/2)), wi, he, -end*180/Math.PI, col, "", "")
			addChild(rects[n])
		}
		
		public function cleanup () {
			var n = numChildren
			for (i = 0; i < n; i++) {
				if (getChildAt(0).cleanup is Function) getChildAt(0).cleanup()
				removeChildAt(0)
			}
		}
	}
}