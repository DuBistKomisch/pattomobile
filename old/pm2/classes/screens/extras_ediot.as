/**
 *  filename: extras_ediot.as
 *  author: Jake Barnes
 *  modified: 7-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import ediot.Ediot;
	import events.EdiotEvent;
	import flash.display.BlendMode;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.net.SharedObject;
	import flash.ui.Keyboard;
	import flash.ui.Mouse;
	import fl.controls.Button;
	import fl.controls.ButtonLabelPlacement;
	import fl.controls.DataGrid;
	import fl.controls.TextArea;
	import fl.controls.ScrollBarDirection;
	import fl.controls.ScrollPolicy;
	import fl.controls.TileList;
	import fl.data.DataProvider;
	import g.cancel;
	import g.snapping;
	
	public class extras_ediot extends Screen {
		// menu UI etc.
		private var buttons:Sprite;
		private var menuButtons:Vector.<Button> = new Vector.<Button>();
		private var submenuButtons:Vector.<Button> = new Vector.<Button>();
		private var button:Button;
		private var head:Button;
		private var currentSubmenu:Array;
		private var menuOpen:Boolean = false;
		// menu map
		private var menu:Array = [
{label:"File", width:40, subwidth:50, submenu:[
	// open
	{label:"New", command:command_new},
	{label:"Open...", command:command_open},
	{label:"Rip...", command:command_rip},
	{label:"Revert", command:command_revert},
	// edit
	{label:"Save", command:command_save},
	{label:"Data...", command:command_data},
	// leave
	{label:"Test", command:command_test},
	{label:"Quit", command:command_quit}
	]},
{label:"Tools", width:50, subwidth:80, submenu:[
	{label:"Bring to front", tool:"bringfront"},
	{label:"Send to back", tool:"sendback"},
	{label:"Delete", tool:"delete"},
	{label:"Move", tool:"move"},
	{label:"Resize", tool:"resize"},
	{label:"Rotate", tool:"rotate"},
//	{label:"Properties", tool:"properties"} <-- probably need to make subwidth bigger, 70 maybe
	]},
{label:"Characters", width:80, subwidth:80, submenu:[
	{label:"Pattomobile", insert:"car"}
	]},
{label:"Surfaces", width:60, subwidth:70, submenu:[
	{label:"Circle", insert:"circle"},
	{label:"Rectangle", insert:"rectangle"}
	]}
];
		private var statusMessages:Object = {
// UI
welcome:"Welcome to Ediot! Use the file menu to create a new level or open one you've previously saved.",
"default":"Click and drag to pan. Scroll mouse wheel to zoom. Use the menus to insert or modify objects.",
open:"Double click a level to open. Single click to select, then press delete to delete or enter to open.",
rip:"Click to select a level pack from the left side to display the levels in it which you've beaten.",
beaten:"Click one of these levels you've beaten from this level pack to open it for editing.",
unbeaten:"You haven't beaten any levels in this level pack yet. Select a different pack or beat some. :)",
data:"Click cancel button to return to level. Ctrl+S to save and return to level. Ctrl+T to test level.",
// tools
"delete":"Delete tool: Click an object to remove it, but you can't delete the last character.",
bringfront:"Bring to front: Click an object to move it in front of all other objects on the same layer.",
sendback:"Send to back: Click an object to move it behind all other objects on the same layer.",
move:"Move tool: Drag an object to change its position. Hold control to work by the grid.",
resize:"Resize tool: Drag to change the shape of surfaces.",
rotate:"Rotate tool: Drag to spin objects around their centre. Hold control to work by the compass.",
properties:"Properties tool: Click an object to edit its properties."
};
		// other UI
		private var cancel_btn:Button;
		private var status_txt:TextField;
		private var snapping_btn:Button;
		private var open_dg:DataGrid;
		private var data_ta:TextArea;
		private var packs_tl:TileList;
		private var levels_tl:TileList;
		// level
		private var level:Ediot;
		private var currentLevel:int;
		
		public function extras_ediot () {
			// check our data is ready
			Global.checkData("editor", new Array());
			
			// stop music
			MusicManager.setMusic(null);
			
			// set up menu
			addChild(buttons = new Sprite());
			for (var i:uint = 0; i < menu.length; i++) {
				button = new Button();
				if (menu[i].submenu) button.toggle = true;
				button.label = menu[i].label;
				if (i) button.move(menuButtons[menuButtons.length-1].x+menuButtons[menuButtons.length-1].width,0);
				button.setSize(menu[i].width,20);
				button.addEventListener(MouseEvent.CLICK, clickMenuButton);
				menuButtons.push(buttons.addChild(button));
			}
			cancel_btn = new Button();
			cancel_btn.label = "";
			cancel_btn.setStyle("icon", cancel);
			cancel_btn.move(0, 460);
			cancel_btn.setSize(20, 20);
			cancel_btn.enabled = false;
			buttons.addChild(cancel_btn);
			
			status_txt = new TextField();
			status_txt.x = 28;
			status_txt.y = 463;
			status_txt.width = 632;
			status_txt.height = 18;
			status_txt.embedFonts = true;
			status_txt.defaultTextFormat = new TextFormat("hooge 06_66",8,0xFFFFFF);
			status_txt.selectable = false;
			status_txt.mouseEnabled = false;
			status_txt.blendMode = BlendMode.INVERT;
			status_txt.text = statusMessages["welcome"];
			buttons.addChild(status_txt);
			
			snapping_btn = new Button();
			snapping_btn.label = "";
			snapping_btn.setStyle("icon", snapping);
			snapping_btn.move(620, 0);
			snapping_btn.setSize(20, 20);
			snapping_btn.enabled = false;
			buttons.addChild(snapping_btn);
			
			// continue editing a level after testing
			if (Global.global.ediotLevel != null) {
				openLevel(Global.global.ediotLevel, Global.global.ediotData);
				Global.global.ediotLevel = null;
				Global.global.ediotData = null;
			}
			
			// set up events
			cancel_btn.addEventListener(MouseEvent.CLICK, clickCancelButton);
			snapping_btn.addEventListener(MouseEvent.CLICK, clickSnappingButton);
			Global.events.addEventListener(EdiotEvent.UI_HIDE, hideUI);
			Global.events.addEventListener(EdiotEvent.UI_SHOW, showUI);
			Global.stage.addEventListener(KeyboardEvent.KEY_DOWN, pressKey);
		}
		
	// --- cleanup
		
		public override function fadeout () {
			// remove events
			cancel_btn.removeEventListener(MouseEvent.CLICK, clickCancelButton);
			snapping_btn.removeEventListener(MouseEvent.CLICK, clickSnappingButton);
			Global.events.removeEventListener(EdiotEvent.UI_HIDE, hideUI);
			Global.events.removeEventListener(EdiotEvent.UI_SHOW, showUI);
			Global.stage.removeEventListener(KeyboardEvent.KEY_DOWN, pressKey);
			
			// remove UI events
			if (open_dg) {
				open_dg.removeEventListener(MouseEvent.DOUBLE_CLICK, clickOpen);
				open_dg.removeEventListener(KeyboardEvent.KEY_DOWN, keyOpen);
			}
			if (packs_tl) {
				packs_tl.removeEventListener(Event.CHANGE, selectRipPack);
			}
			if (levels_tl) {
				levels_tl.removeEventListener(Event.CHANGE, selectRipLevel);
			}
			if (data_ta) {
				data_ta.removeEventListener(KeyboardEvent.KEY_DOWN, keyData);
			}
			for each (var smb in submenuButtons)
				smb.removeEventListener(MouseEvent.CLICK, clickSubmenuButton);
			for each (var mb in menuButtons)
				mb.removeEventListener(MouseEvent.CLICK, clickMenuButton);
			
			// call level as well
			if (level) level.fadeout();
		}
		
		public override function unload () {
			// remove UI
			closeAll(false);
			while (submenuButtons.length) {
				buttons.removeChild(submenuButtons[0]);
				submenuButtons.shift();
			}
			while (menuButtons.length) {
				buttons.removeChild(menuButtons[0]);
				menuButtons.shift();
			}
			buttons.removeChild(cancel_btn);
			cancel_btn = null;
			buttons.removeChild(status_txt);
			status_txt = null;
			buttons.removeChild(snapping_btn);
			snapping_btn = null;
			removeChild(buttons);
			buttons = null;
			
			// unload level
			if (level) {
				level.unload();
				removeChild(level);
				level = null;
			}
		}
		
	// --- menu
		
		private function clickMenuButton (event:MouseEvent) {
			closeAll(false, false);
			if (menuOpen) closeMenu();
			if (head == event.currentTarget) {
				head = null;
				return;
			}
			menuOpen = true;
			head = Button(event.currentTarget);
			var item:Object = menu[menuButtons.indexOf(head)];
			if (item.submenu) {
				currentSubmenu = item.submenu;
				for (var i:uint = 0; i < currentSubmenu.length; i++) {
					button = new Button();
					button.label = currentSubmenu[i].label;
					button.move(head.x,20*(i+1));
					button.setSize(item.subwidth,20);
					button.enabled = currentSubmenu[i].insert || currentSubmenu[i].tool ? level != null : currentSubmenu[i].command(true);
					button.addEventListener(MouseEvent.CLICK, clickSubmenuButton);
					submenuButtons.push(buttons.addChild(button));
				}
			} else {
				currentSubmenu = new Array();
				if (item.command is Function) item.command();
			}
			Global.stage.focus = null;
		}
		
		private function closeMenu () {
			menuOpen = false;
			head.selected = false;
			while (submenuButtons.length) {
				submenuButtons[0].removeEventListener(MouseEvent.CLICK, clickSubmenuButton);
				buttons.removeChild(submenuButtons[0]);
				submenuButtons.shift();
			}
		}
		
		private function clickSubmenuButton (event:MouseEvent) {
			var item:Object = currentSubmenu[submenuButtons.indexOf(event.currentTarget)];
			status_txt.text = level ? statusMessages["default"] : statusMessages["welcome"];
			if (item.command is Function) {
				item.command();
			} else if (item.insert && level) {
				level.setForInsert(item.insert);
				status_txt.text = item.label;
				cancel_btn.enabled = true;
			} else if (item.tool && level) {
				level.setForTool(item.tool);
				status_txt.text = statusMessages[item.tool];
				cancel_btn.enabled = true;
			}
			closeMenu();
			Global.stage.focus = null; // otherwise keypress events go to button
			head = null;
		}
		
		private function clickCancelButton (event:MouseEvent = null) {
			if (level) level.cancelOperation();
			status_txt.text = statusMessages["default"];
			cancel_btn.enabled = false;
			closeAll(false);
		}
		
		private function clickSnappingButton (event:MouseEvent) {
			trace("open snapping dialog");
		}
		
		private function pressKey (event:KeyboardEvent) {
			if (event.keyCode == Keyboard.ESCAPE) clickCancelButton();
		}
		
	// --- global events
		
		private function hideUI (event:EdiotEvent) {
			buttons.visible = false;
		}
		
		private function showUI (event:EdiotEvent) {
			buttons.visible = true;
		}
		
	// --- level
		
		public function openLevel (id:int = -1, data:XML = null) {
			var data:XML;
			if (level != null) return;
			currentLevel = (id < 0 || id >= Global.so.data.editor.length) ? Global.so.data.editor.length : id;
			if (data == null) 
				data = (id >= 0 && id < Global.so.data.editor.length) ? Global.so.data.editor[id][0].copy() :
<level>
	<title>Untitled</title>
	<gravity>3</gravity>
	<width>1280</width>
	<height>960</height>
	<control>car</control>
	<colours>
		<background>FFFFFF</background>
		<normal>C0C0C0</normal>
		<kill>FF0000</kill>
	</colours>
	<characters>
		<car>
			<x>320</x>
			<y>240</y>
		</car>
	</characters>
	<surfaces/>
</level>;
			level = new Ediot(data);
			addChildAt(level, 0);
			if (data.control && data.characters[data.control]) {
				level.x = 320 - data.characters[data.control][0].x;
				level.y = 240 - data.characters[data.control][0].y;
			}
			snapping_btn.enabled = true;
			status_txt.text = statusMessages["default"];
		}
		
		private function closeLevel () {
			if (level == null) return;
			level.fadeout();
			level.unload();
			removeChild(level);
			level = null;
			snapping_btn.enabled = false;
		}
		
		private function closeAll (doLevel:Boolean = true, doData:Boolean = true) {
			if (doLevel) closeLevel();
			closeOpen();
			closeRip();
			if (doData) closeData();
			if (level == null && data_ta == null) {
				cancel_btn.enabled = false;
				status_txt.text = statusMessages["welcome"];
			}
			Global.functions.returnFocus();
		}
		
	// --- commands
		
		private function command_new (enabled:Boolean = false) {
			if (enabled) return true;
			closeAll();
			openLevel();
		}
		
		private function command_open (enabled:Boolean = false) {
			if (enabled) return true;
			closeAll();
			cancel_btn.enabled = true;
			status_txt.text = statusMessages["open"];
			
			open_dg = new DataGrid();
			open_dg.dataProvider = new DataProvider(Global.so.data.editor);
			open_dg.move(0,20);
			open_dg.setSize(640,440);
			open_dg.columns = ["ID", "Name", "Size", "Created", "Last Edited"];
			open_dg.getColumnAt(0).dataField = "4";
			open_dg.getColumnAt(0).width = 40;
			open_dg.getColumnAt(1).dataField = "1";
			open_dg.getColumnAt(1).width = 220;
			open_dg.getColumnAt(2).dataField = "0";
			open_dg.getColumnAt(2).width = 60;
			open_dg.getColumnAt(2).labelFunction = labelSize;
			open_dg.getColumnAt(2).sortCompareFunction = sortSize;
			open_dg.getColumnAt(3).dataField = "2";
			open_dg.getColumnAt(3).width = 160;
			open_dg.getColumnAt(3).labelFunction = labelCreated;
			open_dg.getColumnAt(4).dataField = "3";
			open_dg.getColumnAt(4).width = 160;
			open_dg.getColumnAt(4).labelFunction = labelLast;
			open_dg.getColumnAt(0).sortOptions = open_dg.getColumnAt(3).sortOptions = open_dg.getColumnAt(4).sortOptions = Array.NUMERIC;
			open_dg.addEventListener(MouseEvent.DOUBLE_CLICK, clickOpen);
			open_dg.addEventListener(KeyboardEvent.KEY_DOWN, keyOpen);
			addChildAt(open_dg, 0);
		}
		
			private function labelSize (data:Object) {
				return Util.fileSize(String(data[0]).length);
			}
			
			private function sortSize (a:Object, b:Object) {
				var sa:uint = String(a[0]).length;
				var sb:uint = String(b[0]).length;
				if (sa < sb) return -1;
				else if (sa > sb) return 1;
				else return 0;
			}
			
			private function labelCreated (data:Object) {
				return (new Date(data[2])).toLocaleString();
			}
		
			private function labelLast (data:Object) {
				return (new Date(data[3])).toLocaleString();
			}
			
			private function keyOpen (event:KeyboardEvent) {
				if (event.keyCode == Keyboard.ENTER) clickOpen();
				else if (event.keyCode == Keyboard.ESCAPE) closeAll();
				else if (event.keyCode == Keyboard.DELETE) {
					var old = open_dg.selectedIndex;
					Global.so.data.editor.splice(Global.so.data.editor.indexOf(open_dg.selectedItem), 1);
					open_dg.dataProvider.removeItem(open_dg.selectedItem);
					open_dg.selectedIndex = Math.min(open_dg.length - 1, old);
				}
			}
			
			private function clickOpen (event:MouseEvent = null) {
				closeAll();
				openLevel(Global.so.data.editor.indexOf(event.currentTarget.selectedItem));
			}
			
			private function closeOpen () {
				if (open_dg == null) return;
				removeChild(open_dg);
				open_dg.removeEventListener(MouseEvent.DOUBLE_CLICK, clickOpen);
				open_dg.removeEventListener(KeyboardEvent.KEY_DOWN, keyOpen);
				open_dg = null;
			}
			
		private function command_rip (enabled:Boolean = false) {
			if (enabled) return true;
			closeAll();
			cancel_btn.enabled = true;
			status_txt.text = statusMessages["rip"];
			
			var packs:Array = new Array();
			for (var pack:String in Global.packs)
				packs.push({
					id:pack,
					label:Global.packs[pack].label + " (" + Global.packs[pack].length + " level" + Util.plural(Global.packs[pack].length) + ")",
					source:Global.packs[pack].splash
				});
			
			packs_tl = new TileList();
			packs_tl.dataProvider = new DataProvider(packs);
			packs_tl.columnCount = Math.min(packs_tl.dataProvider.length, 1);
			packs_tl.columnWidth = 302;
			packs_tl.width = packs_tl.columnCount * packs_tl.columnWidth;
			packs_tl.rowCount = packs_tl.dataProvider.length;
			packs_tl.rowHeight = 82;
			packs_tl.height = Math.min(packs_tl.rowCount * packs_tl.rowHeight, 400);
			packs_tl.move(20, 40);
			packs_tl.direction = ScrollBarDirection.VERTICAL;
			addChildAt(packs_tl, 0);
			
			levels_tl = new TileList();
			updateRipLevels();
			levels_tl.move(360, 60);
			levels_tl.direction = ScrollBarDirection.VERTICAL;
			addChildAt(levels_tl, 0);
			
			packs_tl.addEventListener(Event.CHANGE, selectRipPack);
			levels_tl.addEventListener(Event.CHANGE, selectRipLevel);
		}
			
			private function updateRipLevels () {
				levels_tl.columnCount = Math.min(levels_tl.dataProvider.length, 5);
				levels_tl.columnWidth = 52;
				levels_tl.width = levels_tl.columnCount * levels_tl.columnWidth;
				levels_tl.rowCount = Math.ceil(levels_tl.dataProvider.length / levels_tl.columnCount);
				levels_tl.rowHeight = 52;
				levels_tl.height = Math.min(levels_tl.rowCount * levels_tl.rowHeight, 360);
			}
			
			private function selectRipPack (event:Event) {
				var pack:String = packs_tl.selectedItem.id;
				var progress:uint = Global.functions.topProgress(pack);
				if (progress) {
					var levels:Array = new Array();
					for (var i:uint = 0; i < progress; i++)
						levels.push({
							"pack":pack,
							level:i,
							source:Global.packs[pack].getArt(i)
						});
					levels_tl.dataProvider = new DataProvider(levels);
					updateRipLevels();
					status_txt.text = statusMessages["beaten"];
				} else {
					status_txt.text = statusMessages["unbeaten"];
				}
			}
			
			private function selectRipLevel (event:Event) {
				closeAll();
				openLevel(-1, Global.packs[event.target.selectedItem.pack].getData(event.target.selectedItem.level));
			}
			
			private function closeRip () {
				if (packs_tl) {
					removeChild(packs_tl);
					packs_tl.removeEventListener(Event.CHANGE, selectRipPack);
					packs_tl = null;
				}
				if (levels_tl) {
					removeChild(levels_tl);
					levels_tl.removeEventListener(Event.CHANGE, selectRipLevel);
					levels_tl = null;
				}
			}
		
		private function command_revert (enabled:Boolean = false) {
			if (enabled) return (level != null && currentLevel < Global.so.data.editor.length);
			closeLevel();
			openLevel(currentLevel);
		}
		
		private function command_save (enabled:Boolean = false) {
			if (enabled) return (level != null);
			if (Global.so.data.editor[currentLevel] == null)
				Global.so.data.editor[currentLevel] = [level.data, String(level.data.title), (new Date()).time, (new Date()).time, currentLevel];
			else {
				Global.so.data.editor[currentLevel][0] = level.data;
				Global.so.data.editor[currentLevel][1] = String(level.data.title);
				Global.so.data.editor[currentLevel][3] = (new Date()).time;
			}
			Global.so.flush();
		}
		
		private function command_data (enabled:Boolean = false) {
			if (enabled) return (level != null);
			
			data_ta = new TextArea();
			data_ta.move(0,20);
			data_ta.setSize(640,440);
			data_ta.setStyle("textFormat", new TextFormat("_typewriter",12));
			data_ta.textField.text = String(level.data);
			data_ta.addEventListener(KeyboardEvent.KEY_DOWN, keyData);
			addChildAt(data_ta, 0);
			
			closeAll(true, false);
			cancel_btn.enabled = true;
			status_txt.text = statusMessages["data"];
			Global.functions.stealFocus();
		}
			
			private function keyData (event:KeyboardEvent) {
				if (event.keyCode == Keyboard.S && KeyDown.isDown(Keyboard.CONTROL)) {
					saveData();
					closeAll();
				} else if (event.keyCode == Keyboard.T && KeyDown.isDown(Keyboard.CONTROL)) {
					command_test(false, XML(data_ta.text));
				}
			}
			
			private function saveData () {
				if (data_ta == null) return;
				if (Global.so.data.editor[currentLevel] == null)
					Global.so.data.editor[currentLevel] = [XML(data_ta.text), String(XML(data_ta.text).title), (new Date()).time, (new Date()).time, currentLevel];
				else {
					Global.so.data.editor[currentLevel][0] = XML(data_ta.text);
					Global.so.data.editor[currentLevel][1] = String(XML(data_ta.text).title);
					Global.so.data.editor[currentLevel][3] = (new Date()).time;
				}
				Global.so.flush();
			}
			
			private function closeData () {
				if (data_ta == null) return;
				openLevel(currentLevel, XML(data_ta.text));
				data_ta.addEventListener(KeyboardEvent.KEY_DOWN, keyData);
				removeChild(data_ta);
				data_ta = null;
			}
			
		private function command_test (enabled:Boolean = false, data:XML = null) {
			if (enabled) return (level != null);
			Global.global.ediotLevel = currentLevel;
			Global.global.ediotData = data ? data : level.data;
			level_ediot();
		}
		
		private function command_quit (enabled:Boolean = false) {
			if (enabled) return true;
			closeLevel();
			back();
		}
	}
}