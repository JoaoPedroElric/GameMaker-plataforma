draw_sprite(spr_moeda, 0, 15,15);
draw_set_font(fnt_ui);
draw_text(40, 22, string(global.moeda));
draw_text(60, 22, string(global.deads));
draw_set_font(-1);