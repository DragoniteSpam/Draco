var player=GetMyActor(actor_index);
swinging=player.alias.direction;
if (!is_free(player.alias.to_x, player.alias.to_y)){
	var s=World.grid[# player.alias.to_x, player.alias.to_y];
	with (s){
		script_execute(react_to_attack, player.alias.to_x, player.alias.to_y);
	}
}