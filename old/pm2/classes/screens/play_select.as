/**
 *  filename: screens/play_select.as
 *  author: Jake Barnes
 *  modified: 8-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.events.Event;
	import flash.events.MouseEvent;
	import fl.controls.Button;
	import fl.controls.TileList;
	import fl.controls.ScrollBarDirection;
	import fl.data.DataProvider;
	
	public class play_select extends Screen {
		private var levels:Array = new Array();
		private var select_tl:TileList = new TileList();
		private var continue_btn:Button;
		
		public function play_select () {
			submenu = "Play";
			title = "Select Level";
			initTitle();
			
			continue_btn = new Button();
			continue_btn.move(480, 74);
			continue_btn.setSize(80, 22);
			continue_btn.label = "Continue >>";
			continue_btn.emphasized = continue_btn.enabled = (Global.save.progress < Global.packs[Global.save.pack].length);
			addChild(continue_btn);
			
			for (var i:uint = 0; i < Global.save.progress; i++)
				levels.push({source:Global.packs[Global.save.pack].getArt(i)});
			
			select_tl.dataProvider = new DataProvider(levels);
			select_tl.columnCount = Math.min(select_tl.dataProvider.length, 8);
			select_tl.columnWidth = 52;
			select_tl.width = select_tl.columnCount * select_tl.columnWidth;
			select_tl.rowCount = Math.ceil(select_tl.dataProvider.length / select_tl.columnCount);
			select_tl.rowHeight = 52;
			select_tl.height = Math.min(select_tl.rowCount * select_tl.rowHeight, 208);
			select_tl.move(112, 170);
			select_tl.direction = ScrollBarDirection.VERTICAL;
			select_tl.focusEnabled = false;
			addChild(select_tl);
			
			menu_btn.addEventListener(MouseEvent.CLICK, back);
			continue_btn.addEventListener(MouseEvent.CLICK, continueGame);
		}
		
		public override function fadein () {
			if (select_tl.selectedIndex > -1) selectLevel();
			else select_tl.addEventListener(Event.CHANGE, selectLevel);
		}
		
		public function selectLevel (event:Event = null) {
			level_normal(select_tl.selectedIndex, Global.save.pack);
		}
		
		public function continueGame (event:MouseEvent) {
			level_normal(Global.save.progress, Global.save.pack);
		}

		public override function fadeout() {
			select_tl.removeEventListener(Event.CHANGE, selectLevel);
			menu_btn.removeEventListener(MouseEvent.CLICK, back);
			continue_btn.removeEventListener(MouseEvent.CLICK, continueGame);
		}

		public override function unload() {
			select_tl = null;
			continue_btn = null;
			levels = null;
			// super
			super.unload();
		}
	}
}