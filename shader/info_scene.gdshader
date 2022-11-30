shader_type canvas_item;
uniform sampler2D noise;
const float speed = 4.0;
const float speed2 = 0.7;
void vertex(){
	VERTEX += vec2(sin(TIME*0.5)*40.0,cos(TIME*1.0)*100.0);
}
void fragment() {
	vec4 data = texture(noise , UV);
	vec4 img = texture(TEXTURE, UV);
	vec2 pos = vec2(data.x+sin(TIME*speed2)+0.5, data.y+sin(TIME*speed2)+0.5);
	if(img.a != 0.0){
		COLOR.a = texture(TEXTURE, pos).a;
	}
	
	// Place fragment code here.
}
