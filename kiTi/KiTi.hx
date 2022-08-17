package kiTi;
import kiTi.KiSound;

/**
 * ...
 * @author Dazed
 */
class KiTi 
{
	public static var save:KiSave;
	public static var sounds:Array<KiSound> = [];
	public static var music:KiSound;
	public static var game:KiGame;
	
	public static function init(dGame:KiGame){
		if (save == null){
			save = new KiSave();
		}
		game = dGame;
	}

	public static function playMusic(assetpath:String, ?loop:Bool = true, ?loops:Int = 0, ?startTime:Int = 0){
		if (music == null){
			music = new KiSound(assetpath, true);
		}else{
			music.load(assetpath, true);
		}
		if (loop){
			loops = 0;
		}
		music.play(startTime, loop, loops);
	}
	
	public static function playSound(assetpath:String){
		var sound = new KiSound(assetpath, false);
		sound.play(0, false, 0);
		sounds.push(sound);
		return sound;
	}
	
}