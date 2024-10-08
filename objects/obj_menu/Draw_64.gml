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

for(var i = 0; i < op_max; i++) {
	var y2 = y1 + (margin * i);
	// caixa de colisão pro texto
	var string_w = string_width(options[i]);
	var string_h = string_height(options[i]);
	
	// mouse
	if(point_in_rectangle(m_x, m_y, x1 - string_w / 2, y2 - string_h / 2, x1 + string_w / 2, y2 + string_h / 2)) {
		draw_set_color(c_red);
		index = i;
		if(mouse_check_button_pressed(mb_left)) {
			if(index == 0) {
				room_goto(rm_level_01);
			}
			else if(index == 1) {
			// nada ainda
			}
			else if(index == 2) {
				game_end();
			}
		}
	}else {
		draw_set_color(c_white);
	}

	// teclado
	if(index == i){
		draw_set_color(c_red);		
	}else {
		draw_set_color(c_white);			
	}
	
	draw_text(x1, y2, options[i]);	
}

draw_set_font(-1);