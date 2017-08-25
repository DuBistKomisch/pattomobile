/**
 *  filename: screens/play_new.as
 *  author: Jake Barnes
 *  modified: 8-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import fl.controls.Button;
	import fl.controls.ScrollBarDirection;
	import fl.controls.TileList;
	import fl.data.DataProvider;
	
	public class play_new extends Screen {
		var packs:Array = new Array();
		var new_tl:TileList = new TileList();
		
		public function play_new () {
			submenu = "Play";
			title = "New Game";
			initTitle();
			
			for (var pack:String in Global.packs) {
				packs.push({
					id:pack,
					label:Global.packs[pack].label + " (" + Global.packs[pack].length + " level" + Util.plural(Global.packs[pack].length) + ")",
					source:Global.packs[pack].splash
				});
			}
			
			new_tl.dataProvider = new DataProvider(packs);
			new_tl.columnCount = 1;
			new_tl.columnWidth = new_tl.width = 302;
			new_tl.rowCount = new_tl.dataProvider.length;
			new_tl.rowHeight = 82;
			new_tl.height = Math.min(new_tl.rowCount * new_tl.rowHeight, 328);
			new_tl.move(170, 65);
			new_tl.direction = ScrollBarDirection.VERTICAL;
			new_tl.focusEnabled = false;
			addChild(new_tl);
			
			menu_btn.addEventListener(MouseEvent.CLICK, back);
		}
		
		public override function fadein () {
			if (new_tl.selectedIndex > -1) startNew();
			else new_tl.addEventListener(Event.CHANGE, startNew);
		}
		
		private function startNew (event:Event = null) {
			Global.functions.newGame(new_tl.selectedItem.id);
			if (Global.packs[new_tl.selectedItem.id].isCutscene(0)) {
				// level pack starts with a cutscene
				Global.global.cutscene = [Global.save.pack, 0, true];
				toScreen(22);
			} else {
				// no cutscene, go straight to gameplay
				level_normal(0, Global.save.pack);
			}
		}
		
		public override function fadeout () {
			new_tl.removeEventListener(Event.CHANGE, startNew);
			menu_btn.removeEventListener(MouseEvent.CLICK, back);
		}
		
		public override function unload () {
			new_tl = null;
			packs = null;
			// super
			super.unload();
		}
	}
}