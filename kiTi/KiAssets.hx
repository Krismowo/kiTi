package kiTi;

#if sys
import sys.io.File;
import sys.FileSystem;
#end

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.PixelSnapping;
import openfl.media.Sound;
import openfl.display.BitmapData;

/**
 * ...
 * @author Dazed
 */
class KiAssets 
{

	public static function getSound(soundPath:String, isMusic:Bool = false){
		#if sys
		return Sound.fromFile(soundPath);
		#else
		if (isMusic){
			return Assets.getMusic(soundPath);
		}else{
			return Assets.getSound(soundPath);
		}
		#end
	}
	
	public static function getBitmapData(imagePath:String){
		#if sys
		return BitmapData.fromFile(imagePath);
		#else
		return Assets.getBitmapData(imagePath);
		#end
	}
	
	public static function getSprite(imagePath:String, pixelSnapping:PixelSnapping = null, smoothing:Bool = false){
		return new KiSprite(getBitmapData(imagePath), pixelSnapping, smoothing);
	}
	
	public static function exists(filePath:String){
		#if sys
		return FileSystem.exists(filePath);
		#else
		return Assets.exists(filePath);
		#end
	}
	
	public static function getText(filePath:String){
		#if sys
		return File.getContent(filePath);
		#else
		return Assets.getText(filePath);
		#end
	}
	
}