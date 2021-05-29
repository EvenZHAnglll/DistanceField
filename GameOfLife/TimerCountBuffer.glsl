#iChannel0 "file://TimerCountBuffer.glsl"

const int f = 5;


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    

    vec2 uv = fragCoord/iResolution.xy;
    
    fragColor = vec4(uv, 1.,1.);

    vec3 col = vec3(.0, .0, .0);
    bool go = false;
    if( iFrame < 10 ){
        // col = vec3(uv,.0);
        col = vec3(.0);
    }else{
        if(uv.x<0.5){
            col = texture(iChannel0,vec2(0.25,0.5)).xyz;
            col += 1./float(f);
            if(col.x>1.){
                col = vec3(.0);
            }
        }else{
            col = texture(iChannel0,vec2(0.75,0.5)).xyz;
            //col = vec3(uv, 0.);
            if (col.x == 0.){col += 0.01;}
            if(texture(iChannel0,vec2(0.25,0.5)).x == 0.){
                col += 0.2;
                if(col.x>1.){
                    col = vec3(.0);
                }
            }
        }
        
    }
    
    fragColor = vec4(col, 1.);

}
