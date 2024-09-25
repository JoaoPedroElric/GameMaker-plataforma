draw_sprite(spr_moeda, 0, 15,15);
draw_set_font(fnt_ui);
var obj = 1;
draw_text(40, 22, string(global.moeda));
draw_set_font(-1);