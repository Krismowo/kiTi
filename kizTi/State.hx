package kizTi;

import openfl.display.Sprite;
import openfl.events.Event;
/**
 * ...
 * @author Dazed
 */
class State extends Sprite 
{
	public var currentScale:Float;
	public var gameWidth:Int;
	public var gameHeight:Int;
	public function new() 
	{
		super();
		addEventListener(Event.ENTER_FRAME, update);
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	public function init(_){
		removeEventListener(Event.ADDED_TO_STAGE, init);
		resize(gameWidth, gameHeight);
		create();
	}
	
	public function create(){
		//ur shit here lmfao
	}
	
	public function resize(width:Int, height:Int){
		stage.width = width;
		stage.height = height;
	}
	
	dynamic public function ss(state:State){
		//shizhere
	}
	
	public function switchState(state:State){
		ss(state);
	}
	
	public function update(elapsed:Dynamic){
		//ur shit here
	}
	
}