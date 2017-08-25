/**
 *  filename: levels/test.as
 *  author: Jake Barnes
 *  modified: 5-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import g.art_splash;
	
	public class test extends libLevels {
		public function test () {
			super("Test Levels", "A set of levels to test various game systems.", art_splash);
			include "test/0.as";
			include "test/1.as";
			for (var i:uint = 0; i < length; i++)
				arts.push(this["art"+i]);
			cutscenes[1] = cs1;
			for (i = 0; i <= length; i++)
				if (isCutscene(i))
					cutsceneArts[i] = this["csArt"+i];
		}
	}
}