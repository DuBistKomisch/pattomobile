package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import DBK.Global
	
	public class Bridge extends Sprite {
		var b:Composite
		var p0:CircleParticle
		var p1:CircleParticle
		var p:Array
		var c:Array
		var col:uint
		
		public function Bridge (xl:Number, yl:Number, xr:Number, yr:Number, n:uint, s:Number, col:String) {
			b = new Composite()
			p = new Array(n)
			c = new Array(n+1)
			p0 = new CircleParticle(xl, yl, 10, true)
			p[0] = new CircleParticle(xl + (xr - xl) * (1 / (n + 1)), yl + (yr - yl) * (1 / (n + 1)), 10, false)
			c[0] = new SpringConstraint(p0, p[0], s, true, 20, 0.8, true)
			for (var i:uint = 1; i < n; i++) {
				p[i] = new CircleParticle(xl + (xr - xl) * ((i + 1) / (n + 1)), yl + (yr - yl) * ((i + 1) / (n + 1)), 10, false)
				c[i] = new SpringConstraint(p[i-1], p[i], s, true, 20, 0.8, true)
				b.addParticle(p[i])
				b.addConstraint(c[i])
			}
			p1 = new CircleParticle(xr, yr, 10, true)
			c[n] = new SpringConstraint(p[n-1], p1, s, true, 20, 0.8, true)
			b.addParticle(p0)
			b.addParticle(p[0])
			b.addConstraint(c[0])
			b.addConstraint(c[n])
			b.addParticle(p1)
			Global.global.fixed.addComposite(b)
			this.col = Number("0x"+col)
			addEventListener(Event.ENTER_FRAME, drawFrame)
			
			graphics.clear()
			graphics.lineStyle(20, this.col)
			graphics.moveTo(p0.px, p0.py)
			for (i = 0; i < p.length; i++) {
				graphics.lineTo(p[i].px, p[i].py)
			}
			graphics.lineTo(p1.px, p1.py)
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				graphics.clear()
				graphics.lineStyle(20, col)
				graphics.moveTo(p0.px, p0.py)
				for (var i:uint = 0; i < p.length; i++) {
					graphics.lineTo(p[i].px, p[i].py)
				}
				graphics.lineTo(p1.px, p1.py)
			}
		}
		
		public function cleanup () {
			removeEventListener(Event.ENTER_FRAME, drawFrame)
			Global.global.fixed.setForRemoval(b)
		}
	}
}