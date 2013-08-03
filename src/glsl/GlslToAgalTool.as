package glsl {

import flash.display.Sprite;
import flash.display3D.Context3DProgramType;

public class GlslToAgalTool extends Sprite{

    public function GlslToAgalTool() {
        super();

        var vertexShaderSource : String = [
        "attribute vec3 position;",
        "attribute vec2 uv;",
        "uniform mat4 proj;",
        "varying vec2 vTexCoord;",
        "void main() {",
            "gl_Position = proj * vec4(position, 1.0);",
            "vTexCoord = uv;",
        "}"
        ].join("\n");

        var compiler : GlslToAgal = new GlslToAgal(vertexShaderSource, Context3DProgramType.VERTEX);
        trace(compiler.compile());
    }
}
}
