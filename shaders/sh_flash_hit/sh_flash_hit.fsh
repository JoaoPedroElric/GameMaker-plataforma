// sh_flash_hit Fragment Shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float flash; // 0.0 = sem flash, 1.0 = com flash

void main()
{
    vec4 base_color = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;
    
    // Se o flash estiver ativo, modifica a cor para vermelha
    if (flash == 1.0) {
        gl_FragColor = vec4(1.0, 0.0, 0.0, base_color.a); // Vermelho com mesma opacidade
    } else {
        gl_FragColor = base_color; // Desenha normalmente
    }
}
