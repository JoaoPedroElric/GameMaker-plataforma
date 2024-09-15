// velocidade e gravidade
hspd = 0;
vspd = 0;
vspd_min = -7;
vspd_max = 6;
grv = 0.3;

// movimentação
can_move = 0;
move_dir = 0;
move_spd = 0;
move_speed_max = 3.0;
acc = 0.3;
dcc = 0.3;

// pulo
jump_height = 5;
coyote_time_max = 6;
coyote_time = 0;

// dash
dash = true;
dash_delay = 30;
dash_force = 9;
dash_time = 0;
dash_distance = 10;

// escala do player
x_scale = 1;
y_scale = 1;

// estados do player
state = player_state_free;