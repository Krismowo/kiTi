package kiTi;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.ui.Mouse;
import openfl.Lib;

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
		addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	public function removeEventListeners(){
		removeEventListener(Event.ENTER_FRAME, fe);
		
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, kp);
		
		removeEventListener(MouseEvent.MOUSE_DOWN, old);
		removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, ord);
		removeEventListener(MouseEvent.MOUSE_UP, olu);
		removeEventListener(MouseEvent.RIGHT_MOUSE_UP, oru);
		
		removeEventListener(MouseEvent.CLICK, olmc);
		removeEventListener(MouseEvent.RIGHT_CLICK, ormc);
		
		removeEventListener(MouseEvent.MOUSE_MOVE, mm);
	}
	
	public function addListeners(){
		addEventListener(Event.ENTER_FRAME, fe);
		
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, kp);
		
		addEventListener(MouseEvent.MOUSE_DOWN, old);
		addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, ord);
		addEventListener(MouseEvent.MOUSE_UP, olu);
		addEventListener(MouseEvent.RIGHT_MOUSE_UP, oru);
		
		addEventListener(MouseEvent.CLICK, olmc);
		addEventListener(MouseEvent.RIGHT_CLICK, ormc);
		
		addEventListener(MouseEvent.MOUSE_MOVE, mm);
	}
	
	public function mm(event:MouseEvent){
		onMouseMove(event.localX, event.localY, event);
	}
	
	public function onMouseMove(x:Float, y:Float, event:MouseEvent){
		//ur own shiz here lmfao
	}
	
	public function olmc(event:MouseEvent){
		onMouseClick("Left", event);
	}
	
	public function ormc(event:MouseEvent){
		onMouseClick("Right", event);
	}
	
	public function old(event:MouseEvent){
		onMouseDown("Left", event);
	}
	
	public function ord(event:MouseEvent){
		onMouseDown("Right", event);
	}
	
	public function olu(event:MouseEvent){
		OnMouseUp("Left", event);
	}
	
	public function oru(event:MouseEvent){
		OnMouseUp("Right", event);
	}
	
	public function onMouseClick(button:String, event:MouseEvent){
		//ur own shiz here lmfao
	}
	
	public function onRightMouseClick(button:String, event:MouseEvent){
		//ur own shiz here lmfao
	}
	
	public function onMouseDown(button:String, event:MouseEvent){
		//ur own shiz here lmfao
	}
	
	public function OnMouseUp(button:String, event:MouseEvent){
		//ur own shiz here lmfao
	}
	
	public function init(_){
		removeEventListener(Event.ADDED_TO_STAGE, init);
		resize(gameWidth, gameHeight);
		create();
		addListeners();
	}
	
	public function kp(event:KeyboardEvent){
		trace("keydown");
		var key:String = String.fromCharCode(event.charCode);
		if (event.shiftKey){
			key = key.toUpperCase();
		}else{
			key = key.toLowerCase();
		}
		onKeyPressed(key, event);
	}
	
	public function onKeyPressed(key:String, event:KeyboardEvent){
		//ur own shiz here lmfao
	}
	
	public function create(){
		//ur own shiz here lmfao
	}
	
	public function resize(newWidth:Int, newHeight:Int){
		stage.width = newWidth;
		stage.height = newHeight;
	}
	
	dynamic public function ss(state:KiState){
		//shizhere
	}
	
	public function switchState(state:KiState){
		ss(state);
	}
	
	public function fe(event:Event){
		update();
	}
	
	public function update(){
		//ur own shiz here lmfao
	}
	
}