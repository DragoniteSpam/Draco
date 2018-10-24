// If you're not moving and hit the Action button
if (free){
	// Talk to thing
	if (!is_free(to_x, to_y)){
		if (Controller.release_a){
		    Controller.release_a=false;
			var s=World.grid[# to_x, to_y];
		    scr_set_scene(s, s.cutscene_index, 0);
		}
	}
	// Attack thing
	if (Controller.release_x){
		Controller.release_x=false;
		OVERWORLD_MELEE();
	}
	// Magicka thing
	if (Controller.release_y){
		Controller.release_y=false;
		OVERWORLD_MAGIC();
	}
	// Pause
	if (Controller.release_b){
	    Controller.release_b=false;
	    pause_game(id);
	}
	// Wait
	if (Controller.release_select){
		Controller.release_select=false;
		set_pause(PauseMenu.wait);
		World.pausing=Player;
		Player.free=false;
		World.pause_greater=PauseWaitScreens.base;
		World.pause_end_action=PauseEndActions.ReturnFromWait;
	}
	// Auto activate
	if (instanceof(World.event[# xx, yy], Event)){
		var e=World.event[# xx, yy];
		scr_set_scene(e, e.cutscene_index, 0);
	}
	// Terrain stuff
	switch (World.terrain[# xx, yy]){
		case Misc.land:		// Nothing
			break;
		case Misc.water:	// Water rings and splashes
			if (Controller.up||Controller.down||Controller.left||Controller.right){
				effect_water_splish(xx, yy);
			}
			break;
	}
}