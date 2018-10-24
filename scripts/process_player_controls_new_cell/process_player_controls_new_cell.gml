/// @description Fired when the player enters a new cell on the board.

if (instanceof(World.event[# last_xx, last_yy], TerrainTroddable)){
	with (World.event[# last_xx, last_yy]){
		script_execute(code_on_exit);
	}
}
if (instanceof(World.event[# target_x, target_y], TerrainTroddable)){
	with (World.event[# target_x, target_y]){
		script_execute(code_on_trod);
	}
}