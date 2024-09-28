event_inherited();


// movimentação
can_move = 0;
move_spd = 0;
move_speed_max = 3.0;
acc = 0.2;
dcc = 0.2;

// pulo
jump_max = 2;
jump_count = jump_max;
jump_height = 5;
coyote_time_max = 6;
coyote_time = 0;

// dash
dash = true;
dash_delay = 60;
dash_force = 9;
dash_time = 0;
dash_distance = 10;

moedas_total = 0;

attack = true;
attack_time = 0;  
attack_delay = 15;  

transicao = false;
transicao_time = 0;
transicao_d = 15;

// estados do player
state = player_state_free;