package kiTi.animation;
import kiTi.KiPoint;
import openfl.geom.Rectangle;
import openfl.display.BitmapData;

/**
 * ...
 * @author Dazed
 */

 
class KiFrame extends Rectangle
{
	public function new(x:Float = 0, y:Float = 0, width:Float, height:Float){
		super();
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}
	
}