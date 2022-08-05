package kizTi;
import lime.app.Application;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.DisplayObjectContainer;
import kizTi.State;
import openfl.Lib;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
/**
 * ...
 * @author Dazed
 */
class KizGame extends Sprite
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
		trace(gameWidth);
		trace(gameHeight);
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
	
	public function switchState(state:State){
		removeChild(state);
		state.removeEventListener(Event.ENTER_FRAME, state.update);
		this.state = state;
		state.gameHeight = gameHeight;
		state.gameWidth = gameWidth;
		addChild(state);
	}
	
}