draw_sprite_ext(spr_moeda_ui, get_timer() / 100000 , 15, 15, 1, 1, 0, c_white, 1);
draw_set_font(fnt_ui);
draw_text(40, 22, string(global.moeda_total));
draw_text(60, 22, string(global.deads));
draw_set_font(-1);