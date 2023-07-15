///	@description	Create a Conjouration burst. Also creates a conjouration character, if the space is free.
///	@param	cellX
///	@param	cellY
///	@param	[duration]
function mo_conjour() {

	var xxa=argument[0]*GRID_CELL_WIDTH;
	var yya=argument[1]*GRID_CELL_HEIGHT;
	var xx=xxa+GRID_CELL_WIDTH/2;
	var yy=yya+GRID_CELL_HEIGHT/2;
	var fire_time=30;
	switch (argument_count){
		case 3:
			fire_time=argument[2];
			break;
	}

	var emitter=animation_conjouration(xx, yy, fire_time);

	var target=World.grid[# argument[0], argument[1]];
	if (target==noone){
		var actorc1=GetMyActor(Actors.conjouration1);
		var actorc2=GetMyActor(Actors.conjouration2);
		var alias=noone;
		if (actorc1.alias==noone){
			actorc1.alias=instance_create_depth(xxa, yya, Player.depth, CharacterConjoured);
			actorc1.alias.actor_index=Actors.conjouration1;
			alias=actorc1.alias;
		} else if (actorc2.alias==noone/*&&HasPerk(actor_index, Perks.TwinSouls)*/){
			actorc2.alias=instance_create_depth(xxa, yya, Player.depth, CharacterConjoured);
			actorc2.alias.actor_index=Actors.conjouration2;
			alias=actorc2.alias;
		} else {
			with (actorc1.alias){
				instance_destroy();
			}
			actorc1.alias=instance_create_depth(xxa, yya, Player.depth, CharacterConjoured);
			actorc1.alias.actor_index=Actors.conjouration1;
			alias=actorc1.alias;
		}
		alias.owner=actor_index;
		alias.xx=alias.x div GRID_CELL_WIDTH;
		alias.yy=alias.y div GRID_CELL_HEIGHT;
		with (alias){
			addSelfToGrid();
		}
	}

	return emitter;


}
