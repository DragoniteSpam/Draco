/// @description Fired when the player enters a new cell on the board.
function process_player_controls_new_cell() {

	if (instanceof_classic(World.event[# last_xx, last_yy], TerrainTroddable)){
		with (World.event[# last_xx, last_yy]){
			script_execute(code_on_exit);
		}
	}
	if (instanceof_classic(World.event[# target_x, target_y], TerrainTroddable)){
		with (World.event[# target_x, target_y]){
			script_execute(code_on_trod);
		}
	}


}
