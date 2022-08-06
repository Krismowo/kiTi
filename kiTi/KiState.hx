package kiTi;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;

/**
 * ...
 * @author Dazed
 */
class KiState extends Sprite 
{
	public var currentScale:Float;
	public var gameWidth:Int;
	public var gameHeight:Int;
	public function new() 
	{
		super();
		addEventListener(Event.ENTER_FRAME, frame_enter);
		addEventListener(Event.ADDED_TO_STAGE, init);
		addEventListener(KeyboardEvent.KEY_DOWN, keyPressed);
	}
	
	public function init(_){
		removeEventListener(Event.ADDED_TO_STAGE, init);
		resize(gameWidth, gameHeight);
		create();
	}
	
	public function keyPressed(key:KeyboardEvent){
		//ur own shiz here lmfao
	}
	
	public function create(){
		//ur shit here lmfao
	}
	
	public function resize(newWidth:Int, newHeight:Int){
		stage.width = newWidth;
		stage.height = newHeight;
	}
	
	dynamic public function ss(state:KizState){
		//shizhere
	}
	
	public function switchState(state:KizState){
		ss(state);
	}
	
	public function frame_enter(_){
		update();
	}
	
	public function update(){
		//ur shit here
	}
	
}