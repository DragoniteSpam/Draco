var player=GetMyActor(actor_index);
if (player.equip_spell!=noone){
	if (!is_free(player.alias.to_x, player.alias.to_y)){
		var s=World.grid[# player.alias.to_x, player.alias.to_y];
		with (s){
			script_execute(react_to_magic, player.equip_spell, player.alias.to_x, player.alias.to_y);
		}
	}
	// This is probably for animation purposes but it can be for other things, too
	script_execute(World.all_magic[player.equip_spell].use_script_overworld, to_x, to_y);
}