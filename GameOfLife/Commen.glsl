const float girdSize = 40.;



bool roundEqual(float a, float b){
    return abs(a-b) < 0.01;
}

float liveOrDead(sampler2D t, vec2 uv , float girdSize){
    float col = texture( t, uv ).x;

    int count = 0;
    for(int i = -1; i < 2; i++){
        for(int j = -1; j < 2; j++){
            vec2 offset = vec2(i,j)*(1./girdSize);
            if( (i != 0 || j != 0) && (texture( t, uv + offset ).x>.5) ){
                count += 1;
            }
                
        }
    }
    if( col > .5){
        if(count>3 || count<2){
            return 0.;
        }else{
            return 1.;
        }
    }else{
        if(count==3){
            return 1.;
        }else{
            return 0.;
        }
        
    }


}


