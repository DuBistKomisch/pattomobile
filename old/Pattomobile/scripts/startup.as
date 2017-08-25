var so:SharedObject = SharedObject.getLocal("pattomobile", "/")

fscommand("showmenu", "false")
fscommand("trapallkeys", "true")
stage.showDefaultContextMenu = false
fscommand("fullscreen", checkData("fullscreen", "false"))
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
stage.addEventListener(KeyboardEvent.KEY_DOWN, pressFunction)
function pressFunction (event:KeyboardEvent) {
	if (event.keyCode == checkData("key11", Keyboard.F12)) {
		if (! Global.global.replay && getData("rp_exit")) {
			saveReplay("Exit")
		}
		fscommand("quit")
	} else if (event.keyCode == checkData("key8", 70)) {
		fscommand("fullscreen", setData("fullscreen", getData("fullscreen") == "true" ? "false" : "true"))
	}
}

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