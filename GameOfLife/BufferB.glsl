#iChannel0 "file://BufferB.glsl"
#iChannel1 "file://BufferA.glsl"
#iChannel2 "file://TimerCountBuffer.glsl"
#iChannel0::WrapMode "Repeat"
#iChannel1::WrapMode "Repeat"
#include "//commen.glsl"
#iKeyboard

const int KEY_SPACE  = 32;


bool isInitDraw()
{
    return isKeyDown(KEY_SPACE);
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

    vec2 uv = fragCoord/iResolution.xy;
    vec3 col = vec3(.0);

    if (iFrame <10){
        col = texture(iChannel1, uv).xyz;
    }else{

        col = texture(iChannel0, uv).xyz;
        if ( texture(iChannel2, vec2(0.75,0.5) ).x == 0. ){
            vec4 grid = vec4((floor(uv*girdSize)+0.5)/girdSize,fract(uv*girdSize));
            uv = grid.xy;
            col = vec3(liveOrDead(iChannel0,uv,girdSize));
        }

    }
    

    fragColor = vec4( col, 1.0 );
}



