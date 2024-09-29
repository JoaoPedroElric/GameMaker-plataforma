draw_set_font(fnt_menu);
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();


var x1 = gui_width / 2;
var y1 = gui_height / 2;
var margin = 20;

// pegando os valores do mouse na gui
var m_x = device_mouse_x_to_gui(0);
var m_y = device_mouse_y_to_gui(0);

draw_set_halign(fa_center);
draw_set_valign(fa_center);
if(global.deads == 0) {
	draw_text(x1, y1, no_dead);
}else {
	draw_text(x1, y1, dead);
}
draw_text(x1, y1 + margin, coletou);