/**
 *  filename: IGameCharacter.as
 *  author: Jake Barnes
 *  modified: 3/10/2009
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 */

package {
	import flash.geom.Point;
	
	public interface IGameCharacter extends IGameObject {
		function get scroll ():Point;
	}
}