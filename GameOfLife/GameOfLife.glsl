#iChannel0 "file://BufferB.glsl"

#iChannel0::MinFilter "Nearest"
#iChannel0::MagFilter "Nearest"
#iChannel0::WrapMode "Repeat"

#include "//commen.glsl"


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    

    vec2 uv = fragCoord/iResolution.xy;
    vec4 grid = vec4(floor(uv*girdSize)/girdSize,fract(uv*girdSize));

    //uv = (floor(uv*girdSize)+0.5)/girdSize;

    vec3 col = vec3(.0);
    
    col =  texture( iChannel0, uv).xyz;

    col += vec3(
        0.2*clamp(
            step(0.48,abs(grid.z-.5))+step(0.46,abs(grid.w-.5)),
            0.,
            1.
        )
    );
 
    // Output to screen
    fragColor = vec4( col, 1.0 );
}