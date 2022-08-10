package kiTi;

import openfl.net.SharedObject;
import haxe.io.Error;

/**
 * ...
 * @author Dazed
 */
class KiSave 
{
	public var sharedObject:SharedObject;
	public var data(default, null):Dynamic;
	
	public function new(name:String = "", path:String = ""){
		if(path != ""){
			bind(name, path);
		}else if(name != "") {
			bind(name);
		}else{
			bind("SAVE");
		}
	}
	
	public function bind(?name:String, ?path:String){
		try{
			sharedObject = SharedObject.getLocal(name, path);
			data = sharedObject.data;
		}catch (e:Error){
			trace("ughg");
		}
	}
	
	public function flush(){
		try{
			sharedObject.flush();
		}catch (e:Error){
			trace("ughg");
		}
	}
	
}