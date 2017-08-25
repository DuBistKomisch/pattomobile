/*
Copyright (c) 2006, 2007 Alec Cove

Permission is hereby granted, free of charge, to any person obtaining a copy of this 
software and associated documentation files (the "Software"), to deal in the Software 
without restriction, including without limitation the rights to use, copy, modify, 
merge, publish, distribute, sublicense, and/or sell copies of the Software, and to 
permit persons to whom the Software is furnished to do so, subject to the following 
conditions:

The above copyright notice and this permission notice shall be included in all copies 
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package org.cove.ape {
	
	import flash.display.Sprite;
	
	/**	
	 * An inverse quarter-circle shaped particle. 	 
	 */
	public class ConcaveParticle extends CircleParticle {

		private var _rotation:Number;
		private var _extents:Array;
		private var _axes:Array;
		
		/**
		 * @param x The initial x position of this particle.
		 * @param y The initial y position of this particle.
		 * @param radius The radius of this particle.
		 * @param rotation The rotation of this particle.
		 * @param fixed Determines if the particle is fixed or not. Fixed particles
		 * are not affected by forces or collisions and are good to use as surfaces.
		 * Non-fixed particles move freely in response to collision and forces.
		 * @param mass The mass of the particle.
		 * @param elasticity The elasticity of the particle. Higher values mean more elasticity or 'bounciness'.
		 * @param friction The surface friction of the particle.
		 */
		public function CircleParticle (
				x:Number, 
				y:Number, 
				radius:Number, 
				fixed:Boolean = false,
				mass:Number = 1, 
				elasticity:Number = 0.3,
				friction:Number = 0) {
					
			super(x, y, radius, fixed, mass, elasticity, friction);
			radian = rotation;
		}

		public function get radian():Number {
			return _rotation;
		}
		
		
		/**
		 * @private
		 */		
		public function set radian(t:Number):void {
			_rotation = t;
			setAxes(t);
		}
			
		
		/**
		 * The rotation of the RectangleParticle in degrees. 
		 */
		public function get angle():Number {
			return radian * MathUtil.ONE_EIGHTY_OVER_PI;
		}


		/**
		 * @private
		 */		
		public function set angle(a:Number):void {
			radian = a * MathUtil.PI_OVER_ONE_EIGHTY;
		}
		
		
		/**
		 * Sets up the visual representation of this ConcaveParticle. This method is called 
		 * automatically when an instance of this ConcaveParticle's parent Group is added to 
		 * the APEngine, when  this ConcaveParticle's Composite is added to a Group, or the 
		 * ConcaveParticle is added to a Composite or Group.
		 */		
		public override function init():void {
			cleanup();
			if (displayObject != null) {
				initDisplay();
			} else {
				sprite.graphics.clear();
				sprite.graphics.lineStyle(lineThickness, lineColor, lineAlpha);
				sprite.graphics.beginFill(fillColor, fillAlpha);
				sprite.graphics.drawCircle(0, 0, radius);
				sprite.graphics.endFill();
			}
			paint();
		}
		
		/**
		 * @private
		 */	
		internal function get axes():Array {
			return _axes;
		}
		

		/**
		 * @private
		 */	
		internal function get extents():Array {
			return _extents;
		}
		
		internal function getProjection(axis:Vector):Interval {
			
			var radius:Number =
			    extents[0] * Math.abs(axis.dot(axes[0]))+
			    extents[1] * Math.abs(axis.dot(axes[1]));
			
			var c:Number = samp.dot(axis);
			
			interval.min = c - radius;
			interval.max = c + radius;
			return interval;
		}
		
		private function setAxes(t:Number):void {
			var s:Number = Math.sin(t);
			var c:Number = Math.cos(t);
			
			axes[0].x = c;
			axes[0].y = s;
			axes[1].x = -s;
			axes[1].y = c;
		}
	}
}
	
	