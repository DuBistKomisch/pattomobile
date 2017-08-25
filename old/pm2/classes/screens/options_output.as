/**
 *  filename: screens/options_output.as
 *  author: Jake Barnes
 *  modified: 3-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import events.QualityEvent;
	import flash.display.Bitmap
	import flash.display.BitmapData
	import flash.display.Sprite
	import flash.events.Event
	import flash.events.MouseEvent
	import flash.text.TextField
	import flash.utils.getTimer
	import fl.events.SliderEvent
	import fl.controls.Button
	import fl.controls.CheckBox
	import fl.controls.Slider
	
	public class options_output extends Screen {
		//graphics quality
		private var quality_sld:Slider = new Slider()
		private var prev_mc:Sprite = new Sprite()
		private var prev_data:BitmapData
		private var prev_bmp1:Bitmap
		private var prev_bmp2:Bitmap
		private var prev_sparkles:Sprite = new Sprite()
		private var sparkles:Array = new Array()
		private const SPARKLE_FALL_DIST:uint = 50
		//animation settings
		private var cbrs:Array = ["titles", "mbs", "screens"]
		private var titles_cb:CheckBox = new CheckBox()
		private var mbs_cb:CheckBox = new CheckBox()
		private var screens_cb:CheckBox = new CheckBox()
		//audio settings
		private var bgm_sld:Slider = new Slider()
		private var sfx_sld:Slider = new Slider()
		private var cbs:Array = ["bgm", "sfx", "stereo", "pan"]
		private var bgm_cb:CheckBox = new CheckBox()
		private var sfx_cb:CheckBox = new CheckBox()
		private var stereo_cb:CheckBox = new CheckBox()
		private var pan_cb:CheckBox = new CheckBox()
		
		public function options_output () {
			submenu = "Options"
			title = "Output"
			initTitle()
			
			menu_btn.addEventListener(MouseEvent.CLICK, back)
			reset_btn.addEventListener(MouseEvent.CLICK, resetAll)
			
			//create quality slider
			quality_sld.x = 250
			quality_sld.y = 55
			quality_sld.maximum = 3
			quality_sld.snapInterval = quality_sld.tickInterval = 1
			quality_sld.liveDragging = true
			quality_sld.value = Global.getData("quality")
			quality_sld.addEventListener(SliderEvent.CHANGE, dragQuality)
			Global.events.addEventListener(QualityEvent.UPDATE, globalQuality)
			quality_sld.tabIndex = 1
			addChild(quality_sld)
			updateQuality()
			
			//create quality preview
			addChild(prev_sparkles)
			prev_mc.graphics.lineStyle(3, 0xFFFF00)
			prev_mc.graphics.beginFill(0x0000FF)
			prev_mc.graphics.drawCircle(8, 8, 5)
			prev_mc.graphics.endFill()
			prev_data = new BitmapData(16, 16, true, 0x00000000)
			prev_data.draw(prev_mc)
			prev_bmp1 = new Bitmap(prev_data)
			prev_bmp1.x = 520
			prev_bmp1.y = 80
			prev_bmp1.scaleX = prev_bmp1.scaleY = 3
			BitmapManager.addBitmap(addChild(prev_bmp1))
			prev_bmp2 = new Bitmap(prev_data)
			prev_bmp2.x = 560
			prev_bmp2.y = 130
			prev_bmp2.scaleX = prev_bmp2.scaleY = 2
			BitmapManager.addBitmap(addChild(prev_bmp2), false)
			addEventListener(Event.ENTER_FRAME, drawFrame)
			
			for (i = cbrs.length; i > 0; i--) {
				cb = this[cbrs[i-1]+"_cb"]
				cb.x = 255
				cb.y = 178 + (i-1) * 20
				cb.label = ""
				cb.selected = Global.getData("animate_"+cbrs[i-1])
				cb.addEventListener(Event.CHANGE, animateCheck)
				cb.name = cbrs[i-1]
				cb.tabIndex = i + 1
				addChild(cb)
			}
			
			//create background music volume slider
			bgm_sld.x = 270
			bgm_sld.y = 285
			bgm_sld.maximum = 100
			bgm_sld.snapInterval = 1
			bgm_sld.tickInterval = 10
			bgm_sld.liveDragging = true
			bgm_txt.text = bgm_sld.value = Global.getData("volume_bgm") * 100
			bgm_sld.addEventListener(SliderEvent.CHANGE, dragBGM)
			bgm_sld.tabIndex = cbrs.length + 2
			addChild(bgm_sld)
			
			//create sound effects volume slider
			sfx_sld.x = 270
			sfx_sld.y = 305
			sfx_sld.maximum = 100
			sfx_sld.snapInterval = 1
			sfx_sld.tickInterval = 10
			sfx_sld.liveDragging = true
			sfx_txt.text = sfx_sld.value = Global.getData("volume_sfx") * 100
			sfx_sld.addEventListener(SliderEvent.CHANGE, dragSFX)
			sfx_sld.tabIndex = cbrs.length + 3
			addChild(sfx_sld)
			
			//create checkboxs
			for (var i:uint = cbs.length; i > 0; i--) {
				var cb:CheckBox = this[cbs[i-1]+"_cb"]
				cb.x = 215
				cb.y = 328 + (i-1) * 20
				cb.label = ""
				cb.selected = Global.getData("en_"+cbs[i-1])
				cb.addEventListener(Event.CHANGE, changeCheck)
				cb.name = cbs[i-1]
				cb.tabIndex = i + cbrs.length + 3
				addChild(cb)
			}
		}
		
		private function drawFrame (event:Event) {
			prev_bmp2.x = 540 + Math.sin(getTimer() / 1000) * 40
			for (var i:uint = 0; i < Global.getData("quality"); i++) {
				var sparkle:Sprite = new Sprite()
				sparkle.graphics.beginFill(RandomSeed.nextColour())
				sparkle.graphics.drawCircle(0,0,2)
				sparkle.graphics.endFill()
				sparkle.x = prev_bmp2.x + RandomSeed.nextFloatRange(4, prev_bmp2.width - 4)
				sparkle.y = prev_bmp2.y + prev_bmp2.height/2
				prev_sparkles.addChild(sparkle)
				sparkles.push(sparkle)
			}
			i = sparkles.length
			while (i--) {
				sparkles[i].y += sparkles[i].alpha * 2
				sparkles[i].alpha = (prev_bmp2.y + prev_bmp2.height/2 + SPARKLE_FALL_DIST - sparkles[i].y) / SPARKLE_FALL_DIST
				if (sparkles[i].alpha < 0.025) {
					prev_sparkles.removeChild(sparkles[i])
					sparkles.splice(i, 1)
				}
			}
		}
		
		private function dragQuality (event:SliderEvent) {
			Global.functions.setQuality(quality_sld.value)
		}
		
		private function globalQuality (event:QualityEvent) {
			quality_sld.value = event.quality;
			updateQuality()
		}
		
		private function updateQuality () {
			quality_txt.text = Util.getQualityString()
			va_txt.text = ["1x1","2x2","4x4","4x4"][quality_sld.value]
			bs_txt.text = ["Never","Static","Static","Always"][quality_sld.value]
			se_txt.text = ["Off","Some","All","Extra"][quality_sld.value]
		}
		
		private function animateCheck (event:Event) {
			Global.setData("animate_"+event.target.name, event.target.selected)
		}
		
		private function dragBGM (event:SliderEvent) {
			Global.setData("volume_bgm", bgm_sld.value / 100)
			bgm_txt.text = bgm_sld.value
			MusicManager.updateVolume()
		}
		
		private function dragSFX (event:SliderEvent) {
			Global.setData("volume_sfx", sfx_sld.value / 100)
			sfx_txt.text = bgm_sfx.value
			MusicManager.updateVolume()
		}
		
		private function changeCheck (event:Event) {
			Global.setData("en_"+event.target.name, event.target.selected)
			MusicManager.updateVolume()
		}
		
		private function resetAll (event:MouseEvent) {
			Global.functions.setQuality(2)
			titles_cb.selected = Global.setData("animate_titles", true)
			mbs_cb.selected = Global.setData("animate_mbs", true)
			screens_cb.selected = Global.setData("animate_screens", true)
			bgm_txt.text = bgm_sld.value = Global.setData("volume_bgm", 0.8) * 100
			sfx_txt.text = sfx_sld.value = Global.setData("volume_sfx", 1) * 100
			bgm_cb.selected = Global.setData("en_bgm", true)
			sfx_cb.selected = Global.setData("en_sfx", true)
			stereo_cb.selected = Global.setData("en_stereo", true)
			pan_cb.selected = Global.setData("en_pan", true)
			MusicManager.updateVolume()
		}
		
		public override function fadeout () {
			//remove event listeners
			menu_btn.removeEventListener(MouseEvent.CLICK, back)
			reset_btn.removeEventListener(MouseEvent.CLICK, resetAll)
			quality_sld.addEventListener(SliderEvent.CHANGE, dragQuality)
			for (var i:uint = 0; i < cbrs.length; i++) this[cbrs[i]+"_cb"].removeEventListener(Event.CHANGE, animateCheck)
			bgm_sld.addEventListener(SliderEvent.CHANGE, dragBGM)
			sfx_sld.addEventListener(SliderEvent.CHANGE, dragSFX)
			for (i = 0; i < cbs.length; i++) this[cbs[i]+"_cb"].removeEventListener(Event.CHANGE, changeCheck)
			Global.events.removeEventListener(QualityEvent.UPDATE, globalQuality)
			removeEventListener(Event.ENTER_FRAME, drawFrame)
			//deregister bitmaps
			BitmapManager.removeBitmap(prev_bmp1)
			BitmapManager.removeBitmap(prev_bmp2)
			//nullify remaining objects
			prev_mc = null
		}
		
		public override function unload () {
			//remove sparkles
			while (sparkles.length) {
				prev_sparkles.removeChild(sparkles[0])
				sparkles.splice(0, 1)
			}
			//remove display objects
			removeChild(quality_sld)
			removeChild(bgm_sld)
			removeChild(sfx_sld)
			removeChild(prev_bmp1)
			removeChild(prev_bmp2)
			removeChild(prev_sparkles)
			for (var i:uint = 0; i < cbrs.length; i++) removeChild(this[cbrs[i]+"_cb"])
			for (i = 0; i < cbs.length; i++) removeChild(this[cbs[i]+"_cb"])
			//nullify remaining objects
			quality_sld = bgm_sld = sfx_sld = null
			bgm_cb = sfx_cb = stereo_cb = pan_cb = titles_cb = mbs_cb = screens_cb = null
			prev_data = null
			prev_bmp1 = prev_bmp2 = null
			prev_sprite = null
			sparkles = null
			// super
			super.unload();
		}
	}
}