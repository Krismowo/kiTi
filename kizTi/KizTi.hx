package kizTi;
import openfl.Assets;
import openfl.media.Sound;
import openfl.events.Event;

/**
 * ...
 * @author Dazed
 */
class KizTi 
{
	public static var sounds:Array<Sound> = [];
	public static var music:Sound;
	public static var music_looping:Bool = false;

	public static function playMusic(assetpath:String, ?loop:Bool = true, ?loops:Int = 0, ?startTime:Int = 0){
		#if (!html5 && !flash)
		music = Sound.fromFile(assetpath);
		#else
		music = Assets.getMusic(assetpath);
		#end
		if (loop){
			loops = 0;
		}
		music_looping = loop;
		music.play(startTime, loops);
		music.addEventListener(Event.SOUND_COMPLETE, loopmcheck);
	}
	
	private static function loopmcheck(_){
		if (music_looping){
			music.play();
		}else{
			music.removeEventListener(Event.SOUND_COMPLETE, loopmcheck);
		}
	}
	
	public static function playSound(assetpath:String){
		#if (!html5 && !flash)
		var sound = Sound.fromFile(assetpath);
		#else
		var sound = Assets.getSound(assetpath);
		#end
		sound.play();
		sound.addEventListener(Event.SOUND_COMPLETE, function(_){
			sounds.remove(sound);
			sound = null;
		});
		sounds.push(sound);
		return sound;
	}
	
}