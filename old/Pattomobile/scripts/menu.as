stop()

import DBK.KeyDown

var data = ""

checkData("skin", 0)

level1_1.setData("1", checkData("level1_1", "unbeaten"), "level1_1")
level1_2.setData("2", checkData("level1_2", "locked"), "level1_2")
level1_3.setData("3", checkData("level1_3", "locked"), "level1_3")
level1_4.setData("4", checkData("level1_4", "locked"), "level1_4")

level2_1.setData("1", checkData("level2_1", "locked"), "level2_1")
level2_2.setData("2", checkData("level2_2", "locked"), "level2_2")
level2_3.setData("3", checkData("level2_3", "locked"), "level2_3")
level2_4.setData("4", checkData("level2_4", "locked"), "level2_4")

level3_1.setData("1", checkData("level3_1", "locked"), "level3_1")
level3_2.setData("2", checkData("level3_2", "locked"), "level3_2")
level3_3.setData("3", checkData("level3_3", "locked"), "level3_3")
level3_4.setData("4", checkData("level3_4", "locked"), "level3_4")

level4_1.setData("1", checkData("level4_1", "locked"), "level4_1")
level4_2.setData("2", checkData("level4_2", "locked"), "level4_2")
level4_3.setData("3", checkData("level4_3", "locked"), "level4_3")
level4_4.setData("4", checkData("level4_4", "locked"), "level4_4")

level5_1.setData("1", checkData("level5_1", "locked"), "level5_1")
level5_2.setData("2", checkData("level5_2", "locked"), "level5_2")
level5_3.setData("3", checkData("level5_3", "locked"), "level5_3")
level5_4.setData("4", checkData("level5_4", "locked"), "level5_4")

level6_1.setData("1", checkData("level6_1", "locked"), "level6_1")
level6_2.setData("2", checkData("level6_2", "locked"), "level6_2")
level6_3.setData("3", checkData("level6_3", "locked"), "level6_3")
level6_4.setData("4", checkData("level6_4", "locked"), "level6_4")

world1_txt.text = "The Escape"
world2_txt.text = getData("level1_4") == "beaten" ? "Find Patto" : "Locked"
world3_txt.text = getData("level2_4") == "beaten" ? "The Chaffeur" : "Locked"
world4_txt.text = getData("level3_4") == "beaten" ? "Déjà Vu?\u263a" : "Locked"
world5_txt.text = getData("level4_4") == "beaten" ? "The Rescue" : "Locked"
world6_txt.text = getData("level5_4") == "beaten" ? "Kill Patto" : "Locked"

world1_txt.alpha = 1
world2_txt.alpha = getData("level1_4") == "beaten" ? 1 : 0.5
world3_txt.alpha = getData("level2_4") == "beaten" ? 1 : 0.5
world4_txt.alpha = getData("level3_4") == "beaten" ? 1 : 0.5
world5_txt.alpha = getData("level4_4") == "beaten" ? 1 : 0.5
world6_txt.alpha = getData("level5_4") == "beaten" ? 1 : 0.5

function alert (h, m, crash = false) {
	addChild(new AlertWindow(h, m, 320, 240, crash))
}

Global.global.key = new KeyDown(this)

function fullscreen (event:Event) {
	fscommand("fullscreen", setData("fullscreen", getData("fullscreen") == "true" ? "false" : "true"))
}

quit_btn.addEventListener("click", quit) 
function quit (event:Event) {
	fscommand("quit")
}

extras_btn.addEventListener("click", extras) 
function extras (event:Event) {
	gotoAndStop("extras")
}

credits_btn.addEventListener("click", credits)
function credits (event:Event) {
	gotoAndStop("credits")
}

function menu (event:Event) {
	gotoAndStop("menu")
}

function reset (event:Event) {
	gotoAndStop("reset")
}

replays_btn.addEventListener("click", replays)
function replays (event:Event) {
	gotoAndStop("replays")
}

options_btn.addEventListener("click", options)
function options (event:Event) {
	gotoAndStop("options")
}