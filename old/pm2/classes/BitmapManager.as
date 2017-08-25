/**
 *  filename: BitmapManger.as
 *  author: Jake Barnes
 *  modified: 3-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import flash.display.Bitmap;
	
	public class BitmapManager {
		private static var bitmaps:Array = new Array()
		
		public static function addBitmap (bmp:Bitmap, static:Boolean = true) {
			if (!registered(bmp)) {
				bitmaps.push({bmp:bmp, static:static})
				bmp.smoothing = static ? Global.getData("quality") : Global.getData("quality") == 3
			}
		}
		
		public static function addBitmaps (bmps:Array, static:Boolean = true) {
			for each (var bmp:Bitmap in bmps) addBitmap(bmp, static)
		}
		
		public static function removeBitmap (bmp:Bitmap) {
			if (registered(bmp)) bitmaps.splice(bitmaps.indexOf(bmp), 1)
		}
		
		public static function removeBitmaps (bmps:Array) {
			for each (var bmp:Bitmap in bmps) removeBitmap(bmp)
		}
		
		public static function registered (bmp:Bitmap) {
			return bitmaps.indexOf(bmp) != -1
		}
		
		public static function update (quality:uint) {
			for (var i:uint = 0; i < bitmaps.length; i++) {
				bitmaps[i].bmp.smoothing = bitmaps[i].static ? quality : quality == 3
			}
		}
	}
}