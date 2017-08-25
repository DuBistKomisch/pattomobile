/**
 *  filename: RandomSeed.as
 *  author: Jake Barnes
 *  modified: 7-JAN-2010
 *  product: Pattomobile II (pm2)
 *  copyright: DBK Software
 *  
 *  Credit To:
 *   - Michael Baczynski, www.polygonal.de
 *   - Noel Billig, www.dncompute.com
 *   - Stephen K. Park and Keith W. Miller
 *   - David G. Carta
 *   - Paul Houle
 */

package {
	public class RandomSeed {
		public static const LIMIT:Number = Math.pow(2, 31) - 1;
		public static const MULTI:Number = 16807
		public static const MBIT:Number = 127773
		public static const ABIT:Number = 32767
		public static const ABIT2:Number = 65535
		public static const DIFF:Number = 2836
		public static const PLIMIT:Number = 233280
		public static const PMULTI:Number = 9301
		public static const PPLUS:Number = 49297
		private static var init:Number
		private static var seed:Number
		private static var algo:Function
	
		public static const DEFAULT = function (seed = null):Number {
			if (seed == null) return LIMIT
			return (seed * MULTI) % LIMIT
		}
	
		public static const PMILLER = function (seed = null):Number {
			if (seed == null) return LIMIT
			var test:Number = MULTI * (seed % MBIT >> 0) - DIFF * (seed / MBIT >> 0)
			return test > 0 ? test : test + LIMIT
		}
	
		public static const DCARTA = function (seed = null):Number {
			if (seed == null) return LIMIT
			var hi:Number = MULTI * (seed >> 16);
			var lo:Number = MULTI * (seed & ABIT2) + ((hi & ABIT) << 16) + (hi >> 15);
			return lo > (LIMIT + 1) ? lo - (LIMIT + 1) : lo
		}
	
		public static const PHOULE = function (seed = null):Number {
			if (seed == undefined) return PLIMIT
			return (seed * PMULTI + PPLUS) % PLIMIT
		}
	
		public static function reseed (initSeed:uint = 1, algorithm:Function = null):uint {
			algo = (algorithm == null) ? DEFAULT : algorithm
			init = seed = initSeed
			return initSeed
		}
		
		private static function gen ():Number {
			seed = algo(seed);
			return seed / algo();
		}
		
		public static function nextFloat ():Number {
			return gen();
		}
		
		public static function nextIntRange (min:Number, max:Number):Number {
			return Math.floor(min + (max - min + 1) * nextFloat());
		}
		
		public static function nextFloatRange (min:Number, max:Number):Number {
			return min + (max - min) * nextFloat();
		}
		
		public static function nextColour ():Number {
			return nextIntRange(0, Math.pow(2, 24) - 1);
		}
		
		public static function nextBoolean ():Boolean {
			return Boolean(nextFloat() < 0.5);
		}
	}
}