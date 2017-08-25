package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import DBK.Global
	
	public class Squish extends Sprite {
		var s:Composite
		var p:Array
		var c:Array
		var t:Array
		var h:Array
		var l:Vector
		var r:Vector
		var col:uint
		
		public function Squish (pts:XMLList, tension:Number, col:String) {
			//setup
			var n = pts.length()
			s = new Composite()
			p = new Array(n)
			c = new Array(n-1)
			t = new Array(n)
			h = new Array(n)
			
			p[0] = new CircleParticle(pts[0].@x, pts[0].@y, 10, false)
			l = new Vector(pts[n-1].@x-pts[0].@x, pts[n-1].@y-pts[0].@y)
			r = new Vector(pts[1].@x-pts[0].@x, pts[1].@y-pts[0].@y)
			h[0] = new CircleParticle(pts[0].@x-(l.x+r.x)/2, pts[0].@y-(l.y+r.y)/2, 1, true)
			h[0].visible = false
			t[0] = new SpringConstraint(p[0], h[0], tension)
			s.addParticle(p[0])
			s.addParticle(h[0])
			s.addConstraint(t[0])
			for (var i:uint = 1; i < (n - 1); i++) {
				p[i] = new CircleParticle(pts[i].@x, pts[i].@y, 10, false)
				c[i-1] = new SpringConstraint(p[i], p[i-1], tension, true, 20, 1, true)
				l = new Vector(pts[i-1].@x-pts[i].@x, pts[i-1].@y-pts[i].@y)
				r = new Vector(pts[i+1].@x-pts[i].@x, pts[i+1].@y-pts[i].@y)
				h[i] = new CircleParticle(pts[i].@x-(l.x+r.x)/2, pts[i].@y-(l.y+r.y)/2, 1, true)
				h[i].visible = false
				t[i] = new SpringConstraint(p[i], h[i], tension)
				s.addParticle(p[i])
				s.addConstraint(c[i-1])
				s.addParticle(h[i])
				s.addConstraint(t[i])
			}
			p[n-1] = new CircleParticle(pts[n-1].@x, pts[n-1].@y, 10, false)
			c[n-2] = new SpringConstraint(p[n-1], p[n-2], tension, true, 20, 1, true)
			l = new Vector(pts[n-2].@x-pts[n-1].@x, pts[n-2].@y-pts[n-1].@y)
			r = new Vector(pts[0].@x-pts[n-1].@x, pts[0].@y-pts[n-1].@y)
			h[n-1] = new CircleParticle(pts[n-1].@x-(l.x+r.x)/2, pts[n-1].@y-(l.y+r.y)/2, 1, true)
			h[n-1].visible = false
			t[n-1] = new SpringConstraint(p[n-1], h[n-1], tension)
			s.addParticle(p[n-1])
			s.addConstraint(c[n-2])
			s.addParticle(h[n-1])
			s.addConstraint(t[n-1])
			
			Global.global.fixed.addComposite(s)
			this.col = Number("0x"+col)
			addEventListener(Event.ENTER_FRAME, drawFrame)
			
			graphics.clear()
			graphics.lineStyle(20, this.col)
			graphics.beginFill(this.col)
			graphics.moveTo(p[0].px, p[0].py)
			for (i = 1; i < p.length; i++) {
				graphics.lineTo(p[i].px, p[i].py)
			}
			graphics.endFill()
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				graphics.clear()
				graphics.lineStyle(20, col)
				graphics.beginFill(col)
				graphics.moveTo(p[0].px, p[0].py)
				for (var i:uint = 1; i < p.length; i++) {
					graphics.lineTo(p[i].px, p[i].py)
				}
				graphics.endFill()
			}
		}
		
		public function cleanup () {
			removeEventListener(Event.ENTER_FRAME, drawFrame)
			Global.global.fixed.setForRemoval(s)
		}
	}
}