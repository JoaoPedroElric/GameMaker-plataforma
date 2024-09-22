draw_set_font(fnt_complete_lv);
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();

draw_set_halign(fa_center);
draw_set_valign(fa_center);

//draw_set_color(c_white);

var x1 = gui_width / 2;
var y1 = gui_height / 2;
if(global.moeda == 8) {
	draw_text(x1, y1, complete);
}else {
	draw_text(x1, y1, complete1);
}
draw_set_font(-1);