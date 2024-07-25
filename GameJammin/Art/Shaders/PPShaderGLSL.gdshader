shader_type spatial;
render_mode unshaded;

uniform sampler2D screen_texture : source_color, hint_screen_texture, filter_nearest;

uniform float PixelSize : hint_range(6, 40) = 1;
uniform sampler2D vignetteCurve;
uniform sampler2D ColorsCurve : repeat_disable;
const vec2 ScreenRatio = vec2(16, 9);
const vec2 ScreenCenter = vec2(.5,.5);

void vertex() {
	POSITION = vec4(VERTEX, 1.0);
}

void fragment() {
	// Adjust PixelSize to match the screen ratio and normalize SCREEN_UV
	vec2 scaledUV = SCREEN_UV * vec2(PixelSize) * ScreenRatio;
	vec2 PixelUVs = floor(scaledUV) / (vec2(PixelSize) * ScreenRatio);
	
	//make a Vignette MSK
	float Vignette = texture(vignetteCurve, vec2(distance(SCREEN_UV, ScreenCenter), 0.5)).r;

	// Sample the screen texture with the remapped UV coordinates
	vec4 color = texture(screen_texture, PixelUVs);
	
	float albedoR = texture(ColorsCurve, vec2 (color.r, 0.5)).r;
	float albedoG = texture(ColorsCurve, vec2 (color.g, 0.5)).g;
	float albedoB = texture(ColorsCurve, vec2 (color.b, 0.5)).b;
	
	//Set the fragment color
	ALBEDO = vec3(albedoR,albedoG,albedoB)*(Vignette);
	//ALBEDO = vec3(curve(Vignette,0));
}
