package kiTi.animation;

/**
 * ...
 * @author Dazed
 */
typedef KiJsonAnimInfo ={
	var frames:Array<KiJsonFrameInfo>;
	var meta:KiJsonMeta;
}

typedef  KiJsonFrameInfo = {
	var filename:String;
	var frame:KiJsonFrameSquare;
	var rotated:Bool;
	var trimmed:Bool;
	var spriteSourceSize:KiJsonArea;
}

typedef KiJsonFrameSquare ={
	var x:Int;
	var y:Int;
	var w:Int;
	var h:Int;
}

typedef KiJsonArea = {
	var w:Int;
	var h:Int;
}

typedef KiJsonMeta = {
	var app:String;
	var version:String;
	var image:String;
	var format:String;
	var size:KiJsonArea;
	var scale:String;
}