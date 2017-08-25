stop()

quit_btn.addEventListener("click", quit)
extras_btn.addEventListener("click", extras)
credits_btn.addEventListener("click", credits)
menu_btn.addEventListener("click", menu)
options_btn.addEventListener("click", options)

if (checkData("fixReplays", true)) {
	if (so.data.replay.length > 0) {
		alert("Updating Replays...", "Your replay data has been converted to a new format for Pattomobile v1.1, it is:\n> ~10x smaller file size\n> ~7x faster load time\n> More efficient")
		reformatReplays()
		resizeReplays()
	}
	setData("fixReplays", false)
}

rp_grid.dataProvider = new DataProvider(so.data.replay2)
rp_grid.columns = ["Level", "Result", "Time", "Seed", "Size"]
rp_grid.getColumnAt(0).width = 230
rp_grid.getColumnAt(1).width = 60
rp_grid.getColumnAt(2).width = 170
rp_grid.getColumnAt(2).sortCompareFunction = sortByTime
rp_grid.getColumnAt(3).width = 80
rp_grid.getColumnAt(3).sortOptions = Array.NUMERIC
rp_grid.getColumnAt(4).width = 60
rp_grid.getColumnAt(4).sortCompareFunction = sortBySize

rp_grid.addEventListener(MouseEvent.DOUBLE_CLICK, playReplay)
play_btn.addEventListener(MouseEvent.CLICK, playReplay)
function playReplay(event:Event) {
	data = rp_grid.selectedItem.level
	Global.global.replay = true
	Global.global.rpd = rp_grid.selectedItem.data
	gotoAndStop("game")
}

rp_grid.addEventListener(KeyboardEvent.KEY_DOWN, keyReplay)
function keyReplay (event:Event) {
	if (event.keyCode == Keyboard.ENTER) {
		playReplay(event)
	} else if (event.keyCode == Keyboard.DELETE) {
		var old = rp_grid.selectedIndex
		so.data.replay2.splice(so.data.replay2.indexOf(rp_grid.selectedItem), 1)
		rp_grid.dataProvider.removeItem(rp_grid.selectedItem)
		rp_grid.selectedIndex = old
		if (so.size / 1024 > 1024) {
			size_txt.text = Math.ceil(so.size / 1024 / 10.24) / 100 + " mb"
		} else {
			size_txt.text = Math.ceil(so.size / 102.4) / 10 + " kb"
		}
	}
}

if (so.size / 1024 > 1024) {
	size_txt.text = Math.ceil(so.size / 1024 / 10.24) / 100 + " mb"
} else {
	size_txt.text = Math.ceil(so.size / 102.4) / 10 + " kb"
}

function reformatReplays () {
	var f,rp,newData,frames
	for (var i:uint = 0; i < so.data.replay.length; i++) {
		rp = so.data.replay[i]
		if (rp.data.indexOf("|") != -1) {
			newData = rp.Seed + ":"
			frames = rp.data.substr(rp.data.indexOf(":") + 1).split("|")
			for (var j:uint = 0; j < frames.length; j++) {
				f = [int(frames[j].charAt(0)), int(frames[j].charAt(1)), int(frames[j].charAt(2)), int(frames[j].charAt(3)), int(frames[j].charAt(4)), int(frames[j].charAt(5))]
				newData += String.fromCharCode(f[0] + f[1] * 2 + f[2] * 4 + f[3] * 8 + f[4] * 16 + f[5] * 32)
			}
			rp.data = newData
		}
	}
}

function resizeReplays () {
	for (var i:uint = 0; i < so.data.replay.length; i++) {
		so.data.replay[i].Size = Math.ceil(so.data.replay[i].data.length / 102.4) / 10 + " kb"
	}
}

function sortBySize (A, B) {
	if (parseFloat(A.Size) > parseFloat(B.Size)) {
		return 1
	} else if (parseFloat(A.Size) < parseFloat(B.Size)) {
		return -1
	} else {
		return 0
	}
}

function sortByTime (A, B) {
	if (new Date(A.Time).valueOf() > new Date(B.Time).valueOf()) {
		return 1
	} else if (new Date(A.Time).valueOf() < new Date(B.Time).valueOf()) {
		return -1
	} else {
		return 0
	}
}