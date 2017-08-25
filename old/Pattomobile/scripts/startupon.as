var so:SharedObject = SharedObject.getLocal("pattomobile", "/")

stage.showDefaultContextMenu = false
stage.quality = ["LOW","MEDIUM","HIGH","BEST"][checkData("quality", 2)]

function checkData (name, def) {
	if (so.data[name] == undefined) {
		so.data[name] = def
	}
	return so.data[name]
}

function setData (name, value) {
	so.data[name] = value
	return so.data[name]
}

function getData (name) {
	return so.data[name]
}

checkData("replay", new Array())
checkData("replay2", new Array())

if (checkData("key10", Keyboard.SPACE) == Keyboard.F5) {
	setData("key10", Keyboard.SPACE)
}
checkData("rp_death", false)
checkData("rp_win", true)
checkData("rp_reset", false)
checkData("rp_exit", false)
checkData("en_music", true)
checkData("en_panning", true)
checkData("en_sound", true)
checkData("en_stereo", true)
checkData("vol_music", .8)
checkData("vol_sound", 1)

Global.global.showBananaMaker = function () {
	if (! contains(Global.global.bananaMaker)) addChildAt(Global.global.bananaMaker, 0)
}

Global.global.hideBananaMaker = function () {
	if (contains(Global.global.bananaMaker)) removeChild(Global.global.bananaMaker)
}

if (checkData("bonus", false)) {
	Global.global.bananaMaker = new BananaMaker()
	Global.global.showBananaMaker()
} else {
	Global.global.bananaMaker = new Sprite()
}

addEventListener(Event.ENTER_FRAME, updateBar)
function updateBar (event:Event) {
	var percent = parent.loaderInfo.bytesLoaded / parent.loaderInfo.bytesTotal
	percent_txt.text = Math.floor(percent * 100) + " %"
	bar.scaleX = percent
	if (percent == 1) {
		removeEventListener(Event.ENTER_FRAME, updateBar)
		removeChild(fill)
		removeChild(bar)
		removeChild(percent_txt)
		removeChild(tank)
		play()
	}
}

stop()