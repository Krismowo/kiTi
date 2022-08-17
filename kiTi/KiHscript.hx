package kiTi;

import haxe.io.Error;
import hscript.Parser;
import hscript.Interp;
import openfl.Assets;

/**
 * ...
 * @author Dazed
 */
using StringTools;
class KiHscript 
{
	public var parser:Parser;
	public var interp:Interp;

	public function new(scriptPath:String = ""){
		parser = new Parser();
		interp = new Interp();
		
		setVar("addChild", KiTi.game.state.addChild);
		setVar("addChildGame", KiTi.game.addChild);
		setVar("KiSprite", KiSprite);
		setVar("KiAssets", KiAssets);
		setVar("KiSound", KiSound);
		setVar("playMusic", KiTi.playMusic);
		setVar("playSound", KiTi.playSound);
		if(scriptPath.replace(" ", "") != ""){
			if (KiAssets.exists(scriptPath)){
				interp.execute(parser.parseString(KiAssets.getText(scriptPath)));
			}else{
				trace("ERROR, COULDNT LOAD THE SCRIPT, (maybe you didnt parse in a correct script path...)");
			}
		}
	}
	
	public function setVar(varibleName:String, varible:Dynamic){
		return interp.variables.set(varibleName, varible);
	}
	
	public function getVar(varibleName:String){
		return interp.variables.get(varibleName);
	}
	
	public function runFunction(functionName:String){
		var func = interp.variables.get(functionName);
		if (func != null){
			return func();
		}
		return null;
	}
	
	public function runScript(scriptPath:String){
		if(scriptPath.replace(" ", "") != ""){
			if (KiAssets.exists(scriptPath)){
				interp.execute(parser.parseString(KiAssets.getText(scriptPath)));
			}else{
				trace("ERROR, COULDNT LOAD THE SCRIPT, (maybe you didnt parse in a correct script path...)");
			}
		}
	}
}