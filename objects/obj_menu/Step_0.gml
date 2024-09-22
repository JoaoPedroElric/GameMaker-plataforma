var key_menu_up = keyboard_check_pressed(ord("W")) or gamepad_button_check_pressed(global.gamepad, gp_padu);
var key_menu_down = keyboard_check_pressed(ord("S")) or gamepad_button_check_pressed(global.gamepad, gp_padd);
var key_menu_select = keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(global.gamepad, gp_face1);;

if(key_menu_down) {
	index++;
}else if(index > op_max - 1) {
	index = 0;
}

if(key_menu_up) {
	index--;
}else if(index < 0) {
	index = op_max -1;
}

if(key_menu_select) {
	
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

		