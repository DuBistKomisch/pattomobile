/**
 *  filename: screens/play_load.as
 *  author: Jake Barnes
 *  modified: 8-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.events.KeyboardEvent
	import flash.events.MouseEvent
	import flash.ui.Keyboard
	import fl.controls.Button
	import fl.controls.DataGrid
	import fl.data.DataProvider
	import fl.controls.dataGridClasses.DataGridColumn
	
	public class play_load extends Screen {
		
		public function play_load () {
			submenu = "Play"
			title = "Load Game"
			initTitle()
			
			games_dg.dataProvider = new DataProvider(Global.so.data.save);
			games_dg.columns = ["Last Played", "Started", "Level Pack", "Progress"];
			games_dg.getColumnAt(0).dataField = "0";
			games_dg.getColumnAt(1).dataField = "1";
			games_dg.getColumnAt(2).dataField = "3";
			games_dg.getColumnAt(3).dataField = "2";
			games_dg.getColumnAt(0).width = games_dg.getColumnAt(1).width = 165;
			games_dg.getColumnAt(0).sortOptions = games_dg.getColumnAt(1).sortOptions = games_dg.getColumnAt(3).sortOptions = Array.NUMERIC
			games_dg.getColumnAt(0).labelFunction = labelLast;
			games_dg.getColumnAt(1).labelFunction = labelStart;
			games_dg.getColumnAt(2).labelFunction = labelPack;
			games_dg.getColumnAt(3).labelFunction = labelProgress;
			games_dg.dataProvider.sortOn("0", Array.DESCENDING);
			
			games_dg.addEventListener(MouseEvent.DOUBLE_CLICK, openGame)
			games_dg.addEventListener(KeyboardEvent.KEY_DOWN, keyGame)
			
			menu_btn.addEventListener(MouseEvent.CLICK, back)
		}
		
		public function keyGame (event:KeyboardEvent) {
			if (event.keyCode == Keyboard.ENTER) openGame();
			else if (event.keyCode == Keyboard.DELETE) deleteGame();
			Global.stage.dispatchEvent(event);
		}
		
		public function openGame (event:MouseEvent = null) {
			if (Global.packs[games_dg.selectedItem[3]]) {
				Global.functions.loadGame(Global.so.data.save.indexOf(games_dg.selectedItem));
				toScreen(20);
			}
		}
		
		public function deleteGame () {
			var old = games_dg.selectedIndex;
			Global.so.data.save.splice(Global.so.data.save.indexOf(games_dg.selectedItem), 1);
			games_dg.dataProvider.removeItem(games_dg.selectedItem);
			games_dg.selectedIndex = Math.min(old, games_dg.dataProvider.length - 1);
		}
		
		public function labelLast (data:Object) {
			return (new Date(data[0])).toLocaleString();
		}
		
		public function labelStart (data:Object) {
			return (new Date(data[1])).toLocaleString();
		}
		
		public function labelPack (data:Object) {
			return Global.packs[data[3]] ? Global.packs[data[3]].label : "(error)";
		}
		
		public function labelProgress (data:Object) {
			return Global.packs[data[3]] ? Math.round(data[2] / Global.packs[data[3]].length * 100) + "% (" + data[2] + " of " + Global.packs[data[3]].length + ")" : "(error)";
		}
		
		public override function fadeout () {
			// remove event listeners
			games_dg.removeEventListener(MouseEvent.DOUBLE_CLICK, openGame)
			games_dg.removeEventListener(KeyboardEvent.KEY_DOWN, keyGame)
			menu_btn.removeEventListener(MouseEvent.CLICK, back)
		}
	}
}