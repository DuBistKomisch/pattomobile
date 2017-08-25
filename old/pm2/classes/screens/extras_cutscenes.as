/**
 *  filename: screens/extras_cutscenes.as
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
	
	public class extras_cutscenes extends Screen {
		var packs_tl:TileList = new TileList();
		var cutscenes_tl:TileList = new TileList();
		
		public function extras_cutscenes () {
			submenu = "Extras";
			title = "Cutscenes";
			initTitle();
			
			var packs:Array = new Array();
			for (var pack:String in Global.packs) {
				packs.push({
					id:pack,
					label:Global.packs[pack].label + " (" + Global.packs[pack].numCutscenes(Global.functions.topProgress(pack)) + " of " + Global.packs[pack].numCutscenes(Global.packs[pack].length) + " cutscene" + Util.plural(Global.packs[pack].numCutscenes(Global.packs[pack].length)) + ")",
					source:Global.packs[pack].splash
				});
			}
			
			packs_tl.dataProvider = new DataProvider(packs);
			packs_tl.columnCount = 1;
			packs_tl.columnWidth = packs_tl.width = 302;
			packs_tl.rowCount = packs_tl.dataProvider.length;
			packs_tl.rowHeight = 82;
			packs_tl.height = Math.min(packs_tl.rowCount * packs_tl.rowHeight, 328);
			packs_tl.move(40, 76);
			packs_tl.direction = ScrollBarDirection.VERTICAL;
			packs_tl.focusEnabled = false;
			addChild(packs_tl);
			
			cutscenes_tl = new TileList();
			cutscenes_tl.move(380, 87);
			cutscenes_tl.direction = ScrollBarDirection.VERTICAL;
			cutscenes_tl.focusEnabled = false;
			updateCutscenes();
			addChild(cutscenes_tl);
			
			packs_tl.addEventListener(Event.CHANGE, selectPack);
			menu_btn.addEventListener(MouseEvent.CLICK, back);
			
			if (Global.global.cutscene) {
				// returned from playing a cutscene
				for (var i:uint = 0; i < packs_tl.dataProvider.length; i++)
					if (packs_tl.dataProvider.getItemAt(i).id == Global.global.cutscene[0]) {
						// reselect the same level pack as when we left
						packs_tl.selectedIndex = i;
						selectPack();
					}
				Global.global.cutscene = null;
			}
		}
		
		public override function fadein () {
			if (cutscenes_tl.selectedIndex > -1) selectCutscene();
			else cutscenes_tl.addEventListener(Event.CHANGE, selectCutscene);
		}
		
		private function updateCutscenes () {
			cutscenes_tl.columnCount = Math.min(cutscenes_tl.dataProvider.length, 2);
			cutscenes_tl.columnWidth = 102;
			cutscenes_tl.width = cutscenes_tl.columnCount * cutscenes_tl.columnWidth;
			cutscenes_tl.rowCount = Math.ceil(cutscenes_tl.dataProvider.length / cutscenes_tl.columnCount);
			cutscenes_tl.rowHeight = 102;
			cutscenes_tl.height = Math.min(cutscenes_tl.rowCount * cutscenes_tl.rowHeight, 306);
		}
		
		private function selectPack (event:Event = null) {
			var pack:String = packs_tl.selectedItem.id;
			var progress:uint = Global.functions.topProgress(pack);
			var cutscenes:Array = new Array();
			for (var i:uint = 0; i <= progress; i++)
				if (Global.packs[pack].isCutscene(i))
					cutscenes.push({
						"pack":pack,
						cutscene:i,
						source:Global.packs[pack].getCutsceneArt(i)
					});
			cutscenes_tl.dataProvider = new DataProvider(cutscenes);
			updateCutscenes();
		}
		
		private function selectCutscene (event:Event = null) {
			Global.global.cutscene = [cutscenes_tl.selectedItem.pack, cutscenes_tl.selectedItem.cutscene, false];
			toScreen(22); // -> play_cutscene
		}
		
		public override function fadeout () {
			packs_tl.removeEventListener(Event.CHANGE, selectPack);
			cutscenes_tl.removeEventListener(Event.CHANGE, selectCutscene);
			menu_btn.removeEventListener(MouseEvent.CLICK, back);
		}
		
		public override function unload () {
			removeChild(packs_tl);
			packs_tl = null;
			removeChild(cutscenes_tl);
			cutscenes_tl = null;
			// super
			super.unload();
		}
	}
}