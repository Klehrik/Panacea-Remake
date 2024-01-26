// Water Fragment Shader

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;


void main()
{
    vec2 p = v_vTexcoord;
    //float py = p.y;
    p.y = p.y + sin(p.x * 10.0 + time) * 0.01;
    p.y = p.y + sin(p.x * 7.0 - time * 1.4) * 0.01;
    //p.x = p.x + sin(py * 10.0 + time) * 0.01;
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, p);
    //gl_FragColor = vec4(0.0, 0.0, 1.0, 0.6) * texture2D(gm_BaseTexture, p);
}