vspd = move_dir * move_spd;

if(place_meeting(x, y + sign(vspd), obj_wall)){
	move_dir *= -1;
}

var colision = place_meeting(x, y + 1, obj_player) or place_meeting(x, y -1, obj_player);

if(colision) {
	with(obj_player) {
		y += other.vspd;
	}
}

y += vspd;