function player_state_free() {
	
	var key_left = keyboard_check(ord("A")) or gamepad_axis_value(global.gamepad,gp_axislh) < -0.25;
	var key_right = keyboard_check(ord("D")) or gamepad_axis_value(global.gamepad,gp_axislh) > 0.25;
	var key_jump = keyboard_check_pressed(ord("W")) or gamepad_button_check(global.gamepad,gp_face1);
	var key_dash = keyboard_check_pressed(ord("E")) or gamepad_button_check(global.gamepad,gp_face3);

	
	var move = key_right - key_left != 0;

	vspd += grv; // aplicando a gravidade
	vspd = clamp(vspd, vspd_min, vspd_max); // velocidade maxima que a gravidade pode chegar

	// quando estiver se movendo
	if(move) {
		sprite_index = spr_player_run;
		move_dir = point_direction(0, 0 , key_right - key_left, 0);
		move_spd = approach(move_spd, move_speed_max, acc);
	} else {
		sprite_index = spr_player_idle;
		move_spd = approach(move_spd, 0, dcc);
	}
	can_move = approach(can_move, 0, 0.3);

	if(can_move <= 0) {
		hspd = lengthdir_x(move_spd, move_dir);
	}

	if(hspd != 0) {
		x_scale = sign(hspd);	
	}

	var ground = place_meeting(x, y + 1, obj_wall);
	var wall = place_meeting(x + 1, y, obj_wall_jump) or place_meeting(x - 1, y, obj_wall_jump);
	
	if(wall) {
		if(vspd > 1){
			vspd = 1;
		}
		if(key_jump) {
			coyote_time = 0;
			vspd = 0;
			vspd -= jump_height + 2;
			can_move = 8;
			hspd -= 4 * x_scale;
		}
	}
	
	if(ground) {
		coyote_time = coyote_time_max;
	}else {
		coyote_time--;
		if(vspd < 0) {
			sprite_index = spr_player_jump;
		}else if(vspd > 0) {
				sprite_index = spr_player_fall;
		}
	}

	if(key_jump and coyote_time > 0) {
		coyote_time = 0;
		vspd = 0;
		vspd -= jump_height;
	}
	
	if(key_dash and dash) {
		hspd = 0;
		vspd = 0;
		dash_time = 0;
		dash = false;
		alarm[0] = dash_delay;
		state = state_player_dash;
	}
	
}

function state_player_dash() {
	hspd = lengthdir_x(dash_force, move_dir);
	dash_time = approach(dash_time, dash_distance, 1);
	if(dash_time >= dash_distance) {
		state = player_state_free;
	}
}
