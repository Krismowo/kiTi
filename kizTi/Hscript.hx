package kizTi;

import hscript.Interp;
import hscript.Parser;

/**
 * ...
 * @author Dazed
 */
class Hscript 
{
	var interp:Interp;
	var parser:Parser;
	public function new() 
	{
		interp = new Interp();
		parser = new Parser();
		
		
	}
	
}