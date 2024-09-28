
global.deads++;
room_restart(); // Reinicia a room
	
// Após reiniciar, crie a segunda transição (saída)
layer_sequence_create("transicao", obj_player.x, obj_player.y, sq_transicao_in);
