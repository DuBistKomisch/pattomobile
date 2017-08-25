package {
	import org.cove.ape.*
	import flash.display.Sprite
	import flash.events.Event
	import flash.text.TextField
	import flash.text.TextFormat
	import flash.ui.Keyboard
	import flash.net.SharedObject
	import flash.geom.Matrix
	import DBK.Global
	
	public class Car extends Sprite {
		public var car:Composite
		public var leftWheel:WheelParticle
		public var rightWheel:WheelParticle
		public var axle:SpringConstraint
		public var patto:Sprite
		public var other:Sprite
		public var sparkg:Sprite = null
		public var label:TextField
		var aw:Number
		var so:SharedObject
		var pts
		var _c:uint = 0
		var flamerate = [8,4,2,1]
		public var control:Boolean = true
		
		public function Car (xpos:Number, ypos:Number) {
			so = SharedObject.getLocal("pattomobile", "/")
			car = new Composite()
			leftWheel = new WheelParticle(xpos - 40, ypos, 20, false)
			leftWheel.mass = 2
			leftWheel.type = "car"
			car.addParticle(leftWheel)
			rightWheel = new WheelParticle(xpos + 40, ypos, 20, false)
			rightWheel.mass = 2
			rightWheel.type = "car"
			car.addParticle(rightWheel)
			axle = new SpringConstraint(leftWheel, rightWheel, 0.5, true, 20, (so.data.skin<2)?0.9:1, true)
			axle.scp.type = "car"
			car.addConstraint(axle)
			Global.global.mobile.addComposite(car)
			
			patto = new Sprite()
			addChild(patto)
			
			other = new Sprite()
			addChild(other)
			
			graphics.clear()
			other.graphics.clear()
			drawLeft()
			drawRight()
			aw = axle.rectScale*Math.sqrt(Math.pow(rightWheel.px - leftWheel.px,2)+Math.pow(rightWheel.py - leftWheel.py,2))
			patto.graphics.clear()
			drawAxle()
			drawPatto()
			
			patto.x = xpos
			patto.y = ypos
			
			addEventListener(Event.ENTER_FRAME, drawFrame)
			addEvent("bounce", bounce)
			addEvent("boss", boss)
			addEvent("spark", spark)
		}
		
		private function drawFrame (event:Event) {
			if (! Global.global.paused) {
				if (control) {
					if (Global.global.replay) {
						if (Global.global.fdata[0] == "1") {
							leftWheel.angularVelocity = rightWheel.angularVelocity = -0.2
						} else if (Global.global.fdata[1] == "1") {
							leftWheel.angularVelocity = rightWheel.angularVelocity = 0.2
						} else {
							leftWheel.angularVelocity = rightWheel.angularVelocity = 0
						}
						if (Global.global.fdata[5] == "1" && so.data.level4_4 == "beaten") {
							if (sparkg == null) {
								sparkg = new g_ghost()
								sparkg.x = (rightWheel.px + leftWheel.px) / 2
								sparkg.y = (rightWheel.py + leftWheel.py) / 2
								if (so.data.skin == 8) sparkg.gotoAndPlay(61)
								addChild(sparkg)
							} else {
								sparkg.x = (rightWheel.px + leftWheel.px) / 2
								sparkg.y = (rightWheel.py + leftWheel.py) / 2
								leftWheel.velocity = leftWheel.velocity.plus(new Vector(0, -.2))
								rightWheel.velocity = rightWheel.velocity.plus(new Vector(0, -.2))
							}
						} else if (sparkg != null) {
							removeChild(sparkg)
							sparkg = null
						}
					} else {
						if (Global.global.key.isDown(so.data.key1)) {
							leftWheel.angularVelocity = rightWheel.angularVelocity = -0.2
						} else if (Global.global.key.isDown(so.data.key2)) {
							leftWheel.angularVelocity = rightWheel.angularVelocity = 0.2
						} else {
							leftWheel.angularVelocity = rightWheel.angularVelocity = 0
						}
						if (Global.global.key.isDown(so.data.key10) && so.data.level4_4 == "beaten") {
							if (sparkg == null) {
								sparkg = new g_ghost()
								sparkg.x = (rightWheel.px + leftWheel.px) / 2
								sparkg.y = (rightWheel.py + leftWheel.py) / 2
								if (so.data.skin == 8) sparkg.gotoAndPlay(61)
								addChild(sparkg)
							} else {
								sparkg.x = (rightWheel.px + leftWheel.px) / 2
								sparkg.y = (rightWheel.py + leftWheel.py) / 2
								leftWheel.velocity = leftWheel.velocity.plus(new Vector(0, -.2))
								rightWheel.velocity = rightWheel.velocity.plus(new Vector(0, -.2))
							}
						} else if (sparkg != null) {
							removeChild(sparkg)
							sparkg = null
						}
					}
				} else {
					leftWheel.angularVelocity = rightWheel.angularVelocity = 0
					if (sparkg != null) {
						removeChild(sparkg)
						sparkg = null
					}
				}
				
				graphics.clear()
				other.graphics.clear()
				drawLeft()
				drawRight()
				aw = axle.rectScale*Math.sqrt(Math.pow(rightWheel.px - leftWheel.px,2)+Math.pow(rightWheel.py - leftWheel.py,2))
				patto.graphics.clear()
				drawAxle()
				
				patto.x = (rightWheel.px + leftWheel.px) / 2
				patto.y = (rightWheel.py + leftWheel.py) / 2
				patto.rotation = _c ? axle.scp.angle + 180 : 0
				_c++
			}
		}
		
		private function drawLeft () {
			if (so.data.skin == 0) {
				graphics.beginFill(0xFF0000)
				graphics.drawCircle(leftWheel.px, leftWheel.py, leftWheel.radius)
				graphics.endFill()
			} else if (so.data.skin == 1) {
				graphics.beginFill(0xBE8530)
				graphics.drawCircle(leftWheel.px, leftWheel.py, leftWheel.radius)
				graphics.endFill()
			} else if (so.data.skin == 2) {
				graphics.lineStyle(3, 0x009900)
				graphics.drawCircle(leftWheel.px, leftWheel.py, leftWheel.radius)
				pts = new Vector(Math.sin(leftWheel.radian), -Math.cos(leftWheel.radian)).multEquals(leftWheel.radius)
				graphics.moveTo(leftWheel.px+pts.x,leftWheel.py+pts.y)
				graphics.lineTo(leftWheel.px-pts.x,leftWheel.py-pts.y)
				graphics.moveTo(leftWheel.px-pts.y,leftWheel.py+pts.x)
				graphics.lineTo(leftWheel.px+pts.y,leftWheel.py-pts.x)
			} else if (so.data.skin == 3) {
				//no wheel
			} else if (so.data.skin == 4) {
				graphics.lineStyle(3, 0xFF0000)
				graphics.drawCircle(leftWheel.px, leftWheel.py, leftWheel.radius)
			} else if (so.data.skin == 5) {
				if (other.numChildren == 0) {
					other.addChild(new s_modern_wheel())
					other.addChild(new s_modern_wheel())
				}
				other.getChildAt(0).x = leftWheel.px
				other.getChildAt(0).y = leftWheel.py
			} else if (so.data.skin == 6) {
				if (other.numChildren == 0) {
					other.addChild(new g_pattobot())
					other.addChild(new g_pattobot())
					other.getChildAt(0).scaleX = other.getChildAt(0).scaleY = 40 / other.getChildAt(0).width
					other.getChildAt(1).scaleX = other.getChildAt(1).scaleY = 40 / other.getChildAt(1).width
				}
				other.getChildAt(0).x = leftWheel.px
				other.getChildAt(0).y = leftWheel.py
				other.getChildAt(0).rotation = leftWheel.angle
			} else if (so.data.skin == 7) {
				if (other.numChildren == 0) {
					other.addChild(new s_dark_wheel())
					other.addChild(new s_dark_wheel())
				}
				other.getChildAt(0).x = leftWheel.px
				other.getChildAt(0).y = leftWheel.py
			} else if (so.data.skin == 8) {
				if (other.numChildren == 0) {
					other.addChild(new g_flame_static())
					other.addChild(new g_flame_static()).gotoAndPlay(40)
				}
				other.getChildAt(0).x = leftWheel.px
				other.getChildAt(0).y = leftWheel.py
				if (_c % flamerate[so.data.quality] == 0) {
					var flame = addChildAt(new g_flame(), 0)
					flame.x = leftWheel.px + Math.random() * 30 - 15
					flame.y = leftWheel.py + Math.random() * 30 - 15
				}
			}
		}
		
		private function drawRight () {
			if (so.data.skin == 0) {
				graphics.beginFill(0xFF0000)
				graphics.drawCircle(rightWheel.px, rightWheel.py, rightWheel.radius)
				graphics.endFill()
			} else if (so.data.skin == 1) {
				graphics.beginFill(0xBE8530)
				graphics.drawCircle(rightWheel.px, rightWheel.py, rightWheel.radius)
				graphics.endFill()
			} else if (so.data.skin == 2) {
				graphics.lineStyle(3, 0x009900)
				graphics.drawCircle(rightWheel.px, rightWheel.py, rightWheel.radius)
				pts = new Vector(Math.sin(rightWheel.radian), -Math.cos(rightWheel.radian)).multEquals(rightWheel.radius)
				graphics.moveTo(rightWheel.px+pts.x,rightWheel.py+pts.y)
				graphics.lineTo(rightWheel.px-pts.x,rightWheel.py-pts.y)
				graphics.moveTo(rightWheel.px-pts.y,rightWheel.py+pts.x)
				graphics.lineTo(rightWheel.px+pts.y,rightWheel.py-pts.x)
			} else if (so.data.skin == 3) {
				//no wheel
			} else if (so.data.skin == 4) {
				graphics.lineStyle(3, 0xFF0000)
				graphics.drawCircle(rightWheel.px, rightWheel.py, rightWheel.radius)
			} else if (so.data.skin == 5) {
				other.getChildAt(1).x = rightWheel.px
				other.getChildAt(1).y = rightWheel.py
			} else if (so.data.skin == 6) {
				other.getChildAt(1).x = rightWheel.px
				other.getChildAt(1).y = rightWheel.py
				other.getChildAt(1).rotation = rightWheel.angle
			} else if (so.data.skin == 7) {
				other.getChildAt(1).x = rightWheel.px
				other.getChildAt(1).y = rightWheel.py
			} else if (so.data.skin == 8) {
				other.getChildAt(1).x = rightWheel.px
				other.getChildAt(1).y = rightWheel.py
				if (_c % flamerate[so.data.quality] == 0) {
					var flame = addChildAt(new g_flame(), 0)
					flame.x = rightWheel.px + Math.random() * 30 - 15
					flame.y = rightWheel.py + Math.random() * 30 - 15
				}
			}
		}
		
		private function drawAxle () {
			if (so.data.skin == 0) {
				patto.graphics.beginFill(0x0080FF)
				patto.graphics.drawRect(-aw/2, -axle.rectHeight/2, aw, axle.rectHeight)
				patto.graphics.endFill()
			} else if (so.data.skin == 1) {
				patto.graphics.beginFill(0xCC9933)
				patto.graphics.drawRect(-aw/2, -axle.rectHeight/2, aw, axle.rectHeight)
				patto.graphics.endFill()
			} else if (so.data.skin == 2) {
				patto.graphics.lineStyle(3, 0x009900)
				pts = Math.sqrt(Math.pow(rightWheel.px - leftWheel.px,2)+Math.pow(rightWheel.py - leftWheel.py,2))
				patto.graphics.moveTo(-(pts/2 - 19.365), 10)
				patto.graphics.lineTo(pts/2 - 19.365, 10)
				patto.graphics.moveTo(-(pts/2 - 19.365), -10)
				patto.graphics.lineTo(pts/2 - 19.365, -10)
			} else if (so.data.skin == 3) {
				patto.graphics.beginGradientFill("linear",[0x996633, 0x664422], [1, 1], [0, 255], (new Matrix()).createGradientBox(40, 120, Math.PI * 1.5))
				patto.graphics.drawRect(-60, -20, 120, 40)
				patto.graphics.endFill()
			} else if (so.data.skin == 4) {
				patto.graphics.lineStyle(3, 0xFF0000)
				patto.graphics.lineGradientStyle("linear", [0xFF0000, 0xFF0000, 0xFF0000], [0, 100, 0], [0, 127, 255], (new Matrix()).createGradientBox(1000, 10))
				patto.graphics.moveTo(-500, 0)
				patto.graphics.lineTo(500, 0)
			} else if (so.data.skin == 5) {
				if (patto.numChildren == 0) {
					patto.addChild(new s_modern_axle())
				}
			} else if (so.data.skin == 6) {
				if (patto.numChildren == 0) {
					patto.addChild(new s_modern_axle())
				}
			} else if (so.data.skin == 7) {
				patto.graphics.beginFill(0x000000)
				patto.graphics.drawRect(-aw/2, -axle.rectHeight/2, aw, axle.rectHeight)
				patto.graphics.endFill()
			} else if (so.data.skin == 8) {
				if (patto.numChildren == 0) {
					patto.addChild(new g_flame_static())
					patto.addChild(new g_flame_static())
					patto.addChild(new g_flame_static())
					patto.addChild(new g_flame_static())
					patto.getChildAt(0).scaleX = patto.getChildAt(0).scaleY = .5
					patto.getChildAt(1).scaleX = patto.getChildAt(1).scaleY = .5
					patto.getChildAt(2).scaleX = patto.getChildAt(2).scaleY = .5
					patto.getChildAt(3).scaleX = patto.getChildAt(3).scaleY = .5
					patto.getChildAt(0).gotoAndPlay(8)
					patto.getChildAt(1).gotoAndPlay(16)
					patto.getChildAt(2).gotoAndPlay(24)
					patto.getChildAt(3).gotoAndPlay(32)
				}
				patto.getChildAt(0).x = -aw / 4
				patto.getChildAt(1).x = -aw / 10
				patto.getChildAt(2).x = aw / 10
				patto.getChildAt(3).x = aw / 4
			}
		}
		
		private function drawPatto () {
			if (so.data.skin == 0) {
				label = new TextField()
				label.embedFonts = true
				label.text = "PATTO"
				label.setTextFormat(new TextFormat("Arial", 20, 0xFF0000, true, false, false, null, null, "center"))
				label.width = 100
				label.x = -50
				label.height = 28
				label.y = -14
				label.selectable = false
				patto.addChild(label)
			} else if (so.data.skin == 1) {
				label = new TextField()
				label.embedFonts = true
				label.text = "PATTO"
				label.setTextFormat(new TextFormat("Arial", 20, 0x886622, true, false, false, null, null, "center"))
				label.width = 100
				label.x = -50
				label.height = 28
				label.y = -14
				label.selectable = false
				patto.addChild(label)
			}
		}
		
		public function addEvent (type, func) {
			leftWheel.addEventListener(type, func)
			rightWheel.addEventListener(type, func)
			axle.scp.addEventListener(type, func)
		}
		
		private function bounce (event:Event) {
			newVel = new Vector(Math.sin(event.p.data.split(",")[0]/180*Math.PI) * event.p.data.split(",")[1], -Math.cos(event.p.data.split(",")[0]/180*Math.PI) * event.p.data.split(",")[1])
			event.s.velocity = event.s.velocity.plus(newVel)
			event.p.fixed = true
		}
		
		public function cleanup () {
			removeEventListener(Event.ENTER_FRAME, drawFrame)
			Global.global.mobile.setForRemoval(car)
			car.setForRemoval(leftWheel)
			car.setForRemoval(rightWheel)
			car.setForRemoval(axle)
			var n:uint = numChildren
			for (var i:uint = 0; i < numChildren; i++) {
				if (getChildAt(0) is g_flame) getChildAt(0).stop()
				removeChildAt(0)
			}
		}
		
		private function boss (event:Event) {
			switch (event.p.data[0]) {
				case "mnm":
					if (event.p.data[2].lose()) {
						parent.death(new CollisionEvent("kill", event.p, leftWheel))
					} else {
						event.p.py = 200
						event.p.px = 100 + RandomSeed.nextFloat() * 1080
					}
					break
				case "megapatto":
					parent.death(new CollisionEvent("kill", event.p, leftWheel))
					break
			}
		}
		
		private function spark (event:Event) {
			if (event.p.data[0].pbar.lose()) {
				parent.death(new CollisionEvent("kill", event.p, leftWheel))
			}
			event.p.data[1]()
		}
	}
}