#iChannel0 "file://subtractPressureGradient.glsl"
#iChannel1 "file://computePressure.glsl"
#iChannel2 "file://advect.glsl"
#iChannel3 "file://diffuse.glsl"



#iChannel0::MinFilter "Nearest"
#iChannel0::MagFilter "Nearest"
#iChannel1::MinFilter "Nearest"
#iChannel1::MagFilter "Nearest"
#iChannel2::MinFilter "Nearest"
#iChannel2::MagFilter "Nearest"
#iChannel3::MinFilter "Nearest"
#iChannel3::MagFilter "Nearest"


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;
    vec3 col = vec3(.0);

    if(uv.x<.5){
        if(uv.y<.5){
            col = texture(iChannel0, uv*2.).xyz;
        }else{
            col = texture(iChannel1, (uv-vec2(.0, .5))*2.).xyz;
        }
    }else{
        if(uv.y<.5){
            col = texture(iChannel2, (uv-vec2(.5, .0))*2.).xyz;
        }else{
            col = texture(iChannel3, (uv-vec2(.5, .5))*2.).xyz;
        }
    }
    
    //vec3 col = texture(iChannel0, uv).xyz;

    // Output to screen
    fragColor = vec4(col,1.0);
}

