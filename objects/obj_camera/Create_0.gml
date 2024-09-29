global.view_target = obj_player;
window_set_fullscreen(true);

x_to = noone;
y_to = noone;
shake_length = 5;
shake_time = 0;

var new_width = 1920; 
var new_height = 1080; 

window_set_size( VIEW_WIDTH * VIEW_SCALE, VIEW_HEIGHT * VIEW_SCALE);
surface_resize(application_surface,VIEW_WIDTH * VIEW_SCALE, VIEW_HEIGHT * VIEW_SCALE);
display_set_gui_size(GUI_WIDTH,GUI_HEIGHT);
alarm[0] = 1;