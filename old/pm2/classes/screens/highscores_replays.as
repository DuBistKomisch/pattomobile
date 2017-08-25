/**
 *  filename: screens/highscores_replays.as
 *  author: Jake Barnes
 *  modified: 11-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import fl.controls.Button;
	import fl.controls.DataGrid;
	import fl.data.DataProvider;
	import fl.controls.dataGridClasses.DataGridColumn;
	
	public class highscores_replays extends Screen {
		
		public function highscores_replays () {
			submenu = "Highscores"
			title = "Replays"
			initTitle()
			
			replays_dg.dataProvider = new DataProvider(Global.so.data.replays);
			replays_dg.columns = ["Pack", "Map", "Result", "Timestamp", "Elapsed", "Size"];
			// associate columns with data
			replays_dg.getColumnAt(0).dataField = "7"; // pack
			replays_dg.getColumnAt(1).dataField = "6"; // map
			replays_dg.getColumnAt(2).dataField = "1"; // replay type
			replays_dg.getColumnAt(3).dataField = "2"; // timestamp
			replays_dg.getColumnAt(4).dataField = "3"; // frames
			replays_dg.getColumnAt(5).dataField = "5"; // data
			// default widths to neaten things up
			replays_dg.getColumnAt(0).width = 100;
			replays_dg.getColumnAt(1).width = 100;
			replays_dg.getColumnAt(2).width = 55;
			replays_dg.getColumnAt(3).width = 165;
			replays_dg.getColumnAt(4).width = 70;
			replays_dg.getColumnAt(5).width = 50;
			// label generation
			replays_dg.getColumnAt(0).labelFunction = labelPack;
			replays_dg.getColumnAt(1).labelFunction = labelMap;
			replays_dg.getColumnAt(2).labelFunction = labelResult;
			replays_dg.getColumnAt(3).labelFunction = labelTimestamp;
			replays_dg.getColumnAt(4).labelFunction = labelElapsed;
			replays_dg.getColumnAt(5).labelFunction = labelSize;
			// sorting configuration
			replays_dg.getColumnAt(0).sortCompareFunction = sortPack;
			replays_dg.getColumnAt(1).sortCompareFunction = sortMap;
			replays_dg.getColumnAt(2).sortOptions = Array.NUMERIC;
			replays_dg.getColumnAt(3).sortOptions = Array.NUMERIC;
			replays_dg.getColumnAt(4).sortOptions = Array.NUMERIC;
			replays_dg.getColumnAt(5).sortCompareFunction = sortSize;
			replays_dg.dataProvider.sortOn("0", Array.DESCENDING);
			// react to clicking and key presses
			replays_dg.addEventListener(MouseEvent.DOUBLE_CLICK, openReplay);
			replays_dg.addEventListener(KeyboardEvent.KEY_DOWN, keyReplay);
			
			menu_btn.addEventListener(MouseEvent.CLICK, back);
		}
		
		public function keyReplay (event:KeyboardEvent) {
			if (event.keyCode == Keyboard.ENTER) openReplay();
			else if (event.keyCode == Keyboard.DELETE) deleteReplay();
			Global.stage.dispatchEvent(event);
		}
		
		public function openReplay (event:MouseEvent = null) {
			var id:int = Global.so.data.replays.indexOf(replays_dg.selectedItem);
			if (id < 0)
				return;
			if (replays_dg.selectedItem[0] == GameType.NORMAL && Global.packs[replays_dg.selectedItem[7]])
				replay_normal(id);
			if (replays_dg.selectedItem[0] == GameType.DOWNLOADED)
				replay_downloaded(id);
		}
		
		public function deleteReplay () {
			var old = replays_dg.selectedIndex;
			Global.so.data.replays.splice(Global.so.data.replays.indexOf(replays_dg.selectedItem), 1);
			replays_dg.dataProvider.removeItem(replays_dg.selectedItem);
			replays_dg.selectedIndex = Math.min(old, replays_dg.dataProvider.length - 1);
		}
		
		private function labelPack (data:Object) {
			if (data[0] == GameType.NORMAL) {
				if (Global.packs[data[7]])
			 		return Global.packs[data[7]].label;
				else
					return "(error)";
			} else if (data[0] == GameType.DOWNLOADED) {
				return "(downloaded)";
			}
		}
		
		private function labelMap (data:Object) {
			if (data[0] == GameType.NORMAL) {
				if (Global.packs[data[7]])
			 		return Global.packs[data[7]].getData(data[6]).title;
				else
					return "(error)";
			} else if (data[0] == GameType.DOWNLOADED) {
				return ""; // TODO downloaded
			}
		}
		
		private function labelResult (data:Object) {
			return ["Death","Win","Reset","Exit"][data[1]];
		}
		
		private function labelTimestamp (data:Object) {
			return (new Date(data[2])).toLocaleString();
		}
		
		private function labelElapsed (data:Object) {
			return Util.framesToTime(data[3]);
		}
		
		private function labelSize (data:Object) {
			return Util.fileSize(data[5].length);
		}
		
		private function sortPack (a:Object, b:Object):int {
			if (a[0] == GameType.NORMAL && b[0] == GameType.DOWNLOADED)
				return -1;
			if (a[0] == GameType.DOWNLOADED && b[0] == GameType.NORMAL)
				return 1;
			if (a[0] == GameType.NORMAL && b[0] == GameType.NORMAL) {
				if (a[7] == b[7]) return 0;
				var al:String = Global.packs[a[7]] ? Global.packs[a[7]].label : a[7];
				var bl:String = Global.packs[b[7]] ? Global.packs[b[7]].label : b[7];
				if (al < bl) return -1;
				if (al > bl) return 1;
				return 0;
			}
			return 0;
		}
		
		private function sortMap (a:Object, b:Object):int {
			if (a[0] == GameType.NORMAL && b[0] == GameType.DOWNLOADED)
				return -1;
			if (a[0] == GameType.DOWNLOADED && b[0] == GameType.NORMAL)
				return 1;
			if (a[6] < b[6])
				return -1;
			if (a[6] > b[6])
				return 1;
			return 0;
		}
			
		private function sortSize (a:Object, b:Object):int {
			var sa:uint = a[5].length;
			var sb:uint = b[5].length;
			if (sa < sb) return -1;
			else if (sa > sb) return 1;
			else return 0;
		}
		
		public override function fadeout () {
			// remove event listeners
			replays_dg.removeEventListener(MouseEvent.DOUBLE_CLICK, openReplay);
			replays_dg.removeEventListener(KeyboardEvent.KEY_DOWN, keyReplay);
			menu_btn.removeEventListener(MouseEvent.CLICK, back);
		}
	}
}