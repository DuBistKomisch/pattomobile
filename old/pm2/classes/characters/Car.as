/**
 *  filename: Car.as
 *  author: Jake Barnes
 *  modified: 7-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package characters {
	import org.cove.ape.*
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Car extends Sprite implements IGameCharacter {
		public var car:Composite;
		public var leftWheel:WheelParticle;
		public var rightWheel:WheelParticle;
		public var axle:SpringConstraint;
		
		public var patto:Sprite;
		public var label:TextField;
		
		public var input:Array;
		public var control:Boolean = false;
		
		public var accel:Number = 0.05;
		public var limit:Number = 0.6;
		public var speed:Number = 0;
		
		public function Car (init:XML) {
			leftWheel = new WheelParticle(Number(init.x) - 40, init.y, 20, false);
			rightWheel = new WheelParticle(Number(init.x) + 40, init.y, 20, false);
			axle = new SpringConstraint(rightWheel, leftWheel, 0.5, true, 20, 0.9, true);
			leftWheel.mass = rightWheel.mass = 2;
			leftWheel.type = rightWheel.type = axle.scp.type = "car";
			leftWheel.gameObject = rightWheel.gameObject = axle.scp.gameObject = this;
			
			car = new Composite();
			car.addParticle(leftWheel);
			car.addParticle(rightWheel);
			car.addConstraint(axle);
			Global.groups.mobile.addComposite(car);
			
			graphics.clear();
			drawLeft();
			drawRight();
			
			addChild(patto = new Sprite());
			patto.graphics.clear();
			drawAxle();
			drawPatto();
			
			patto.x = init.x;
			patto.y = init.y;
		}
		
		public function step ():void {
			if (control) {
				if (Global.global.controls[0] && !Global.global.controls[1]) { // left
					leftWheel.angularVelocity = rightWheel.angularVelocity = speed = Math.max(-limit, speed - accel);
				} else if (Global.global.controls[1] && !Global.global.controls[0]) { // right
					leftWheel.angularVelocity = rightWheel.angularVelocity = speed = Math.min(limit, speed + accel);
				} else {
					leftWheel.angularVelocity = rightWheel.angularVelocity = speed = 0;
				}
			} else {
				leftWheel.angularVelocity = rightWheel.angularVelocity = speed = 0;
			}
		}
		
		public function redraw ():void {
			graphics.clear();
			drawLeft();
			drawRight();
			
			patto.graphics.clear();
			drawAxle();
			
			patto.x = (rightWheel.px + leftWheel.px) / 2;
			patto.y = (rightWheel.py + leftWheel.py) / 2;
			patto.rotation = axle.scp.angle;
		}
		
		private function drawLeft () {
			graphics.beginFill(0xFF0000);
			graphics.drawEllipse(leftWheel.px - leftWheel.radius, leftWheel.py - leftWheel.radius, leftWheel.radius * 2, leftWheel.radius * 2);
			graphics.endFill();
		}
		
		private function drawRight () {
			graphics.beginFill(0xFF0000);
			graphics.drawEllipse(rightWheel.px - rightWheel.radius, rightWheel.py - rightWheel.radius, rightWheel.radius * 2, leftWheel.radius * 2);
			graphics.endFill();
		}
		
		private function drawAxle () {
			var aw = axle.rectScale*Math.sqrt(Math.pow(rightWheel.px - leftWheel.px,2)+Math.pow(rightWheel.py - leftWheel.py,2));
			patto.graphics.beginFill(0x0080FF);
			patto.graphics.drawRect(-aw/2, -axle.rectHeight/2, aw, axle.rectHeight);
			patto.graphics.endFill();
		}
		
		private function drawPatto () {
			label = new TextField();
			label.embedFonts = true;
			label.text = "PATTO";
			label.setTextFormat(new TextFormat("Arial", 20, 0xFF0000, true, false, false, null, null, "center"));
			label.width = 100;
			label.x = -50;
			label.height = 28;
			label.y = -14;
			label.selectable = false;
			patto.addChild(label);
		}
		
		public function collide (mine:AbstractParticle, other:AbstractParticle):void {
			
		}
		
		public function cleanup ():void {
			Global.groups.mobile.removeComposite(car);
			car.removeParticle(leftWheel);
			car.removeParticle(rightWheel);
			car.removeConstraint(axle);
			leftWheel = rightWheel = null;
			axle = null;
			car = null;
			// remove display objects
			patto.removeChild(label);
			label = null;
			removeChild(patto);
			patto = null;
			// other
			input = null;
		}
		
		public function get layer ():String {
			return "middle";
		}
		
		public function get needsRedraw ():Boolean {
			return true;
		}
		
		public function get scroll ():Point {
			return new Point(patto.x, patto.y);
		}
	}
}