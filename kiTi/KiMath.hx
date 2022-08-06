package kiTi;

/**
 * ...
 * @author Dazed
 */
class KiMath 
{
	public static function randomInt(from:Int, to:Int){
		return from + Math.floor(((to - from + 1) * Math.random()));
	}
	
	public static function randomFloat(from:Float, to:Float){
		return from + ((to - from + 1) * Math.random());
	}
}