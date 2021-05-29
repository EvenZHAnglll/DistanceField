#include "//commen.glsl"

bool drawPosition(vec2 uv,vec2 startPosition){
    return roundEqual(uv.x , startPosition.x/girdSize) && roundEqual(uv.y , startPosition.y/girdSize);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

    // float girdSize = 20.;
    vec2 uv = fragCoord/iResolution.xy;
    vec4 grid = vec4(floor(uv*girdSize)/girdSize,fract(uv*girdSize));
    uv = grid.xy;
    
    vec3 col =  vec3(.0);
    
    col = vec3(
        0.2*clamp(
            step(0.48,abs(grid.z-.5))+step(0.48,abs(grid.w-.5)),
            0.,
            1.
        )
    );

    vec2 startPosition = vec2(15.,17.);

    if( roundEqual(uv.x , startPosition.x/girdSize) && uv.y < startPosition.y/girdSize && uv.y > (startPosition.y-3.9)/girdSize){
        col = vec3(1.);
    }


    if( drawPosition(uv,vec2(14,14))){col = vec3(1.);}
    if( drawPosition(uv,vec2(13,15))){col = vec3(1.);}

    if( drawPosition(uv,vec2(16,8))){col = vec3(1.);}
    if( drawPosition(uv,vec2(17,8))){col = vec3(1.);}
    if( drawPosition(uv,vec2(17,7))){col = vec3(1.);}

    if( drawPosition(uv,vec2(15,7))){col = vec3(1.);}
    if( drawPosition(uv,vec2(15,6))){col = vec3(1.);}
    if( drawPosition(uv,vec2(15,5))){col = vec3(1.);}
    if( drawPosition(uv,vec2(14,5))){col = vec3(1.);}

    if( drawPosition(uv,vec2(20,10))){col = vec3(1.);}
    if( drawPosition(uv,vec2(21,11))){col = vec3(1.);}
    if( drawPosition(uv,vec2(21,9))){col = vec3(1.);}
    if( drawPosition(uv,vec2(22,12))){col = vec3(1.);}
    if( drawPosition(uv,vec2(22,8))){col = vec3(1.);}
    if( drawPosition(uv,vec2(23,11))){col = vec3(1.);}
    if( drawPosition(uv,vec2(23,9))){col = vec3(1.);}
    if( drawPosition(uv,vec2(23,10))){col = vec3(1.);}
    if( drawPosition(uv,vec2(24,13))){col = vec3(1.);}
    if( drawPosition(uv,vec2(24,12))){col = vec3(1.);}
    if( drawPosition(uv,vec2(24,8))){col = vec3(1.);}
    if( drawPosition(uv,vec2(24,7))){col = vec3(1.);}

    if( drawPosition(uv,vec2(35,9))){col = vec3(1.);}
    if( drawPosition(uv,vec2(35,10))){col = vec3(1.);}
    if( drawPosition(uv,vec2(36,9))){col = vec3(1.);}
    if( drawPosition(uv,vec2(36,10))){col = vec3(1.);}

    // Output to screen
    fragColor = vec4( col, 1.0 );
}