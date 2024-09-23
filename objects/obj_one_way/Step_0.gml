if(instance_exists(obj_player)) {

	if(bbox_bottom >= obj_player.bbox_bottom) {
		sprite_index = spr_one_way;
	}else {
		sprite_index = -1;
	}
	with(obj_player) {
		var key_down = keyboard_check(ord("S")) or gamepad_axis_value(global.gamepad, gp_axislv);
		if(key_down) {
			other.sprite_index = -1;	
		}
	}
}