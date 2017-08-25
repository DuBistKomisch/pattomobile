/**
 *  filename: screens/extras_logviewer.as
 *  author: Jake Barnes
 *  modified: 8-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package screens {
	import flash.events.Event;
	import flash.text.TextFormat;
	import fl.controls.List;
	import fl.controls.TextArea;
	import fl.data.DataProvider;
	
	public class extras_logviewer extends Screen {
		private var log_lst:List;
		private var log_ta:TextArea;
		private const DIVIDE:Number = 180;
		
		public function extras_logviewer () {
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
		}
		
		private function addedToStage (event:Event) {
			var times:Array = new Array();
			for (var i:String in Global.so.data.log) {
				var logDate:Date = new Date(Global.so.data.log[i].time);
				times.push({
					label:logDate.toLocaleString(),
					data:i
			   });
			}
			
			log_lst = new List();
			log_lst.setSize(DIVIDE, stage.stageHeight);
			log_lst.dataProvider = new DataProvider(times);
			log_lst.addEventListener(Event.CHANGE, changeLog);
			addChild(log_lst);
			
			log_ta = new TextArea();
			log_ta.move(DIVIDE, 0);
			log_ta.setSize(stage.stageWidth - log_ta.x, log_ta.height = stage.stageHeight);
			log_ta.setStyle("textFormat", new TextFormat("_typewriter", 12));
			log_ta.editable = false;
			addChild(log_ta);
			
			stage.addEventListener(Event.RESIZE, stageResize);
		}
		
		private function changeLog (event:Event) {
			log_ta.text = Global.so.data.log[event.target.selectedItem.data].text;
		}
		
		private function stageResize (event:Event) {
			log_lst.setSize(DIVIDE, stage.stageHeight);
			log_ta.setSize(stage.stageWidth - DIVIDE, stage.stageHeight);
		}
		
		private function removedFromStage (event:Event) {
			stage.removeEventListener(Event.RESIZE, stageResize);
			log_lst.removeEventListener(Event.CHANGE, changeLog);
			
			removeChild(log_lst);
			log_lst = null;
			removeChild(log_ta);
			log_ta = null;
		}
	}
}