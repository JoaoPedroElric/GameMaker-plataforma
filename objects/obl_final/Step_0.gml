	var key_confirm = keyboard_check_pressed(ord("E")) or gamepad_button_check(global.gamepad,gp_face1);
	
	if(key_confirm) {
		room_goto(menu);
		global.deads = 0;
		global.moeda_total = 0;
	}