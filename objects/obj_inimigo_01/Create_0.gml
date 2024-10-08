event_inherited();
move_spd = 1.10;
move_dir = 1;

state_walk = function() {
	var ground = place_meeting(x,y + 1, obj_wall);
	
	if(ground) {
		hspd = move_dir * move_spd;
		if(hspd != 0) x_scale = sign(hspd);
	}
	
	hspd = move_dir * move_spd;
	if(place_meeting(x + hspd, y, obj_wall)) {
		move_dir *= -1;
	}
	if(!position_meeting(x + (16 * move_dir), y + 1, obj_wall)) {
		move_dir *= -1;
	}
	
}

state = state_walk;