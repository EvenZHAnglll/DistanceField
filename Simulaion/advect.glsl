#iKeyboard
#iChannel0 "file://subtractPressureGradient.glsl"

const int KEY_SPACE  = 32;
 

bool isInitDraw()
{
    return isKeyDown(KEY_SPACE);
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    vec2 ps = 1./iResolution.xy;
    
    vec3 col = vec3(.0);
    
    if(isInitDraw()){
    
        uv = abs(uv - 0.5);
        col = vec3(smoothstep( 0.201, 0.2, uv.x)*smoothstep( 0.201, 0.2, uv.y));
        
    }else{
        
        


        // Gauss
        for(int i = -1; i < 2; i++){
            for(int j = -1; j < 2; j++){
                vec2 offset = vec2(i,j)*ps;
                col += texture(iChannel0, uv + offset).xyz;
            }
        }

        col = col/9.;
    }
    
    fragColor = vec4(col,1.0);
}
