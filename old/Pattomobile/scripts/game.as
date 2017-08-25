import org.cove.ape.*
import DBK.Global
import DBK.EncDec

stop()
Global.global.hideBananaMaker()

var level,car,lwidth,lheight,surfaces,objects,info,bg,behind,patto,best_txt,time_txt,tfb,tft,os,ss,id,tmpG
var pregame:Boolean = true
Global.global.paused = true
Global.global.debug = false

var loader:URLLoader = new URLLoader()
loader.addEventListener("complete", xmlLoaded)
loader.addEventListener("ioError", xmlError)

function xmlError (event:Event) {
	returnToMenu()
	alert("XML Loader - "+event.text.split(" ")[1].split(":")[0], "The XML Loader has encountered a fatal error while trying to load \""+data+".xml\"\n\nThe target file could not be found, it either does not exist or is corrupted.")
}

function xmlLoaded (event:Event) {
	try {
		level = Global.global.level = XML(EncDec.decrypt(loader.data.substr(0,loader.data.length-1), "22172657_pattomobile"))
	} catch (error:Error) {
		returnToMenu()
		alert("XML Parser - "+error.message.split(" ")[1].split(":")[0], "The XML Parser has encountered a fatal error while trying to parse \""+data+".xml\":\n\nThe Document may be malformed or contain invalid data, please reinstall the application.")
		return
	}
	
	try {
		if (Global.global.replay) {
			RandomSeed.reseed(Global.global.rpd.split(":")[0])
			Global.global.frame = 0
			Global.global.data = Global.global.rpd.split(":")[1].split("")
			Global.global.fdata = getReplayBinary(Global.global.data[0])
		} else {
			Global.global.rpd = RandomSeed.reseed(Math.random() * RandomSeed.LIMIT) + ":"
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Init Replays - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while the replay system was being initialised.\n\nThis is probably due to invalid or corrupted replay data.", true)
		return
	}

	try {
		lwidth = level.@w
		lheight = level.@h
		stage.frameRate = 180 / checkData("speed", 3)
		APEngine.init(1 / 3)
		APEngine.container = new Sprite()
		APEngine.addMasslessForce(new Vector(0,level.@grav))
		
		Global.global.fixed = new Group(false)
		Global.global.mobile = new Group(true)
		Global.global.mobile.addCollidable(Global.global.fixed)
		APEngine.addGroup(Global.global.fixed)
		APEngine.addGroup(Global.global.mobile)
	} catch (error:Error) {
		returnToMenu()
		alert("Init Physics - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while the APE physics was being initialised.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		bg = new Sprite()
		bg.graphics.beginFill(Number("0x"+level.@bg))
		bg.graphics.drawRect(0,-10,640,500)
		bg.graphics.endFill()
		addChild(bg)
		behind = new Sprite()
		addChild(behind)
	} catch (error:Error) {
		returnToMenu()
		alert("Init Graphics - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while the graphics were being created.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		car = new Car(level.@x, level.@y)
		addChild(car)
		if (level.@px.toString() != "" && level.@py.toString() != "") {
			patto = new Patto(level.@px, level.@py)
			addChild(patto)
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Car/Patto - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while trying to create the 'Car' or 'Patto' object.\n\nThis is most likely a problem with the level data.", true)
		return
	}
	
	try {
		surfaces = new Sprite()
		addChild(surfaces)
		objects = new Sprite()
		addChild(objects)
	} catch (error:Error) {
		returnToMenu()
		alert("Init Graphics - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while the graphics were being created.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		ss = level.surfaces.children()
		for each (id in ss) {
			if (id.@x.toString() != "") {
				if (id.@x.indexOf("?") != -1) id.@x = Number(id.@x.split("?")[0]) + RandomSeed.nextFloat() * (id.@x.split("?")[1] - id.@x.split("?")[0])
			}
			if (id.@y.toString() != "") {
				if (id.@y.indexOf("?") != -1) id.@y = Number(id.@y.split("?")[0]) + RandomSeed.nextFloat() * (id.@y.split("?")[1] - id.@y.split("?")[0])
			}
			switch (String(id.name())) {
				case "rect":
					surfaces.addChild(new RectangleSurface(id.@x,id.@y,id.@w,id.@h,id.@r,(id.@col.toString()=="")?((id.@type.toString()=="") ? level.@col : level.attribute(id.@type.toString())) : id.@col, id.@type, id.@f, id.@ghost.toString() == "true", id.@d, id.@id))
					break
				case "circ":
					surfaces.addChild(new CircleSurface(id.@x,id.@y,id.@r,(id.@col.toString()=="")?((id.@type.toString()=="") ? level.@col : level.attribute(id.@type.toString())) : id.@col,id.@type,id.@f,id.@ghost.toString() == "true",id.@d,id.@id))
					break
				case "move":
					switch (id.@type.toString()) {
						case "rect":
							surfaces.addChild(new MoveRectangle(id.@x,id.@y,id.@w,id.@h,id.@r, id.@col.toString() == "" ? level.@move : id.@col, id.@minx, id.@maxx, id.@miny, id.@maxy, id.@d, id.@s, id.@m, id.@id))
							break
					}
					break
				case "bridge":
					surfaces.addChild(new Bridge(id.@x,id.@y,id.@x2,id.@y2,id.@n,id.@s,(id.@col.toString()=="") ? (level.@bridge.toString()=="" ? level.@col : level.@bridge) : id.@col))
					break
				case "squish":
					surfaces.addChild(new Squish(id.children(),id.@s,(id.@col.toString()=="") ? (level.@squish.toString()=="" ? level.@col : level.@squish) : id.@col))
					break
				case "vine":
					surfaces.addChild(new Vine(id.@x,id.@y,id.@l,id.@n,id.@s,(id.@col.toString()=="") ? (level.@vine.toString()=="" ? level.@col : level.@vine) : id.@col))
					break
				case "halfpipe":
					surfaces.addChild(new Halfpipe(id.@x,id.@y,id.@r,id.@s*Math.PI/180,id.@e*Math.PI/180,id.@n,id.@w,id.@h,(id.@col.toString()=="") ? (level.@halfpipe.toString()=="" ? level.@col : level.@halfpipe) : id.@col))
					break
			}
		}
		Global.global.fixed._particles.sort(arrangeParticles)
	} catch (error:Error) {
		returnToMenu()
		alert("Surfaces - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while surfaces were being created.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		os = level.objects.children()
		for each (id in os) {
			if (id.@x.toString() != "") {
				if (id.@x.indexOf("?") != -1) id.@x = Number(id.@x.split("?")[0]) + RandomSeed.nextFloat() * (id.@x.split("?")[1] - id.@x.split("?")[0])
			}
			if (id.@y.toString() != "") {
				if (id.@y.indexOf("?") != -1) id.@y = Number(id.@y.split("?")[0]) + RandomSeed.nextFloat() * (id.@y.split("?")[1] - id.@y.split("?")[0])
			}
			switch (String(id.name())) {
				case "exit":
					objects.addChild(new Exit(id.@x,id.@y,id.@w,id.@h,id.@r))
					break
				case "switch":
					objects.addChild(new Switch(id.@x,id.@y,id.@id))
					break
				case "extra":
					if (! checkData(id.@id.toString(), false)) {
						objects.addChild(new Extra(id.@x,id.@y,id.@r,id.@id))
					}
					break
				case "graphic":
					tmpG = getGraphic(id.@id)
					tmpG.x = id.@x
					tmpG.y = id.@y
					tmpG.scaleX = id.@w
					tmpG.scaleY = id.@h
					tmpG.rotation = id.@r
					if (id.@fixed.toString() == "true") {
						bg.addChild(tmpG)
					} else if (id.@behind.toString() == "true") {
						behind.addChild(tmpG)
					} else {
						objects.addChild(tmpG)
					}
					break
				case "boss":
					switch (String(id.@id)) {
						case "bgm":
							objects.addChild(new BGM(id.@x,id.@y,id.@t))
							break
						case "mnm":
							objects.addChild(new MNM(id.@x,id.@y,bg))
							break
						case "megapatto":
							objects.addChild(new MegaPatto(id.@x,id.@y))
							break
					}
					break
				case "patto":
					switch (String(id.@type)) {
						case "bounce":
							objects.addChild(new BouncePatto(id.@x,id.@y,id.@vx,id.@vy))
							break
						case "laser":
							objects.addChild(new LaserPatto(id.@x,id.@y,id.@minx,id.@maxx,id.@int))
							break
						case "kamikaze":
							objects.addChild(new KamikazePatto(id.@x,id.@y,id.@n))
							break
					}
					break
			}
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Objects - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while objects were being created.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		if (getData("level6_4") == "beaten") {
			tfb = new TextFormat("Tahoma",16,Number("0x"+level.@txtcol),false,false,false,null,null,TextFormatAlign.LEFT)
			tft = new TextFormat("Tahoma",16,Number("0x"+level.@txtcol),false,false,false,null,null,TextFormatAlign.RIGHT)
			best_txt = new TextField()
			time_txt = new TextField()
			best_txt.height = time_txt.height = 24
			best_txt.y = time_txt.y = -Math.min(0, Math.max(240 - level.@y, -(lheight - 480))) + 456
			best_txt.x = -Math.min(0, Math.max(320 - level.@x, -(lwidth - 640)))
			time_txt.x = best_txt.x + 540
			best_txt.defaultTextFormat = tfb
			time_txt.defaultTextFormat = tft
			best_txt.text = formatTime(checkData("time_" + data, 3599999))
			time_txt.text = formatTime(0)
			addChild(best_txt)
			addChild(time_txt)
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Time Trial - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while trying to setup Time Trial Mode.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	if (data.substr(0, 5) == "bonus") {
		if (data != "bonus"+level.@lv || level.@ep != "7") {
			returnToMenu()
			alert("Inconsistency!", "Hmm, the level data does not match what was expected...\n\nThis may be caused by either slighty currupted files or (more likely) cheating!", true)
			return
		}
	} else {
		if (data != "level"+level.@ep+"_"+level.@lv) {
			returnToMenu()
			alert("Inconsistency!", "Hmm, the level data does not match what was expected...\n\nThis may be caused by either slighty currupted files or (more likely) cheating!", true)
			return
		}
	}
	
	try {
		if (pregame) {
			info = new Info(level.@ep, level.@lv, level.@name, level.desc, so)
			info.x = -Math.min(0, Math.max(320 - level.@x, -(lwidth - 640))) + 320
			info.y = -Math.min(0, Math.max(240 - level.@y, -(lheight - 480))) + 240
			addChild(info)
		} else {
			setupListen()
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Pregame Info - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while trying to display Pregame Info.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		stage.addEventListener(KeyboardEvent.KEY_DOWN, pressKey)
		if (car != null) {
			car.addEvent("kill", death)
			car.addEvent("exit", exit)
			if (! Global.global.replay) car.addEvent("extra", extra)
		}
		if (patto != null) {
			patto.addEvent("kill", death)
			patto.addEvent("exit", exit)
		}
	} catch (error:Error) {
		returnToMenu()
		alert("Event Setup - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while trying to setup event listeners.\n\n(No trobleshooting info availiable!)", true)
		return
	}
	
	try {
		bg.x = -Math.min(0, Math.max(320 - level.@x, -(lwidth - 640)))
		bg.y = -Math.min(0, Math.max(240 - level.@y, -(lheight - 480)))
		x = Math.min(0, Math.max(320 - level.@x, -(lwidth - 640)))
		y = Math.min(0, Math.max(240 - level.@y, -(lheight - 480)))
	} catch (error:Error) {
		returnToMenu()
		alert("Scrolling - "+error.message.split(" ")[1].split(":")[0], "An unexpected error occured while trying to scroll the screen???\n\n(No trobleshooting info availiable!)", true)
		return
	}
}

function death (event:Event) {
	if (! Global.global.replay && getData("rp_death")) {
		saveReplay("Death")
	}
	resetLevel()
	loadLevel()
}

function exit (event:Event) {
	if (event.s.type == "patto") {
		removeChild(patto)
		patto.cleanup()
		patto = null
		if (car != null)  {
			car.control = true
		}
	} else if (event.s.type == "car") {
		removeChild(car)
		car.cleanup()
		car = null
		if (patto != null) {
			patto.control = true
		}
	}
	if (car == null && patto == null) {
		if (Global.global.replay) {
			resetLevel()
			loadLevel()
			return
		}
		if (Global.global.time < getData("time_"+data)) {
			setData("time_"+data, Global.global.time)
			saveReplay("Record")
		} else if (getData("rp_win")) {
			saveReplay("Win")
		}
		resetLevel()
		if (getData("speed") == 3) {
			if (data.substr(0, 5) == "bonus") {
				if (getData(data) != "beaten") {
					setData(data, "beaten")
					if (getData("bonus1") == "beaten" && getData("bonus2") == "beaten" && getData("bonus3") == "beaten" && getData("bonus4") == "beaten" && getData("bonus5") == "beaten" && getData("bonus6") == "beaten" && getData("bonus7") == "beaten" && getData("bonus8") == "beaten" && getData("bonus9") == "beaten") {
						setData("bonus", true)
						Global.global.bananaMaker = new BananaMaker()
						returnToMenu()
						alert("All Bonuses Beaten!", "Congratulations!\n\nYou've beaten every bonus level, and unlocked a final bonus skin and cutscene!")
					} else {
						returnToMenu()
					}
				} else {
					returnToMenu()
				}
			} else {
				var w:Number = data.substr(5, 1)
				var l:Number = data.substr(7, 1)
				if (l == 4) {
					if (getData("level"+(w+1)+"_1") == "locked") {
						setData("level"+(w+1)+"_1", "unbeaten")
					}
				} else {
					if (getData("level"+w+"_"+(l+1)) == "locked") {
						setData("level"+w+"_"+(l+1), "unbeaten")
					}
				}
			
				if (getData(data) != "beaten") {
					setData(data, "beaten")
					playCutscene(w, l)
				} else {
					returnToMenu()
				}
			}
		} else {
			returnToMenu()
		}
	}
}

function extra (event:Event) {
	if (getData("speed") == 3) {
		setData(event.p.data, true)
		event.p.dispatchEvent(new Event("collect"))
		Global.global.fixed.removeParticle(event.p)
	}
}

function run (event:Event):void {
	try {
	if (car != null && ! (Global.global.debug && Global.global.replay)) {
		if (car.control) {
			bg.x = -Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
			bg.y = -Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480)))
			x = Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
			y = Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480)))
			if (getData("level6_4") == "beaten") {
				best_txt.y = time_txt.y = -Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480))) + 456
				best_txt.x = -Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
				time_txt.x = best_txt.x + 540
			}
		} else {
			bg.x = -Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
			bg.y = -Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480)))
			x = Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
			y = Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480)))
			if (getData("level6_4") == "beaten") {
				best_txt.y = time_txt.y = -Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480))) + 456
				best_txt.x = -Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
				time_txt.x = best_txt.x + 540
			}
		}
	} else if (patto != null && ! (Global.global.debug && Global.global.replay)) {
		if (! patto.control) {
			bg.x = -Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
			bg.y = -Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480)))
			x = Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
			y = Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480)))
			if (getData("level6_4") == "beaten") {
				best_txt.y = time_txt.y = -Math.min(0, Math.max(240 - car.patto.y, -(lheight - 480))) + 456
				best_txt.x = -Math.min(0, Math.max(320 - car.patto.x, -(lwidth - 640)))
				time_txt.x = best_txt.x + 540
			}
		} else {
			bg.x = -Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
			bg.y = -Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480)))
			x = Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
			y = Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480)))
			if (getData("level6_4") == "beaten") {
				best_txt.y = time_txt.y = -Math.min(0, Math.max(240 - patto.patto.y, -(lheight - 480))) + 456
				best_txt.x = -Math.min(0, Math.max(320 - patto.patto.x, -(lwidth - 640)))
				time_txt.x = best_txt.x + 540
			}
		}
	}
	} catch (error:Error) {
		resetLevel()
		returnToMenu()
		alert("Scrolling - "+error.message.split(" ")[1].split(":")[0], "A fatal error occured while trying to scroll the screen???\n\n(No trobleshooting info availiable!)")
		return
	}
	
	try {
		APEngine.step()
	} catch (error:Error) {
		resetLevel()
		returnToMenu()
		alert("Physics Step - "+error.message.split(" ")[1].split(":")[0], "A fatal error occured during physics and collision checking. \n\n(No trobleshooting info availiable!)")
		return
	}
	
	try {
	if (Global.global.replay) {
		Global.global.frame++
		if (Global.global.frame >= Global.global.data.length) {
			resetLevel()
			loadLevel()
			return
		}
		Global.global.fdata = getReplayBinary(Global.global.data[Global.global.frame])
		if (Global.global.fdata[4] == "1" && getReplayBinary(Global.global.data[Global.global.frame-1])[4] == "0") {
			car.control = ! car.control
			patto.control = ! patto.control
		}
		if (getData("level6_4") == "beaten") {
			Global.global.time = (Global.global.frame + 1) * 1000 / 60
			time_txt.text = formatTime(Global.global.time)
		}
	} else {
		Global.global.rpd += String.fromCharCode(recordKey("key1") + recordKey("key2") * 2 + recordKey("key3") * 4 + recordKey("key4") * 8 + recordKey("key7") * 16 + recordKey("key10") * 32)
		if (getData("level6_4") == "beaten") {
			Global.global.time = (Global.global.rpd.length - (Global.global.rpd.indexOf(":") + 1)) * 1000 / 60
			time_txt.text = formatTime(Global.global.time)
		}
	}
	} catch (error:Error) {
		resetLevel()
		returnToMenu()
		alert("Replay Step - "+error.message.split(" ")[1].split(":")[0], "A fatal error occured while trying to read or write replay data.\n\nProbably due to invalid or corrupted replay data.")
		return
	}
}

function recordKey (key:String) {
	return Global.global.key.isDown(getData(key)) ? 1 : 0
}

function getReplayBinary(ch:String) {
	var code = ch.charCodeAt(0)
	var bin = []
	bin[5] = Math.floor(code/32)
	code -= bin[5] * 32
	bin[4] = Math.floor(code/16)
	code -= bin[4] * 16
	bin[3] = Math.floor(code/8)
	code -= bin[3] * 8
	bin[2] = Math.floor(code/4)
	code -= bin[2] * 4
	bin[1] = Math.floor(code/2)
	code -= bin[1] * 2
	bin[0] = code
	return bin
}

function pressKey (event:KeyboardEvent) {
	if (event.keyCode == checkData("key6", Keyboard.ESCAPE) && ! pregame && ! Global.global.paused) {
		if (! Global.global.replay && getData("rp_exit")) {
			saveReplay("Exit")
		}
		resetLevel()
		returnToMenu()
	} else if (event.keyCode == checkData("key5", 82) && ! pregame && ! Global.global.paused) {
		if (! Global.global.replay && getData("rp_reset")) {
			saveReplay("Reset")
		}
		resetLevel()
		loadLevel()
	} else if (event.keyCode == checkData("key7", Keyboard.TAB) && ! pregame && patto != null && car != null && ! Global.global.paused && ! Global.global.replay) {
		car.control = ! car.control
		patto.control = ! patto.control
	} else if (event.keyCode == checkData("key9", 19) && ! pregame) {
		Global.global.paused = hasEventListener(Event.ENTER_FRAME)
		if (hasEventListener(Event.ENTER_FRAME)) {
			removeEventListener(Event.ENTER_FRAME, run)
		} else {
			addEventListener(Event.ENTER_FRAME, run)
		}
	} else if (pregame) {
		pregame = false
		info.close(setupListen)
	} else if (Global.global.debug && (Global.global.paused || Global.global.replay)) {
		if (event.keyCode == Keyboard.LEFT) {
			x += event.shiftKey ? 100 : (event.ctrlKey ? 1 : 10)
		}
		if (event.keyCode == Keyboard.RIGHT) {
			x -= event.shiftKey ? 100 : (event.ctrlKey ? 1 : 10)
		}
		if (event.keyCode == Keyboard.UP) {
			y += event.shiftKey ? 100 : (event.ctrlKey ? 1 : 10)
		}
		if (event.keyCode == Keyboard.DOWN) {
			y -= event.shiftKey ? 100 : (event.ctrlKey ? 1 : 10)
		}
		bg.x = -x
		bg.y = -y
		if (getData("level6_4") == "beaten") {
			best_txt.y = time_txt.y = -y + 456
			best_txt.x = -x
			time_txt.x = best_txt.x + 540
		}
	}
}

function setupListen () {
	Global.global.paused = false
	addEventListener(Event.ENTER_FRAME, run)
	addEventListener(Event.DEACTIVATE, deactivate)
	addEventListener(Event.ACTIVATE, activate)
	Global.global.key.addEventListener("up_debug", toggleDebug)
}

function toggleDebug (event:Event) {
	Global.global.debug = ! Global.global.debug
}

function deactivate (event:Event) {
	if (Global.global.paused) {
		if (hasEventListener(Event.ACTIVATE)) {
			removeEventListener(Event.ACTIVATE, activate)
		}
	} else {
		Global.global.paused = true
		removeEventListener(Event.ENTER_FRAME, run)
		if (! hasEventListener(Event.ACTIVATE)) {
			addEventListener(Event.ACTIVATE, activate)
		}
	}
}

function activate (event:Event) {
	Global.global.paused = false
	addEventListener(Event.ENTER_FRAME, run)
}

function resetLevel () {
	removeEventListener(Event.ENTER_FRAME, run)
	removeEventListener(Event.DEACTIVATE, deactivate)
	removeEventListener(Event.ACTIVATE, activate)
	Global.global.key.removeEventListener("up_debug", toggleDebug)
	
	APEngine.removeGroup(Global.global.fixed)
	APEngine.removeGroup(Global.global.mobile)
	
	if (car != null) {
		removeChild(car)
		car.cleanup()
		car = null
	}
	if (patto != null) {
		removeChild(patto)
		patto.cleanup()
		patto = null
	}
	if (bg != null) {
		var n = bg.numChildren
		for (var i:uint = 0; i < n; i++) {
			if (bg.getChildAt(0).cleanup is Function) bg.getChildAt(0).cleanup()
			bg.removeChildAt(0)
		}
		removeChild(bg)
		bg = null
	}
	if (surfaces != null) {
		n = surfaces.numChildren
		for (i = 0; i < n; i++) {
			if (surfaces.getChildAt(0).cleanup is Function) surfaces.getChildAt(0).cleanup()
			surfaces.removeChildAt(0)
		}
		removeChild(surfaces)
		surfaces = null
	}
	if (objects != null) {
		n = objects.numChildren
		for (i = 0; i < n; i++) {
			if (objects.getChildAt(0).cleanup is Function) objects.getChildAt(0).cleanup()
			objects.removeChildAt(0)
		}
		removeChild(objects)
		objects = null
	}
	if (behind != null) {
		n = behind.numChildren
		for (i = 0; i < n; i++) {
			if (behind.getChildAt(0).cleanup is Function) behind.getChildAt(0).cleanup()
			behind.removeChildAt(0)
		}
		removeChild(behind)
		behind = null
	}
	if (time_txt != null) {
		removeChild(best_txt)
		removeChild(time_txt)
	}
	
	x = y = 0
}

function getGraphic (id:String) {
	switch (id.toLowerCase()) {
		case "cage":
			return new g_cage()
			break
		case "cavespike":
			return new g_cavespike()
			break
		case "evening":
			return new g_evening()
			break
		case "moon":
			return new g_moon()
			break
		case "minion":
			return new g_minion()
			break
		case "minion_shifty":
			return new g_minion_shifty()
			break
		case "icecave":
			return new g_icecave()
			break
		case "icycle":
			return new g_icycle()
			break
		case "window":
			return new g_window()
			break
		case "star":
			return new g_star()
			break
		case "house":
			return new g_house()
			break
		case "house2":
			return new g_house2()
			break
		case "hazard":
			return new g_hazard()
			break
		case "hazard_balls":
			return new g_hazard_balls()
			break
		case "hazard_bounce":
			return new g_hazard_bounce()
			break
		case "hazard_lava":
			return new g_hazard_lava()
			break
		case "hazard_patto":
			return new g_hazard_patto()
			break
		case "arrow":
			return new g_arrow()
			break
		default:
			return new Sprite()
			break
	}
}

function playCutscene (w, l) {
	switch (w+"_"+l) {
		case "1_4":
			cs = new cs1_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "2_3":
			cs = new cs2_3()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "2_4":
			cs = new cs2_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "3_4":
			cs = new cs3_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "4_4":
			cs = new cs4_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "5_3":
			cs = new cs5_3()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "5_4":
			cs = new cs5_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "6_3":
			cs = new cs6_3()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		case "6_4":
			cs = new cs6_4()
			addChild(cs)
			cs.addEventListener("stop", endCutscene)
			break
		default:
			returnToMenu()
			if (data.substr(7, 1) == "4") alert("Extra Unlocked!", "\nA new Skin is now available for use!\n\nCheck the EXTRAS menu to see what it is.")
			break
	}
}

function endCutscene (event:Event) {
	removeChild(cs)
	cs = null
	returnToMenu()
	if (data == "level6_4") {
		alert("Game Complete!", "Congratulations!\nYou have beaten Pattomobile!\n\nBut it ain't over yet...\nHave you got all 9 stars? 10 skins?")
		alert("Time Trial Mode!", "\nYou're best times are now recorded when you beat a level.\n\nSee if you can finish faster then all your friends!")
	}
	alert("Extra Unlocked!", "\nA new Cutscene is now available to watch!\n\nCheck the EXTRAS menu to watch it.")
	if (data.substr(7, 1) == "4") alert("Extra Unlocked!", "\nA new Skin is now available for use!\n\nCheck the EXTRAS menu to see what it is.")
	if (data == "level3_4" || data == "level4_4" || data == "level5_3" || data == "level6_4") alert("Extra Unlocked!", "\nA new Game Speed can now be selected!\n\nCheck the OPTIONS menu to set the Game Speed.")
}

function returnToMenu () {
	if (Global.global.replay) {
		gotoAndStop("replays")
		Global.global.replay = false
	} else if (data.substr(0, 5) == "bonus") {
		gotoAndStop("extras")
	} else {
		gotoAndStop("menu")
	}
	Global.global.showBananaMaker()
}

function saveReplay (r) {
	var rp = new Object()
	rp.Level = Global.global.level.@ep + " - " + Global.global.level.@lv + ": " + Global.global.level.@name
	rp.Result = r
	rp.Time = new Date().toLocaleString()
	rp.Seed = Global.global.rpd.split(":")[0]
	rp.Size = Math.ceil(Global.global.rpd.length / 102.4) / 10 + " kb"
	rp.level = data
	rp.data = Global.global.rpd
	so.data.replay2.push(rp)
}

function exitReplay (event:MouseEvent) {
	resetLevel()
	returnToMenu()
}

function formatTime (t:uint) {
	var ms = t % 1000
	var sec = (t - ms) / 1000 % 60
	var min = (t - ms - sec * 1000) / 60000 % 60
	var hr = (t - ms - sec * 1000 - min * 60000) / 3600000 % 24
	return (hr ? hr+":" : "") + (min ? (min < 10 ? (hr ? "0" : "")+min+":" : min+":") : "") + (sec < 10 ? (sec ? (min ? "0" : "")+sec+"." : (min ? "00." : "0.")) : sec+".") + (ms < 100 ? (ms < 10 ? "00"+ms : "0"+ms) : ms)
}

function arrangeParticles (A, B) {
	if (A.type == B.type) {
		return 0
	} else if (A.type == "bounce") {
		return -1
	} else if (B.type == "bounce") {
		return 1
	} else if (A.type == "kill") {
		return -1
	} else if (B.type == "kill") {
		return 1
	} else {
		return 0
	}
}

function loadLevel() {
	loader.load(new URLRequest("levels/_"+data+".xml"))
}

checkData("key1", Keyboard.LEFT)
checkData("key2", Keyboard.RIGHT)
checkData("key3", Keyboard.UP)
checkData("key4", Keyboard.DOWN)
checkData("key7", Keyboard.TAB)
checkData("key10", Keyboard.SPACE)

loadLevel()