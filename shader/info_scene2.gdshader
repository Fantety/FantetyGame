shader_type canvas_item;
void vertex(){
	VERTEX += vec2(sin(TIME*0.5)*40.0,cos(TIME*1.0)*100.0);
}
void fragment() {
	if(COLOR.a != 0.0){
		COLOR.a = 0.3;
	}
	// Place fragment code here.
}
