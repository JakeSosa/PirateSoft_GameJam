shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx;

uniform float TilingScale = 1;
uniform sampler2D BC : source_color;
instance uniform vec4 GlowColor : source_color = vec4(1.000000, 1.000000, 1.000000, 1.000000);
uniform sampler2D GlowDecal : repeat_disable;
uniform float GlowSTR = 1;
uniform sampler2D NRM : hint_normal;



void fragment() {
// Input:4
	vec2 n_out4p0 = UV;


// FloatParameter:7
	float n_out7p0 = TilingScale;


// VectorOp:8
	vec2 n_out8p0 = n_out4p0 * vec2(n_out7p0);


	vec4 n_out2p0;
// Texture2D:2
	n_out2p0 = texture(BC, n_out8p0);


// ColorParameter:14
	vec4 n_out14p0 = GlowColor;


	vec4 n_out11p0;
// Texture2D:11
	n_out11p0 = texture(GlowDecal, n_out4p0);


// Mix:13
	vec3 n_out13p0 = mix(vec3(n_out2p0.xyz), vec3(n_out14p0.xyz), vec3(n_out11p0.xyz));


// VectorOp:15
	vec3 n_out15p0 = vec3(n_out11p0.xyz) * vec3(n_out14p0.xyz);


// FloatParameter:17
	float n_out17p0 = GlowSTR;


// VectorOp:16
	vec3 n_out16p0 = n_out15p0 * vec3(n_out17p0);


	vec4 n_out3p0;
// Texture2D:3
	n_out3p0 = texture(NRM, n_out8p0);


// Output:0
	ALBEDO = n_out13p0;
	EMISSION = n_out16p0;
	NORMAL_MAP = vec3(n_out3p0.xyz);


}
