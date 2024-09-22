if(is_dead) {
	var x1 = camera_get_view_x(view_camera[VIEW]);
	var w = camera_get_view_width(view_camera[VIEW]);
	var x2 = x1 + w;
	var meio_w = x1 + w/2;
	var y1 = camera_get_view_y(view_camera[VIEW]);
	var h = camera_get_view_height(view_camera[VIEW]);
	var y2 = y1 + h;
	var meio_h = y1 + h/2;
	
	draw_rectangle(x1, y1 + 20, x2, y1 + 20, false);
}
