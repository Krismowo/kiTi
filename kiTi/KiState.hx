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
	public var mouse:KiMouse;
	var previousTime:Float = 0;
	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE, init);
		mouse = new KiMouse(0, 0);
	}
	
	public function removeEventListeners(){
		removeEventListener(Event.ENTER_FRAME, fe);
		
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_DOWN, kp);
		Lib.current.stage.removeEventListener(KeyboardEvent.KEY_UP, ku);
		
		removeEventListener(MouseEvent.MOUSE_DOWN, old);
		removeEventListener(MouseEvent.RIGHT_MOUSE_DOWN, ord);
		removeEventListener(MouseEvent.MIDDLE_MOUSE_DOWN, omd);
		
		
		removeEventListener(MouseEvent.MOUSE_UP, olu);
		removeEventListener(MouseEvent.RIGHT_MOUSE_UP, oru);
		removeEventListener(MouseEvent.MIDDLE_MOUSE_UP, omu);
		
		removeEventListener(MouseEvent.CLICK, olc);
		removeEventListener(MouseEvent.MIDDLE_CLICK, omc);
		removeEventListener(MouseEvent.RIGHT_CLICK, orc);
		
		removeEventListener(MouseEvent.MOUSE_MOVE, mm);
	}
	
	public function addListeners(){
		addEventListener(Event.ENTER_FRAME, fe);
		
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, kp);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, ku);
		
		addEventListener(MouseEvent.MOUSE_DOWN, old);
		addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, ord);
		addEventListener(MouseEvent.MIDDLE_MOUSE_DOWN, omd);
		
		addEventListener(MouseEvent.MOUSE_UP, olu);
		addEventListener(MouseEvent.MIDDLE_MOUSE_UP, omu);
		addEventListener(MouseEvent.RIGHT_MOUSE_UP, oru);
		
		addEventListener(MouseEvent.CLICK, olc);
		addEventListener(MouseEvent.MIDDLE_CLICK, omc);
		addEventListener(MouseEvent.RIGHT_CLICK, orc);
		
		addEventListener(MouseEvent.MOUSE_MOVE, mm);
	}
	
	public function mm(event:MouseEvent){
		mouse.x = event.localX;
		mouse.y = event.localY;
		onMouseMove(event.localX, event.localY, event);
	}
	
	public function onMouseMove(x:Float, y:Float, event:MouseEvent){
		//ur own shiz here lmfao
	}
	
	public function olc(event:MouseEvent){
		onMouseClick("Left", event);
	}
	
	public function orc(event:MouseEvent){
		onMouseClick("Right", event);
	}
	
	public function omc(event:MouseEvent){
		onMouseClick("Middle", event);
	}
	
	public function old(event:MouseEvent){
		mouse.leftButton = true;
		onMouseDown("Left", event);
	}
	
	public function ord(event:MouseEvent){
		mouse.leftButton = true;
		onMouseDown("Right", event);
	}
	
	public function omd(event:MouseEvent){
		mouse.middleButton = true;
		onMouseDown("Middle", event);
	}
	
	public function olu(event:MouseEvent){
		mouse.leftButton = false;
		OnMouseUp("Left", event);
	}
	
	public function oru(event:MouseEvent){
		mouse.leftButton = false;
		OnMouseUp("Right", event);
	}
	
	public function omu(event:MouseEvent){
		mouse.middleButton = false;
		OnMouseUp("Middle", event);
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
		addListeners();
		create();
	}
	
	public function kp(event:KeyboardEvent){
		var key:String = String.fromCharCode(event.charCode);
		if (event.shiftKey){
			key = key.toUpperCase();
		}else{
			key = key.toLowerCase();
		}
		onKeyPressed(key, event);
	}
	
	public function ku(event:KeyboardEvent){
		var key:String = String.fromCharCode(event.charCode);
		if (event.shiftKey){
			key = key.toUpperCase();
		}else{
			key = key.toLowerCase();
		}
		onKeyUp(key, event);
	}
	
	public function onKeyUp(key:String, event:KeyboardEvent){
		//ur own shiz here lmfao
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
		var currentTime = haxe.Timer.stamp();
		var deltaTime:Float = Std.int((currentTime - previousTime) * 1000) / 1000; //milliseconds difference
		previousTime = currentTime;
		update(deltaTime);
	}
	
	public function update(deltaTime:Float){
		//ur own shiz here lmfao
	}
	
}