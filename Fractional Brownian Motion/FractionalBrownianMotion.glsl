#iChannel0 "file://NoiseTexture.jpg"


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy * 0.3;

    float t = iTime * 0.2;
    // Random Direction
    vec2 RD = vec2(sin(.3*t),sin(.456*t));
    vec2 RD2 = vec2(sin(.4*t),sin(.678*t));
    vec2 RD3 = vec2(sin(.6*t),sin(.432*t));

    
    
    // FBM
    vec3 col =  
    texture( iChannel0, 
        uv + texture( iChannel0, 
            uv + texture( iChannel0, 
                uv + texture( iChannel0, uv * 0.5 * sin(iTime*.05)
                ).xy * 0.5 * RD
            ).xy * 0.5 * RD2
        ).xy * 0.5 * RD3
    ).xyz;

    // Output to screen
    fragColor = vec4( col, 1.0 );
}

