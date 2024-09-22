
function player_state_free() {
	
	var key_left = keyboard_check(ord("A")) or gamepad_axis_value(global.gamepad,gp_axislh) < -0.25;
	var key_right = keyboard_check(ord("D")) or gamepad_axis_value(global.gamepad,gp_axislh) > 0.25;
	var key_jump = keyboard_check_pressed(ord("W")) or gamepad_button_check_pressed(global.gamepad,gp_face1);
	var key_dash = keyboard_check_pressed(ord("E")) or gamepad_button_check(global.gamepad,gp_face4);
	var key_attack = keyboard_check_pressed(ord("J")) or gamepad_button_check(global.gamepad,gp_face3);
	
	
	var move = key_right - key_left != 0;

	// quando estiver se movendo
	if(move) {
		sprite_index = spr_player_run;
		move_dir = point_direction(0, 0 , key_right - key_left, 0);
		move_spd = approach(move_spd, move_speed_max, acc);
	} else {
		sprite_index = spr_player_idle;
		move_spd = approach(move_spd, 0, dcc);
	}
	can_move = approach(can_move, 0, 0.5);

	if(can_move <= 0) {
		hspd = lengthdir_x(move_spd, move_dir);
	}

	if(hspd != 0) {
		x_scale = sign(hspd);	
	}

	var ground = place_meeting(x, y + 1, obj_wall);
	var wall = place_meeting(x + 1, y, obj_wall_jump) or place_meeting(x - 1, y, obj_wall_jump);
	
	if(wall and !ground) {
		if(vspd > 1){
			jump_count = jump_max;
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
	// tocar no chão
	if(ground) {
		jump_count = jump_max;
		coyote_time = coyote_time_max;
	}else {
		coyote_time--;
		if(vspd < 0) {
			sprite_index = spr_player_jump;
		}else if(vspd > 0) {
				sprite_index = spr_player_fall;
		}
	}
	
	// pular
	if(key_jump and coyote_time > 0 or key_jump and jump_count > 0) {
		jump_count--;
		coyote_time = 0;
		vspd = 0;
		vspd -= jump_height;
	}
	
	if(key_dash and dash) {
		
		dash_time = 0;
		dash = false;
		alarm[0] = dash_delay;
		state = player_state_dash;
	}
	
	// atacando
	if(key_attack and attack) {
		image_index = 0;
		attack_time = 0;
		attack = false;
		//can_move = 3;
		alarm[1] = attack_delay;
		state = player_state_attack;
		
	}
	
	var collision_enemy = instance_place(x, y, obj_enemy_parent);
	if(collision_enemy) {
		state = player_state_damage;	
	}
	
}

// dando dash
function player_state_dash() {
	hspd = lengthdir_x(dash_force, move_dir);
	dash_time = approach(dash_time, dash_distance, 1);
	if(dash_time >= dash_distance) {
		state = player_state_free;
	}
}

// atacando
function player_state_attack() {
	hspd = 0;
    sprite_index = spr_player_attack_1;
    var sword_hitbox = noone;
	attack_time = approach(attack_time, attack_delay,0.4);
	
	if(sword_hitbox == noone) {
		if(x_scale == 1) { // Ataque para a direita
			sword_hitbox = instance_create_layer(x + 8, y, layer, obj_sword_hb);
		} else { // Ataque para a esquerda
			sword_hitbox = instance_create_layer(x - 20, y, layer, obj_sword_hb);
		}
	}

	if(image_index >= image_number - 1) {  
        state = player_state_free;
	} 
}

function player_state_damage() {
	instance_destroy();
	global.moeda = 0;
	room_restart();
	
}