package kiTi;

import openfl.events.Event;
import openfl.media.Sound;
import openfl.Assets;
import openfl.media.SoundChannel;
import openfl.media.SoundTransform;

/**
 * ...
 * @author Dazed
 */
class KiSound{
	public var paused:Bool;
	public var looping:Bool;
	public var sound:Sound; //the actual sound cus idk how to do thu extending lmao
	private var _channel:SoundChannel;//feel free to like, throw in a git commit or smth to make it extend sound ig
	private var _timepaused:Float;
	private var startTime:Float; //future maybe needed idk
	public var restartAtTime:Bool = false;
	
	public function new(asset:Dynamic = null, ismusic:Bool = false){
		sound = new Sound();
		paused = true;
		if (asset != null){
			load(asset, ismusic);
		}
		
	}
	
	public function play(startTime:Float = 0, loop:Bool = false, loops:Int = 0){
		if (loop){
			loops = 0;
		}
		this.startTime = startTime;
		looping = loop;
		_channel = sound.play(startTime, loops);
		paused = false;
		if (looping){
			trace("listening out for ending of song");
			_channel.addEventListener(Event.SOUND_COMPLETE, loopstuff);
		}
	}
	
	public function pause(){
		if (_channel != null){
			_timepaused = _channel.position;
			_channel.removeEventListener(Event.SOUND_COMPLETE, loopstuff);
			_channel.stop();
			_channel = null;
		}
		paused = true;
	}
	
	public function getTime(){
		if (_channel != null){
			return _channel.position;
		}
		return 0;
	}
	
	public function resume(){
		paused = false;
		_channel = sound.play(_timepaused);
	}
	
	public function load(asset:Dynamic, ismusic:Bool = true){
		if (Type.getClass(asset) == Sound){
			trace("mhm?");
			trace("sound!");
			sound = asset;
		}else if (Type.getClass(asset) == String){
			#if (!html5 && !flash)
			sound = Sound.fromFile(asset);
			#else
			if (ismusic){
				sound = Assets.getMusic(asset);	
			}else{
				sound = Assets.getSound(asset);
			}
			#end
		}
	}
	
	//this is here so we get da funny looping stuff working lmao
	//cus i dont think it has infinite looping iirc
	//correct me if im wrong and throw me a pull req
	public function loopstuff(?_){
		_channel.removeEventListener(Event.SOUND_COMPLETE, loopstuff);
		trace("song ended, replaying i think");
		if (looping){
			if (restartAtTime){
				_channel = sound.play(startTime);
			}else{
				_channel = sound.play(0);
			}
			_channel.addEventListener(Event.SOUND_COMPLETE, loopstuff);
			//sound.addEventListener(Event.SOUND_COMPLETE, loopstuff);
		}else{
			_channel = null;
			_timepaused = 0;
		}
	}
	
}