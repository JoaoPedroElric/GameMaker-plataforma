
global.deads++;
global.moeda_total = global.moeda_total - global.moeda;
global.moeda = 0;

room_restart(); // Reinicia a room
gamepad_set_colour(global.gamepad, c_blue);
	
// Após reiniciar, crie a segunda transição (saída)
layer_sequence_create("transicao", obj_player.x, obj_player.y, sq_transicao_in);
