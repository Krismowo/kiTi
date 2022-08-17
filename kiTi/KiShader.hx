package kiTi;

import openfl.display.Shader;
import openfl.utils.ByteArray;
import openfl.Assets;

#if sys
import sys.FileSystem;
import sys.io.File;
#end

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
			if (vertshaderpath.replace(" ", "") != "" && #if sys FileSystem#else Assets#end .exists(vertshaderpath)){
				glVertexSource = Assets.getText("KITI_STUFF/shaders/vert.vert") + "\n" + #if sys File.getContent #else Assets.getText#end(vertshaderpath);
				trace("got vert shad, applying");
			}else{
				glVertexSource = Assets.getText("KITI_STUFF/shaders/vert.vert") + "\n" + Assets.getText("KITI_STUFF/shaders/default.vert");
			}
		}else{
			glVertexSource = Assets.getText("KITI_STUFF/shaders/vert.vert") + "\n" + Assets.getText("KITI_STUFF/shaders/default.vert");
		}
		if (fragshaderpath != null){
			if(fragshaderpath.replace(" ", "") != "" && #if sys FileSystem#else Assets#end .exists(fragshaderpath)){
				glFragmentSource = Assets.getText("KITI_STUFF/shaders/frag.frag") + "\n" + #if sys File.getContent #else Assets.getText#end(fragshaderpath);
				trace("got frag shad, applying");
			}else{
				glFragmentSource = Assets.getText("KITI_STUFF/shaders/frag.frag") + "\n" + Assets.getText("KITI_STUFF/shaders/default.frag");
			}
		}else{
			glFragmentSource = Assets.getText("KITI_STUFF/shaders/frag.frag") + "\n" + Assets.getText("KITI_STUFF/shaders/default.frag");
		}
		super();
		__isGenerated = false;
		__initGL();
	}
}