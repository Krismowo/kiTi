package kizTi;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.DisplayObjectContainer;
import kizTi.State;
/**
 * ...
 * @author Dazed
 */
class KizTi extends Sprite
{
	public var currentScale:Float;
	public var state:State;
	public var gameWidth:Int;
	public var gameHeight:Int;
	public function new(statee:State, width:Int, height:Int){
		super();
		gameWidth = width;
		gameHeight = height;
		state = statee;
		state.ss = switchState;
		addChild(state);
		addEventListener(Event.ADDED_TO_STAGE, create);
		//var test = new Bitmap(Assets.getBitmapData("assets/img/img.png"));
		//addChild(test);
	}
	
	public function create(_){
		removeEventListener(Event.ADDED_TO_STAGE, create);
		resize(gameWidth, gameHeight);
	}
	
	public function resize(width:Int, height:Int){
		stage.width = width;
		stage.height = height;
	}
	
	public function switchState(state:State){
		removeChild(state);
		state.removeEventListener(Event.ENTER_FRAME, state.update);
		this.state = state;
		state.gameHeight = gameHeight;
		state.gameWidth = gameWidth;
		addChild(state);
	}
	
}