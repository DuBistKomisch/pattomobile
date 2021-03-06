﻿package {
	import org.cove.ape.*
	import flash.display.MovieClip
	import flash.events.Event
	import flash.geom.Point
	import DBK.Global
	
	public class Spark extends MovieClip {
		var p0:CircleParticle
		var spark:MovieClip
		var vel:Vector
		
		public function Spark (xpos:Number, ypos:Number, target, mnm) {
			p0 = new CircleParticle(xpos, ypos, 32, true)
			p0.type = "spark"
			p0.data = [mnm, cleanup]
			Global.global.fixed.addParticle(p0)
			spark = new g_spark()
			spark.x = xpos
			spark.y = ypos
			addChild(spark)
			addEventListener(Event.ENTER_FRAME, moveSpark)
			vel = new Vector(
				Math.sin(Math.atan2(
					target.y - p0.py,
					target.x - p0.px
				)+Math.PI/2)*2,
				-Math.cos(Math.atan2(
					target.y - p0.py,
					target.x - p0.px
				)+Math.PI/2)*2
			)
		}
		
		private function moveSpark (event:Event) {
			if (! Global.global.paused) {
				p0.px += vel.x
				p0.py += vel.y
				spark.x = p0.px
				spark.y = p0.py
				if (spark.y > 1000) cleanup()
			}
		}
		
		public function cleanup () {
			if (spark != null) removeChild(spark)
			spark = null
			Global.global.fixed.setForRemoval(p0)
			removeEventListener(Event.ENTER_FRAME, moveSpark)
		}
	}
}