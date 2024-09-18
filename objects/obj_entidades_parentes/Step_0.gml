vspd += grv; // aplicando a gravidade
vspd = clamp(vspd, vspd_min, vspd_max); // velocidade maxima que a gravidade pode chegar