package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import DBK.Global
	
	public class RectangleSurface extends Sprite {
		public var p0:RectangleParticle
		var rect:Sprite
		var hp:Sprite = new Sprite()
		var data, test
		var ghost:Boolean, hover:Boolean
		var tst:uint, st:uint
		var rc, rw, rh, float
		public var id:Number
		var newVel
		
		public function RectangleSurface (xpos:Number, ypos:Number, w:Number, h:Number, rot:Number, col:String, type:String, f:String, ghost = false, d = null, i:Number = 0) {
			p0 = new RectangleParticle(xpos, ypos, w, h, rot/180*Math.PI, f != "true")
			p0.visible = type != "fake"
			p0.type = type
			p0.data = d
			p0.mc = this
			rect = new Sprite()
			rect.graphics.beginFill(Number("0x"+col))
			rect.graphics.drawRect(-w/2, -h/2, w, h)
			rect.graphics.endFill()
			rc = Number("0x"+col)
			rect.x = xpos
			rect.y = ypos
			rect.rotation = rot
			if (type == "hover") {
				hp = new g_hoverpad()
				hp.x = xpos
				hp.y = ypos
				hp.rotation = rot
				hp.scaleX = w / 100
				hp.scaleY = d.split(",")[2] / 50
			}
			float = f == "true"
			if (isNaN(i) || i >= 0) {
				if (float) {
					Global.global.mobile.addParticle(p0)
				} else {
					Global.global.fixed.addParticle(p0)
				}
				addChild(hp)
				addChild(rect)
			}
			id = i
			addEventListener(Event.ENTER_FRAME, drawFrame)
			this.ghost = ghost
			this.hover = type == "hover"
			rw = w
			rh = h
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				rect.x = p0.px
				rect.y = p0.py
				rect.rotation = p0.angle
				if (ghost && parent.parent.car != null) {
					p0.visible = parent.parent.car.sparkg == null
				}
				if (hover && parent.parent.car != null) {
					test = new Vector(parent.parent.car.patto.x - rect.x, parent.parent.car.patto.y - rect.y)
					testl = new Vector(parent.parent.car.leftWheel.px - rect.x, parent.parent.car.leftWheel.py - rect.y)
					testr = new Vector(parent.parent.car.rightWheel.px - rect.x, parent.parent.car.rightWheel.py - rect.y)
					newVel = new Vector(Math.sin(p0.data.split(",")[0]/180*Math.PI), -Math.cos(p0.data.split(",")[0]/180*Math.PI))
					newPerp = new Vector(newVel.y, -newVel.x)
					if (newVel.dot(test) >= 0 && newVel.dot(test) <= p0.data.split(",")[2]) {
						newVel.multEquals(p0.data.split(",")[1])
						if (newPerp.dot(testl) > -rw/2 && newPerp.dot(testl) < rw/2) parent.parent.car.leftWheel.velocity = parent.parent.car.leftWheel.velocity.plus(newVel)
						if (newPerp.dot(testr) > -rw/2 && newPerp.dot(testr) < rw/2) parent.parent.car.rightWheel.velocity = parent.parent.car.rightWheel.velocity.plus(newVel)
						if (newPerp.dot(test) > -rw/2 && newPerp.dot(test) < rw/2) parent.parent.car.axle.scp.velocity = parent.parent.car.axle.scp.velocity.plus(newVel)
					}
				}
			}
		}
		
		public function remove (i) {
			if (i == id) {
				cleanup()
				parent.removeChild(this)
			} else if (-i == id) {
				Global.global.fixed.addParticle(p0)
				addChild(hp)
				addChild(rect)
				Global.global.fixed._particles.sort(parent.parent.arrangeParticles)
			}
		}
		
		public function smash (smashTime:uint) {
			if (p0.type != "smash") return
			cleanup()
			addEventListener(Event.ENTER_FRAME, drawSmash)
			tst = st = smashTime
		}
		
		public function drawSmash (event:Event) {
			if (! Global.global.paused) {
				rect.graphics.clear()
				rect.graphics.beginFill(rc, st/tst)
				rect.graphics.drawRect(-rw/2 - rw/2 * (1-st/tst), -rh/2 - rh/2 * (1-st/tst), rw/2, rh/2)
				rect.graphics.drawRect(rw/2 * (1-st/tst), -rh/2 - rh/2 * (1-st/tst), rw/2, rh/2)
				rect.graphics.drawRect(-rw/2 - rw/2 * (1-st/tst), rh/2 * (1-st/tst), rw/2, rh/2)
				rect.graphics.drawRect(rw/2 * (1-st/tst), rh/2 * (1-st/tst), rw/2, rh/2)
				rect.graphics.endFill()
				if (! --st) {
					removeEventListener(Event.ENTER_FRAME, drawSmash)
				}
			}
		}
		
		public function cleanup () {
			removeEventListener(Event.ENTER_FRAME, drawFrame)
			if (float) {
				Global.global.mobile.removeParticle(p0)
			} else {
				Global.global.fixed.setForRemoval(p0)
			}
		}
	}
}