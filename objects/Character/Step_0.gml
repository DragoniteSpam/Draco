if (free){
    // Mainly either process player input, random NPC movement, possibly followers
    if (!moving){
        script_execute(control_script);
    }
    
    // Turn to face the direction
    if (xx<target_x){
        direction=Directions.east;
    } else if (xx>target_x){
        direction=Directions.west;
    } else if (yy<target_y){
        direction=Directions.south;
    } else if (yy>target_y){
        direction=Directions.north;
    }
    // The space where you're looking
    switch (direction){
        case Directions.east:
            to_x=xx+1;
            to_y=yy;
            break;
        case Directions.west:
            to_x=xx-1;
            to_y=yy;
            break;
        case Directions.north:
            to_x=xx;
            to_y=yy-1;
            break;
        case Directions.south:
        default:
            to_x=xx;
            to_y=yy+1;
            break;
    }
	var xx_previous=xx;
	var yy_previous=yy;
    // If you have not arrived at destination yet
    if (!(target_x==xx&&target_y==yy)){
        // If the destination is free, go there
        if (is_free(target_x, target_y)&&(is_land(target_x, target_y)||get_waterwalking(Actors.playable)||!is_land(xx, yy))){
            moving=true;
            removeSelfFromGrid();
            xx=clamp(target_x, 0, ds_grid_width(World.grid)-1);
            yy=clamp(target_y, 0, ds_grid_height(World.grid)-1);
            addSelfToGrid();
        // otherwise reset the target
        } else {
            target_x=xx;
            target_y=yy;
        }
    }
    // if you are in the process of moving somewhere
	var is_stopped=!moving;
    if (moving){
        var tx=target_x*32;
        var ty=target_y*32;
        if (abs(tx-x)<=mspd&&abs(ty-y)<=mspd){
            x=tx;
            y=ty;
            moving=false;
			script_execute(control_script_new_cell);
        } else {
            x=x+mspd*sign(tx-x);
            y=y+mspd*sign(ty-y);
            frame=frame+(mspd/2)*3*ANIMATION_CYCLES_PER_SECOND/game_get_speed(gamespeed_fps);
        }
    }
	// Mainly so that the player can pause the game and talk to
    // people and stuff like that (make this a separate if() so that moving=false
	// can potentially be unset first)
	if (!moving){
		if (is_stopped){
			frame=0;
		}
        script_execute(control_script_post);
    }
	if (xx_previous!=xx||yy_previous!=yy){
		last_xx=xx_previous;
		last_yy=yy_previous;
	}
	// Continuous field effects
	var amt=get_active_effect_modifier(actor_index, AllEffects.FieldBurn);
	var _fps=game_get_speed(gamespeed_fps);
	if (amt>0){
		APPLY_FIELD_DAMAGE(actor_index, MagicFlags.fire, amt/_fps);
	}
	var amt=get_active_effect_modifier(actor_index, AllEffects.FieldPoison);
	if (amt>0){
		APPLY_FIELD_DAMAGE(actor_index, MagicFlags.poison, amt/_fps);
	}
}
