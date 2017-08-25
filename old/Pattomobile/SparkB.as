package {
	import org.cove.ape.*
	import flash.display.MovieClip
	import flash.events.Event
	import flash.geom.Point
	import DBK.Global
	
	public class SparkB extends MovieClip {
		var p0:CircleParticle
		var spark:MovieClip
		var vel:Vector
		var mnm
		public var track = false
		
		public function SparkB (xpos:Number, ypos:Number, target, mnm) {
			p0 = new CircleParticle(xpos, ypos, 32, true)
			p0.type = "sparkb"
			p0.data = this
			Global.global.fixed.addParticle(p0)
			spark = new g_sparkb()
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
			this.mnm = mnm
			p0.addEventListener("car", car)
			p0.addEventListener("boss", boss)
		}
		
		private function moveSpark (event:Event) {
			if (! Global.global.paused) {
				p0.px += vel.x
				p0.py += vel.y
				spark.x = p0.px
				spark.y = p0.py
				if (spark.y > 1000) cleanup()
				if (track) {
					vel = new Vector(
						Math.sin(Math.atan2(
							mnm.mnm.y - p0.py,
							mnm.mnm.x - p0.px
						)+Math.PI/2)*6,
						-Math.cos(Math.atan2(
							mnm.mnm.y - p0.py,
							mnm.mnm.x - p0.px
						)+Math.PI/2)*6
					)
				}
			}
		}
		
		public function cleanup () {
			if (spark != null) removeChild(spark)
			spark = null
			Global.global.fixed.setForRemoval(p0)
			removeEventListener(Event.ENTER_FRAME, moveSpark)
		}
		
		public function car (event:Event) {
			track = true
		}
		
		public function boss (event:Event) {
			if (track) cleanup()
		}
	}
}