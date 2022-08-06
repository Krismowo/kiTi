package kiTi;
import openfl.Assets;
import kiTi.KizSound;
import openfl.media.Sound;
import openfl.events.Event;

/**
 * ...
 * @author Dazed
 */
class KiTi 
{
	public static var sounds:Array<KizSound> = [];
	public static var music:KizSound;

	public static function playMusic(assetpath:String, ?loop:Bool = true, ?loops:Int = 0, ?startTime:Int = 0){
		if (music == null){
			music = new KizSound(assetpath, true);
		}else{
			music.load(assetpath, true);
		}
		if (loop){
			loops = 0;
		}
		music.play(startTime, loop, loops);
	}
	
	public static function playSound(assetpath:String){
		var sound = new KizSound(assetpath, false);
		sound.play(0, false, 0);
		sounds.push(sound);
		return sound;
	}
	
}