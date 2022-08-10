package kiTi;

import openfl.display.Shader;
import openfl.utils.ByteArray;
import openfl.Assets;

/**
 * ...
 * @author Dazed
 */
using StringTools;
class KiShader extends Shader
{
	public function new(fragshaderpath:String, vertshaderpath:String = "")
	{
		if (vertshaderpath != null){
			if (vertshaderpath.replace(" ", "") != ""){
				glVertexSource += Assets.getText("KITI_STUFF/shaders/vert.vert") + "\n" + Assets.getText(vertshaderpath);
				trace("got vert shad, applying");
			}
		}
		if (fragshaderpath != null){
			if(fragshaderpath.replace(" ", "") != ""){
				glFragmentSource = Assets.getText("KITI_STUFF/shaders/frag.frag") + "\n" + Assets.getText(fragshaderpath);
				trace("got frag shad, applying");
			}
		}
		super();
		__isGenerated = false;
		__initGL();
	}
}