package kiTi;
import lime.app.Application;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.DisplayObjectContainer;
import kiTi.KiState;
import openfl.Lib;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.events.KeyboardEvent;

/**
 * ...
 * @author Dazed
 */
class KiGame extends Sprite
{
	public var currentScale:Float;
	public var state:KiState;
	public var gameWidth:Int;
	public var gameHeight:Int;
	public function new(statee:KiState, width:Int, height:Int){
		super();
		gameWidth = width;
		gameHeight = height;
		state = statee;
		state.ss = switchState;
		addChild(state);
		addEventListener(Event.ADDED_TO_STAGE, create);
	}
	
	public function create(_){
		removeEventListener(Event.ADDED_TO_STAGE, create);
		resize(gameWidth, gameHeight);
		stage.addEventListener(Event.RESIZE, onResize);
	}
	
	public function onResize(_){
		var stageScaleX:Float = Application.current.window.width / gameWidth;
		var stageScaleY:Float = Application.current.window.height / gameHeight;
		scaleX = stageScaleX;
		scaleY = stageScaleY;
	}
	
	public function resize(newWidth:Int, newHeight:Int){
		stage.width = newWidth;
		stage.height = newHeight;
	}
	
	public function switchState(state:KiState){
		removeChild(state);
		state.removeEventListeners();
		this.state = state;
		state.ss = switchState;
		state.gameHeight = gameHeight;
		state.gameWidth = gameWidth;
		addChild(state);
	}
	
}