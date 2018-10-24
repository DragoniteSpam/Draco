/// @description Creating the grid that rules the game.

ds_grid_clear(grid, noone);
ds_grid_clear(event, noone);
ds_grid_clear(terrain, Misc.land);
ds_grid_clear(lights, noone);

with (Solid){
	addSelfToGrid();
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