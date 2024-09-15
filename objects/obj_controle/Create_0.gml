global.gamepad = noone;
gamepad_connect = function() {
	var gamepad_slots = gamepad_get_device_count();
	for( var i = 0; i < gamepad_slots; i++) {
		if(gamepad_is_connected(i)) {
			global.gamepad = i;
			return true;
		}
	}
	return false;
}