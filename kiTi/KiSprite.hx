package kiTi;

import haxe.Json;
import kiTi.animation.KiAnimation;
import kiTi.animation.KiJsonAnimInfo;
import openfl.Lib;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.PixelSnapping;
import kiTi.animation.KiFrame;
import openfl.events.Event;
import openfl.geom.Point;
import openfl.utils.ByteArray;
import lime.ui.FileDialog;
import openfl.display.PNGEncoderOptions;

/**
 * ...
 * @author Dazed
 */
using StringTools;
class KiSprite extends Bitmap 
{
	public var spriteSheet:BitmapData;
	public var animations:Map<String, KiAnimation>;
	public var animationInfo:Map<String, Array<KiFrame>>;
	public var curAnim:KiAnimation;
	var previousTime:Float = 0;
	
	//the code for saveImage isnt mine!!
	//gotten from https://gist.github.com/miltoncandelero/0c452f832fa924bfdd60fe9d507bc581 
	//and imported to da engine cus i can
	public function saveImage(){
		var b:ByteArray = new ByteArray();
		b = bitmapData.encode(bitmapData.rect, new PNGEncoderOptions(true), b);
		new FileDialog().save(b, "png", null, "file");
	}
	
	public function new(bitmapData:BitmapData=null, pixelSnapping:PixelSnapping=null, smoothing:Bool=false){
		super(bitmapData, pixelSnapping, smoothing);
		addEventListener(Event.ENTER_FRAME, enterFrame);
	}
	
	public function loadSheet(sheetBitmapData:BitmapData){
		spriteSheet = sheetBitmapData;
		animations = new Map<String, KiAnimation>();
		animationInfo = new Map<String, Array<KiFrame>>();
	}
	
	public function playAnim(animName:String){
		if (animations.exists(animName)){
			trace("Animation exists, Playing it now");
			curAnim = animations[animName];
			curAnim.playing = true;
		}
	}
	
	public function setAnimFrames(animName:String, animFrames:Array<KiFrame>, fps:Int = 0){
		var curAnim:KiAnimation = new KiAnimation(fps);
		for (i in animFrames){
			var frame:KiFrame = i;
			var expFrame:BitmapData = new BitmapData(Std.int(frame.width), Std.int(frame.height));
			expFrame.copyPixels(spriteSheet, frame, new Point(0, 0));
			curAnim.frames.push(expFrame);
		}
		animations.set(animName, curAnim);
	}
	
	public function setAnim(animName:String, fps:Int, animDataName:String){
		setAnimFrames(animName, animationInfo[animDataName], fps);
	}
	
	public function loadJsonArray(jsonData:String, bitmapData:BitmapData){
		loadSheet(bitmapData);
		var cookedJson:KiJsonAnimInfo = cast Json.parse(jsonData);
		for (frame in cookedJson.frames){
			if (!animationInfo.exists(frame.filename.substring(0,frame.filename.length - 4))){
				animationInfo.set(frame.filename.substring(0,frame.filename.length - 4), []);
			}
			var expFrame = new KiFrame(frame.frame.x, frame.frame.y, frame.frame.w, frame.frame.h);
			animationInfo[frame.filename.substring(0,frame.filename.length - 4)].push(expFrame);
		}
	}
	
	public function enterFrame(event){
		var currentTime = haxe.Timer.stamp();
		var deltaTime:Float = Std.int((currentTime - previousTime) * 1000) / 1000; //milliseconds difference
		previousTime = currentTime;
		update(deltaTime);
	}
	
	public function update(deltaTime:Float){
		if (curAnim != null){
			if (curAnim.playing){
				curAnim.frameTimer += deltaTime;
				if (curAnim.frameTimer > 1.0 / curAnim.fps){
					curAnim.frameTimer = 0;
					curAnim.curframe += 1;
					if (curAnim.curframe > curAnim.frames.length - 1){
						curAnim.curframe = 0;
						curAnim.frameTimer = 0;
					}
					if(bitmapData != curAnim.frames[curAnim.curframe]){
						set_bitmapData(curAnim.frames[curAnim.curframe]);
					}
				}
			}
		}
	}
	
}