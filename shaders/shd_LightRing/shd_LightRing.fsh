// Light Ring Fragment Shader

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 center;
uniform float ratio;


void main()
{
    vec2 p = v_vTexcoord;
    float dist = sqrt(pow(center.x - p.x, 2.0) * pow(ratio, 2.0) + pow(center.y - p.y, 2.0));
    dist = min(pow(dist, 10.0) * pow(10.0, 4.0), 0.1);
    gl_FragColor = v_vColour * mix(texture2D(gm_BaseTexture, p), vec4(0.0, 0.0, 0.0, 1.0), dist);
}