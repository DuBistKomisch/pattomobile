stop()

quit_btn.addEventListener("click", quit) 
credits_btn.addEventListener("click", credits)
menu_btn.addEventListener("click", menu)
options_btn.addEventListener("click", options)
replays_btn.addEventListener("click", replays)

var skins:Array = [{label:"Normal", source:new s_normal()}]
if (getData("level1_4") == "beaten") skins.push({label:"Golden", source:new s_golden()})
if (getData("level2_4") == "beaten") skins.push({label:"Wired", source:new s_wired()})
if (getData("level3_4") == "beaten") skins.push({label:"Block", source:new s_block()})
if (getData("level3_4") == "beaten") skins.push({label:"Laser", source:new s_laser()})
if (getData("level4_4") == "beaten") skins.push({label:"Modern", source:new s_modern()})
if (getData("level5_4") == "beaten") skins.push({label:"Patto", source:new s_patto()})
if (getData("level6_4") == "beaten") {
	skins.push({label:"Dark", source:new s_dark()})
} else {
	if (getData("skin1") || getData("bonus")) skins.push({label:"? ? ?"})
}
if (getData("skin1")) {
	skins.push({label:"Flame", source:new s_flame()})
} else {
	if (getData("bonus")) skins.push({label:"? ? ?"})
}
if (getData("bonus")) skins.push({label:"Invisible"})

skins_pane.dataProvider = new DataProvider(skins)
skins_pane.rowCount = Math.min(skins.length, 5)
skins_pane.columnCount = Math.ceil(skins.length / 5)
skins_pane.width = Math.min(skins.length, 5) * 50
skins_pane.height = Math.ceil(skins.length / 5) * 50
skins_pane.selectedIndex = getData("skin")
skins_pane.addEventListener("change", selectSkin)
function selectSkin (event:Event) {
	if (skins_pane.selectedItem.label == "? ? ?") {
		skins_pane.selectedIndex = getData("skin")
	} else {
		setData("skin", skins_pane.selectedIndex)
		if (getData("skin") == 8 && getData("quality") == 3) setData("quality", 2)
	}
}

var cutscenes:Array = new Array()
if (getData("level1_4") == "beaten") cutscenes.push({label:"1 - 4", source:new cs1_4_fadeout()})
if (getData("level2_3") == "beaten") cutscenes.push({label:"2 - 3", source:new cs2_3_fadein()})
if (getData("level2_4") == "beaten") cutscenes.push({label:"2 - 4", source:new cs2_4_fadein()})
if (getData("level3_4") == "beaten") cutscenes.push({label:"3 - 4", source:new cs3_4_fadein()})
if (getData("level4_4") == "beaten") cutscenes.push({label:"4 - 4", source:new cs4_4_fadein()})
if (getData("level5_3") == "beaten") cutscenes.push({label:"5 - 3", source:new cs5_3_fadein()})
if (getData("level5_4") == "beaten") cutscenes.push({label:"5 - 4", source:new cs5_4_fadein()})
if (getData("level6_3") == "beaten") {
	cutscenes.push({label:"6 - 3", source:new cs6_3_fadein()})
} else {
	if (getData("level6_4") == "beaten" || getData("bonus")) cutscenes.push({label:"? ? ?"})
}
if (getData("level6_4") == "beaten") {
	cutscenes.push({label:"6 - 4", source:new cs6_4_fadein()})
} else {
	if (getData("bonus")) cutscenes.push({label:"? ? ?"})
}
if (getData("bonus")) cutscenes.push({source:new g_hazard_patto_cutscene()})

var cs:MovieClip
cutscene_pane.dataProvider = new DataProvider(cutscenes)
cutscene_pane.rowCount = Math.min(cutscenes.length, 5)
cutscene_pane.columnCount = Math.ceil(cutscenes.length / 5)
cutscene_pane.width = Math.min(cutscenes.length, 5) * 50
cutscene_pane.height = Math.ceil(cutscenes.length / 5) * 50
cutscene_pane.selectedIndex = -1
cutscene_pane.addEventListener("change", playCS)
function playCS (event:Event) {
	if (cutscene_pane.selectedItem.label == "? ? ?") {
		cutscene_pane.selectedIndex = -1
		return
	}
	if (cs == null) {
		switch (cutscene_pane.selectedIndex) {
			case 0:
				cs = new cs1_4()
				addChild(cs)
				cs.addEventListener("stop", endCS)
				break
			case 1:
				cs = new cs2_3()
				addChild(cs)
				cs.addEventListener("stop", endCS)
				break
			case 2:
				cs = new cs2_4()
				addChild(cs)
				cs.addEventListener("stop", endCS)
				break
			case 3:
				cs = new cs3_4()
				addChild(cs)
				cs.addEventListener("stop", endCS)
				break
			case 4:
				cs = new cs4_4()
				addChild(cs)
				cs.addEventListener("stop", endCS)
				break
			case 5:
				cs = new cs5_3()
				addChild(cs)
				cs.addEventListener("stop", endCS)
				break
			case 6:
				cs = new cs5_4()
				addChild(cs)
				cs.addEventListener("stop", endCS)
				break
			case 7:
				cs = new cs6_3()
				addChild(cs)
				cs.addEventListener("stop", endCS)
				break
			case 8:
				cs = new cs6_4()
				addChild(cs)
				cs.addEventListener("stop", endCS)
				break
			case 9:
				cs = new csBONUS()
				addChild(cs)
				cs.addEventListener("stop", endCS)
				break
		}
	}
	cutscene_pane.selectedIndex = -1
}

function endCS (event:Event) {
	removeChild(cs)
	cs = null
}

level7_1.setData("1", checkData("level7_1", false) ? (checkData("bonus1", "unbeaten") == "locked" ? setData("bonus1", "unbeaten") : getData("bonus1")) : checkData("bonus1", "locked"), "bonus1")
level7_2.setData("2", checkData("level7_2", false) ? (checkData("bonus2", "unbeaten") == "locked" ? setData("bonus2", "unbeaten") : getData("bonus2")) : checkData("bonus2", "locked"), "bonus2")
level7_3.setData("3", checkData("level7_3", false) ? (checkData("bonus3", "unbeaten") == "locked" ? setData("bonus3", "unbeaten") : getData("bonus3")) : checkData("bonus3", "locked"), "bonus3")
level7_4.setData("4", checkData("level7_4", false) ? (checkData("bonus4", "unbeaten") == "locked" ? setData("bonus4", "unbeaten") : getData("bonus4")) : checkData("bonus4", "locked"), "bonus4")
level7_5.setData("5", checkData("level7_5", false) ? (checkData("bonus5", "unbeaten") == "locked" ? setData("bonus5", "unbeaten") : getData("bonus5")) : checkData("bonus5", "locked"), "bonus5")
level7_6.setData("6", checkData("level7_6", false) ? (checkData("bonus6", "unbeaten") == "locked" ? setData("bonus6", "unbeaten") : getData("bonus6")) : checkData("bonus6", "locked"), "bonus6")
level7_7.setData("7", checkData("level7_7", false) ? (checkData("bonus7", "unbeaten") == "locked" ? setData("bonus7", "unbeaten") : getData("bonus7")) : checkData("bonus7", "locked"), "bonus7")
level7_8.setData("8", checkData("level7_8", false) ? (checkData("bonus8", "unbeaten") == "locked" ? setData("bonus8", "unbeaten") : getData("bonus8")) : checkData("bonus8", "locked"), "bonus8")
level7_9.setData("9", checkData("level7_9", false) ? (checkData("bonus9", "unbeaten") == "locked" ? setData("bonus9", "unbeaten") : getData("bonus9")) : checkData("bonus9", "locked"), "bonus9")