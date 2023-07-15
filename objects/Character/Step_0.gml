if (free&&script_execute(get_alive)){
	actor=GetMyActor();
    // Mainly either process player input, random NPC movement, possibly followers
    if (!moving){
		// Battles: movement
		if (actor.target!=Actors.no){	// and not moving - ths is a given (see upper if)
			if (GetMyActor(actor.target).alive){
				var target=GetMyActor(actor.target).alias;	// this looks ridiculous
				var dx=target.xx-xx;
				var dy=target.yy-yy;
				if (abs(dx)+abs(dy)==1){
					// You're adjacent to the target: battle options
					TurnToFace(actor_index, actor.target);
					script_execute(all_races[actor.race].ai);
				} else if (abs(dx)+abs(dy)>32){
					actor.target=Actors.no;
				} else if (abs(dx)+abs(dy)>16){
					// do nothing, you've escaped (for now)
				} else {
					if (irandom(16)==10){
						// Following AI
						mp_grid_clear_cell(World.ai_grid, target.xx, target.yy);
						mp_grid_clear_cell(World.ai_grid, xx, yy);
						path_clear_points(ai_path);
						if (mp_grid_path(World.ai_grid, ai_path, xx, yy, target.xx, target.yy, false)){
							var px=path_get_point_x(ai_path, 1);
							var py=path_get_point_y(ai_path, 1);
							var dpx=px-xx;
							var dpy=py-yy;
							if (abs(dpy)>=abs(dpx)){
								target_y=yy+sign(dpy);
							} else {
								target_x=xx+sign(dpx);
							}
						}
						mp_grid_add_cell(World.ai_grid, target.xx, target.yy);
						mp_grid_add_cell(World.ai_grid, xx, yy);
					}
				}
			} else {
				actor.target=noone;
			}
			// Battles: offense
		} else {
	        script_execute(control_script);
		}
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
        if (is_free(target_x, target_y)&&(is_land(target_x, target_y)||get_waterwalking(actor_index)||!is_land(xx, yy))){
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
	// Death?
	if (actor.required){
		actor.st_act_hp=max(0.1, actor.st_act_hp);
	}
	if (actor.st_act_hp<=0){
		script_execute(death_script);
	}
	// Health, magic and stamina restoration
	var rate_hp=(1+
		// Additives
		get_active_effect_modifier(actor_index, AllEffects.RegenerateHealth)+
		(actor.ethereal?get_active_effect_modifier(actor_index, AllEffects.RegenerateEtherealHealth):0)
		)/_fps*
		// Scalars
		1;
	var rate_mp=(1+
		// Additives
		get_active_effect_modifier(actor_index, AllEffects.RegenerateHealth)+
		(actor.ethereal?get_active_effect_modifier(actor_index, AllEffects.RegenerateEtherealHealth):0)
		)/_fps*
		// Scalars
		1+(GetPerkLevel(actor_index, Perks.Recovery)/100);
	var rate_sp=(1+
		// Additives
		get_active_effect_modifier(actor_index, AllEffects.RegenerateHealth)+
		(actor.ethereal?get_active_effect_modifier(actor_index, AllEffects.RegenerateEtherealHealth):0)
		)/_fps*
		// Scalars
		1+(GetAllLightArmor(actor_index)?GetPerkLevel(actor_index, Perks.WindWalker)/100:0);
	AddHP(actor_index, rate_hp);
	AddMP(actor_index, rate_mp);
	AddSP(actor_index, rate_sp);
	// Alpha for health bar
	if (actor_index!=Actors.playable){
		if (actor.st_act_hp<get_max_hp(actor_index)){
			actor.health_bar_alpha=min(1, actor.health_bar_alpha+0.01);
		} else {
			actor.health_bar_alpha=max(0, actor.health_bar_alpha-0.01);
		}
	}
}