#iChannel0 "file://TimerCountBuffer.glsl"
#iChannel1 "file://TimerCount.glsl"


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    

    vec2 uv = fragCoord/iResolution.xy;
    vec3 col = texture(iChannel0,uv).xyz;
    if(uv.y>0.9){
        fragColor = vec4(col, 0.);
    }else{
        col = texture(iChannel1,uv).xyz;
        if (texture(iChannel0,vec2(0.75,0.5)).x==0. ){
            col = 1. - col;
        }
        fragColor = vec4( col, 1.);
    }
}
