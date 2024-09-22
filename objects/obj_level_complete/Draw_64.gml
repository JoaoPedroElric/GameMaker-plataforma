draw_set_font(fnt_complete_lv);
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
var key_reset = keyboard_check_pressed(ord("R")) or gamepad_button_check_pressed(global.gamepad,gp_face1);


var x1 = gui_width / 2;
var y1 = gui_height / 2;

if(global.moeda == 8) {
	draw_text(x1, y1, complete);
}else {
	draw_text(x1, y1, complete1);
}

if(key_reset) {
	room_goto(rm_level_01);
}

draw_set_font(-1);