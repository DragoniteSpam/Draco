/// @description Creating the grid that rules the game.

// AI stuff.

if (ai_grid!=noone){
	mp_grid_destroy(ai_grid);
}
ai_grid=mp_grid_create(0, 0, room_width div GRID_CELL_WIDTH, room_height div GRID_CELL_HEIGHT, 1, 1);

// Other grids.

ds_grid_clear(grid, noone);
ds_grid_clear(event, noone);
ds_grid_clear(terrain, Misc.land);
ds_grid_clear(lights, noone);

with (Solid){
	if (script_execute(get_alive)){
		addSelfToGrid();
	}
	if (actor_index!=Actors.no){
		RegisterMyActor();
	}
}

with (Event){
	addSelfToEvent();
	if (actor_index!=Actors.no){
		RegisterMyActor();
	}
}

with (TerrainTroddable){
	addSelfToEvent();
	if (actor_index!=Actors.no){
		RegisterMyActor();
	}
}

with (Water){
	addSelfToTerrain(Misc.water);
	instance_destroy();
}

with (SolidLight){
	addSelfToLight();
}

with (NonSolidLight){
	addSelfToLight();
}

for (var i=0; i<ds_list_size(battle_spawned); i++){
	with (battle_spawned[| i]){
		instance_destroy();
	}
}

ds_list_clear(battle_spawned);