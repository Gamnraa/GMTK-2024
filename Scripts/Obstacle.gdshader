shader_type canvas_item;

uniform int color = 0;

void fragment() {
	COLOR = texture(TEXTURE, UV);
	if (color == 0) {
		COLOR.r = 1.0;
	}
	if (color == 1) {
		COLOR.g = 1.0;
	}
	if (color == 2) {
		COLOR.b = 1.0;
	}
	if (color == 3) {
		COLOR.r = 1.0;
		COLOR.g = 1.0;
	}
}
