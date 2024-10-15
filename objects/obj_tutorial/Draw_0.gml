if(global.sala == 1) {
	if(gamepad_is_connected(global.gamepad)) {
		draw_sprite_ext(spr_tutorial_1_c, get_timer() / 100000, 600, 480, 1, 1, 0, c_white, 1);
	
	}else draw_sprite_ext(spr_tutorial_1, get_timer() / 100000, 600, 480, 1, 1, 0, c_white, 1);
	
}else if(global.sala == 2) {
	if(gamepad_is_connected(global.gamepad)) {
		draw_sprite_ext(spr_tutorial_2_c, get_timer() / 100000, 100, 200, 1, 1, 0, c_white, 1);
	
	}else draw_sprite_ext(spr_tutorial_2, get_timer() / 100000, 100, 200, 1, 1, 0, c_white, 1);
}