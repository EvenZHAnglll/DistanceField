#include "//commen.glsl"

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
    if( roundEqual( uv.x, (startPosition.x+1.)/girdSize )  && roundEqual(uv.y , (startPosition.y-3.)/girdSize)){
        col = vec3(1.);
    }
    if( roundEqual(uv.x, (startPosition.x+2.)/girdSize) && roundEqual(uv.y , (startPosition.y-2.)/girdSize)){
        col = vec3(1.);
    }

    startPosition = vec2(35.,27.);

    if( roundEqual(uv.x , startPosition.x/girdSize) && uv.y < startPosition.y/girdSize && uv.y > (startPosition.y-3.9)/girdSize){
        col = vec3(1.);
    }
    if( roundEqual( uv.x, (startPosition.x+1.)/girdSize )  && roundEqual(uv.y , (startPosition.y-3.)/girdSize)){
        col = vec3(1.);
    }
    if( roundEqual(uv.x, (startPosition.x+2.)/girdSize) && roundEqual(uv.y , (startPosition.y-2.)/girdSize)){
        col = vec3(1.);
    }
    
    startPosition = vec2(5.,12.);
    if( roundEqual(uv.x , startPosition.x/girdSize) && uv.y < startPosition.y/girdSize && uv.y > (startPosition.y-5.9)/girdSize){
        col = vec3(1.);
    }
    // if( roundEqual( uv.x, (startPosition.x+1.)/girdSize )  && roundEqual(uv.y , (startPosition.y-3.)/girdSize)){
    //     col = vec3(1.);
    // }
    // if( roundEqual(uv.x, (startPosition.x+2.)/girdSize) && roundEqual(uv.y , (startPosition.y-2.)/girdSize)){
    //     col = vec3(1.);
    // }

    startPosition = vec2(25.,22.);
    if( roundEqual(uv.x , startPosition.x/girdSize) && uv.y < startPosition.y/girdSize && uv.y > (startPosition.y-16.9)/girdSize){
        col = vec3(1.);
    }

    // Output to screen
    fragColor = vec4( col, 1.0 );
}