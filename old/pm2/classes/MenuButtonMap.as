/**
 *  filename: MenuButtonMap.as
 *  author: Jake Barnes
 *  modified: 5-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	public class MenuButtonMap {
		public static function getMain():Array {
			return [[0, "OPTIONS", 80, 330, 0], [1, "EXTRAS", 190, 400, 1], [2, "PLAY GAME", 320, 360, 2], [3, "INFO", 450, 400, 3], [4, "HIGHSCORES", 560, 330, 4]]
		}
		
		public static function getSub (id:uint):Array {
			switch (id) {
				case 0: return [[5, "CONTROLS", 250, 400, 5], [6, "OUTPUT", 400, 400, 6], [7, "GENERAL", 550, 400, 7]]
				case 1: return [[8, "CUTSCENES", 250, 400, 8], [9, "SKINS", 400, 400, 9], [10, "...STUFF?", 550, 400, 10]]
				case 2: return [[11, "NEW GAME", 250, 400, 11], [12, "LOAD GAME", 400, 400, 12], [13, "DOWNLOAD", 550, 400, 13]]
				case 3: return [[14, "CREDITS", 250, 400, 14], [15, "LICENCE", 400, 400, 15], [16, "CONTACT", 550, 400, 16]]
				case 4: return [[17, "BEST TIMES", 250, 400, 17], [18, "REPLAYS", 400, 400, 18], [19, "DOWNLOADED", 550, 400, 19]]
				default: return new Array()
			}
		}
	}
}