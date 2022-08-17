package kiTi.animation;
import openfl.display.BitmapData;

/**
 * ...
 * @author Dazed
 */
class KiAnimation 
{
	public var frames:Array<BitmapData>;
	public var fps:Int;
	public var playing:Bool;
	public var curframe:Int = 0;
	public var frameTimer:Float = 0;
	public var animationName:String = "";
	public function new(fps:Int, animName:String){
		frames = [];
		this.fps = fps;
		this.playing = false;
		this.animationName = animName;
	}
	
}