/**
 *  filename: libMenu.as
 *  author: Jake Barnes
 *  modified: 20/6/2009
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import flash.display.Sprite
	
	public class libMenu extends Sprite {
		private var items:Array = [menu_config, menu_extras, menu_play, menu_info, menu_highscores,
								   menu_config_controls, menu_config_output, menu_config_general,
								   menu_extras_cutscenes, menu_extras_skins, menu_extras_stuff,
								   menu_play_new, menu_play_load, menu_play_download,
								   menu_info_credits, menu_info_license, menu_info_contact,
								   menu_highscores_besttimes, menu_highscores_replays, menu_highscores_downloaded,
								   menu_title, menu_subtitle]
		
		public function getItem (id:uint):Sprite {
			if (id > -1 && id < items.length) {
				return new items[id]
			} else {
				DebugConsole.trace("menu item #" + id + " not found in library", 1)
				return new Sprite()
			}
		}
	}
}