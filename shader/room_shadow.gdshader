shader_type canvas_item;

uniform sampler2D alphaImg;
uniform float alpha:hint_range(0,1);
void fragment() {
	vec4 data = texture(alphaImg, UV);
	COLOR.a = data.a*alpha;
	// Place fragment code here.
}
