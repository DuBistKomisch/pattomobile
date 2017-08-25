stop()

quit_btn.addEventListener("click", quit)
extras_btn.addEventListener("click", extras)
credits_btn.addEventListener("click", credits)
menu_btn.addEventListener("click", menu)
reset_btn.addEventListener("click", reset)
replays_btn.addEventListener("click", replays)

var char:Array = new Array()
char[8] = "BACKSPACE"
char[9] = "TAB"
char[13] = "ENTER"
char[16] = "SHIFT"
char[17] = "CONTROL"
char[19] = "PAUSE"
char[20] = "CAPS LOCK"
char[27] = "ESCAPE"
char[32] = "SPACE"
char[33] = "PAGE UP"
char[34] = "PAGE DOWN"
char[35] = "END"
char[36] = "HOME"
char[37] = "LEFT"
char[38] = "UP"
char[39] = "RIGHT"
char[40] = "DOWN"
char[45] = "INSERT"
char[46] = "DELETE"
char[112] = "F1"
char[113] = "F2"
char[114] = "F3"
char[115] = "F4"
char[116] = "F5"
char[117] = "F6"
char[118] = "F7"
char[119] = "F8"
char[120] = "F9"
char[121] = "F10"
char[122] = "F11"
char[123] = "F12"
char[186] = "; :"
char[187] = "= +"
char[188] = ", <"
char[189] = "- _"
char[190] = ". >"
char[191] = "/ ?"
char[192] = "` ~"
char[219] = "[ {"
char[220] = "\\ |"
char[221] = "] }"
char[222] = "' \""

function getChar (code:uint) {
	if (char[code] == null) {
		return String.fromCharCode(code)
	} else {
		return char[code]
	}
}

key1.text = getChar(checkData("key1", Keyboard.LEFT)) //37
key2.text = getChar(checkData("key2", Keyboard.RIGHT)) //39
key3.text = getChar(checkData("key3", Keyboard.UP)) //38
key4.text = getChar(checkData("key4", Keyboard.DOWN)) //40
key5.text = getChar(checkData("key5", 82)) //R
key6.text = getChar(checkData("key6", Keyboard.ESCAPE)) //27
key7.text = getChar(checkData("key7", Keyboard.TAB)) //9
key8.text = getChar(checkData("key8", 70)) //F
key9.text = getChar(checkData("key9", 19)) //PAUSE
key10.text = getChar(checkData("key10", Keyboard.SPACE)) //32
key11.text = getChar(checkData("key11", Keyboard.F12)) //123

key1.addEventListener(KeyboardEvent.KEY_DOWN, textInput)
key2.addEventListener(KeyboardEvent.KEY_DOWN, textInput)
key3.addEventListener(KeyboardEvent.KEY_DOWN, textInput)
key4.addEventListener(KeyboardEvent.KEY_DOWN, textInput)
key5.addEventListener(KeyboardEvent.KEY_DOWN, textInput)
key6.addEventListener(KeyboardEvent.KEY_DOWN, textInput)
key7.addEventListener(KeyboardEvent.KEY_DOWN, textInput)
key8.addEventListener(KeyboardEvent.KEY_DOWN, textInput)
key9.addEventListener(KeyboardEvent.KEY_DOWN, textInput)
key10.addEventListener(KeyboardEvent.KEY_DOWN, textInput)
key11.addEventListener(KeyboardEvent.KEY_DOWN, textInput)

function textInput (event:KeyboardEvent) {
	setData(event.target.parent.name, event.keyCode)
	event.target.text = getChar(event.keyCode)
}

if (getData("level3_4") == "beaten") speed.maximum ++
if (getData("level4_4") == "beaten") speed.maximum ++
if (getData("level5_3") == "beaten") speed.maximum ++
if (getData("level6_4") == "beaten") speed.maximum ++
speed.enabled = speed.maximum > speed.minimum
speed.value = checkData("speed", 3)
speed.addEventListener("change", changeSpeed)
function changeSpeed (event:Event) {
	setData("speed", speed.value)
	if (getData("skin") == 8 && getData("speed") == 3) {
		if (quality.value == 3) {
			quality.value == 2
			setData("quality", 2)
			quality_txt.text = ["LOW","MEDIUM","HIGH","BEST"][getData("quality")]
			stage.quality = ["LOW","MEDIUM","HIGH","BEST"][getData("quality")]
		}
		quality.maximum = 2
	} else {
		quality.maximum = 3
	}
}

quality.value = getData("quality")
if (getData("skin") == 8 && getData("speed") == 3) {
	if (quality.value == 3) {
		quality.value == 2
		setData("quality", 2)
		quality_txt.text = ["LOW","MEDIUM","HIGH","BEST"][getData("quality")]
		stage.quality = ["LOW","MEDIUM","HIGH","BEST"][getData("quality")]
	}
	quality.maximum = 2
} else {
	quality.maximum = 3
}
quality_txt.text = ["LOW","MEDIUM","HIGH","BEST"][getData("quality")]
quality.addEventListener("change", changeQuality)
function changeQuality (event:Event) {
	setData("quality", quality.value)
	quality_txt.text = ["LOW","MEDIUM","HIGH","BEST"][getData("quality")]
	stage.quality = ["LOW","MEDIUM","HIGH","BEST"][getData("quality")]
}

vol_sound.value = getData("vol_sound")*100
vol_sound.addEventListener("change", changeSoundVolume)
function changeSoundVolume (event:Event) {
	setData("vol_sound", vol_sound.value/100)
}

vol_music.value = getData("vol_music")*100
vol_music.addEventListener("change", changeMusicVolume)
function changeMusicVolume (event:Event) {
	setData("vol_music", vol_music.value/100)
}

rp_death.selected = getData("rp_death")
rp_win.selected = getData("rp_win")
rp_reset.selected = getData("rp_reset")
rp_exit.selected = getData("rp_exit")
en_music.selected = getData("en_music")
en_panning.selected = getData("en_panning")
en_sound.selected = getData("en_sound")
en_stereo.selected = getData("en_stereo")

rp_death.addEventListener("change", clickCheck)
rp_win.addEventListener("change", clickCheck)
rp_reset.addEventListener("change", clickCheck)
rp_exit.addEventListener("change", clickCheck)
en_music.addEventListener("change", clickCheck)
en_panning.addEventListener("change", clickCheck)
en_sound.addEventListener("change", clickCheck)
en_stereo.addEventListener("change", clickCheck)

function clickCheck (event:Event) {
	setData(event.target.name, event.target.selected)
	if (event.target.name == "en_music") {
		vol_music.enabled = event.target.selected
	} else if (event.target.name == "en_sound") {
		vol_sound.enabled = event.target.selected
	} else if (event.target.name == "en_stereo") {
		en_panning.enabled = event.target.selected
	}
}