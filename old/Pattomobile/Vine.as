package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import flash.net.SharedObject
	import DBK.Global
	
	public class Vine extends Sprite {
		var v:Composite
		var p0:CircleParticle
		var p1:CircleParticle
		var p:Array
		var c:Array
		var col:uint
		var n:uint
		var isAttached:Boolean = false
		var _c:int = 0
		var so:SharedObject
		
		public function Vine (xp:Number, yp:Number, len:Number, n:uint, s:Number, col:String) {
			so = SharedObject.getLocal("pattomobile", "/")
			v = new Composite()
			p = new Array(n)
			c = new Array(n+1)
			p0 = new CircleParticle(xp, yp, 10, true)
			p[0] = new CircleParticle(xp, yp + len * (1 / (n + 1)), 10, false)
			c[0] = new SpringConstraint(p0, p[0], s)
			for (var i:uint = 1; i < n; i++) {
				p[i] = new CircleParticle(xp, yp + len * ((i + 1) / (n + 1)), 10, false)
				c[i] = new SpringConstraint(p[i-1], p[i], s)
				v.addParticle(p[i])
				p[i].visible = false
				v.addConstraint(c[i])
			}
			p1 = new CircleParticle(xp, yp + len, 25, false)
			c[n] = new SpringConstraint(p[n-1], p1, s)
			v.addParticle(p0)
			p0.visible = false
			v.addParticle(p[0])
			p[0].visible = false
			v.addConstraint(c[0])
			v.addConstraint(c[n])
			v.addParticle(p1)
			Global.global.fixed.addComposite(v)
			this.col = Number("0x"+col)
			this.n = n
			addEventListener(Event.ENTER_FRAME, drawFrame)
			p1.addEventListener("car", attachCar)
			
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
				_c++
				if (!_c) p1.visible = true
				if (isAttached) {
					if (Global.global.replay) {
						if (Global.global.fdata[0] == "1") {
							p1.velocity = p1.velocity.plus(new Vector(-0.2, 0))
						} else if (Global.global.fdata[1] == "1") {
							p1.velocity = p1.velocity.plus(new Vector(0.2, 0))
						}
						if (Global.global.fdata[2] == "1") {
							p1.velocity = p1.velocity.plus(new Vector(0, -0.2))
						} else if (Global.global.fdata[3] == "1") {
							p1.velocity = p1.velocity.plus(new Vector(0, 0.2))
						}
						if (Global.global.fdata[5] == "1") detachCar()
					} else {
						if (Global.global.key.isDown(so.data.key1)) {
							p1.velocity = p1.velocity.plus(new Vector(-0.2, 0))
						} else if (Global.global.key.isDown(so.data.key2)) {
							p1.velocity = p1.velocity.plus(new Vector(0.2, 0))
						}
						if (Global.global.key.isDown(so.data.key3)) {
							p1.velocity = p1.velocity.plus(new Vector(0, -0.2))
						} else if (Global.global.key.isDown(so.data.key4)) {
							p1.velocity = p1.velocity.plus(new Vector(0, 0.2))
						}
						if (Global.global.key.isDown(so.data.key10)) detachCar()
					}
				}
			}
		}
		
		private function attachCar (event:Event) {
			if (event.p is WheelParticle) {
				v.setForRemoval(event.s)
				p1 = c[n].p2 = event.p
				isAttached = true
			}
		}
		
		private function detachCar () {
			p1 = c[n].p2 = new CircleParticle(p1.px, p1.py, 25, false)
			p1.addEventListener("car", attachCar)
			p1.visible = false
			v.addParticle(p1)
			_c = -30
			isAttached = false
		}
		
		public function cleanup () {
			removeEventListener(Event.ENTER_FRAME, drawFrame)
			Global.global.fixed.setForRemoval(v)
		}
	}
}