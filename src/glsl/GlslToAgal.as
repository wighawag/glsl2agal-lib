package glsl {

import com.adobe.glsl2agal.CModule;
import com.adobe.glsl2agal.compileShader;

import flash.display3D.Context3DProgramType;

public class GlslToAgal {

    private var optimize : Boolean;
    private var usegles : Boolean;
    private var glslSource : String;
    private var type : String;

    private static var cModuleInitialized : Boolean = false;

    public function GlslToAgal(glslSource : String, type : String, optimize : Boolean = true, usegles : Boolean = true) {
        if(!cModuleInitialized){
            CModule.startAsync();
            cModuleInitialized = true;
        }
        this.type = type;
        this.glslSource = glslSource;
        this.optimize = optimize;
        this.usegles = usegles;
    }

    public function compile() : String{
        try {
            return compileShader(glslSource, (type == Context3DProgramType.VERTEX)  ? 0 : 1, optimize, usegles)
        } catch(e:Error) {
            return null;
        }
        return null;
    }

}
}
