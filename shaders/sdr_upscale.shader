//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
#ifdef GL_ES
precision mediump float;
#endif

uniform float bitmap_width;
uniform float bitmap_height;
uniform float x_scale;
uniform float y_scale;

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec2 size = vec2(bitmap_width, bitmap_height);
    vec3 stepping = vec3(1.0 / x_scale, 1.0 / y_scale, 0);
    vec2 scale = vec2(x_scale, y_scale);
    
    vec2 pixel = size * v_vTexcoord - stepping.xy / 2.0;
    vec2 corner = floor(pixel) + 1.0;
    vec2 frac = min((corner - pixel) * scale, vec2(1.0, 1.0));

    vec4 c1 = texture2D(gm_BaseTexture, (floor(pixel + stepping.zz) + 0.5) / size);
    vec4 c2 = texture2D(gm_BaseTexture, (floor(pixel + stepping.xz) + 0.5) / size);
    vec4 c3 = texture2D(gm_BaseTexture, (floor(pixel + stepping.zy) + 0.5) / size);
    vec4 c4 = texture2D(gm_BaseTexture, (floor(pixel + stepping.xy) + 0.5) / size);

    c1 *=        frac.x  *        frac.y;
    c2 *= (1.0 - frac.x) *        frac.y;
    c3 *=        frac.x  * (1.0 - frac.y);
    c4 *= (1.0 - frac.x) * (1.0 - frac.y);

    gl_FragColor = v_vColour * (c1 + c2 + c3 + c4);
}
