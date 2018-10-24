var x1=0;
var y1=H*3/4;
var x2=W;
var y2=H;
var border_width=2;
var player=GetMyActor(Actors.playable);

var opponents=[];
var teammates=[];
for (var i=0; i<32; i++){
	if (battlers[i]!=Actors.no){
		battlers[i].st_vis_hp=lerp(battlers[i].st_vis_hp, battlers[i].st_act_hp, 0.05);
		battlers[i].st_vis_mp=lerp(battlers[i].st_vis_mp, battlers[i].st_act_mp, 0.05);
		battlers[i].st_vis_sp=lerp(battlers[i].st_vis_sp, battlers[i].st_act_sp, 0.05);
		battlers[i].alpha=lerp(battlers[i].alpha, battlers[i].target_alpha, 0.05);
		if (battlers[i].side==Misc.side_opponent){
			opponents[array_length_1d(opponents)]=battlers[i];
		} else {
			teammates[array_length_1d(teammates)]=battlers[i];
		}
	}
}

// Draw the battlers
// @todo draw sprite with proper graphics settings (blue transparency for ghosts comes to mind)
var base_x=W*2/3;
var base_y=H/2-192;
var size=array_length_1d(opponents);
var start_x=base_x-64-64*size;
for (var i=0; i<size; i++){
	if (opponents[i].alias==noone){
		var spr=World.all_races[opponents[i].race].sprite;
	} else {
		var spr=opponents[i].alias.sprite;
	}
	draw_sprite_part_ext(spr, 0, 32, 0, 32, 48, start_x+128*i, base_y, 4, 4, c_white, opponents[i].alpha);
	if (opponents[i].st_vis_hp<get_max_hp(opponents[i], true)-1){
		if (opponents[i].st_vis_hp>0.25){
			draw_health_mini(start_x+128*i+2*32, base_y, opponents[i]);
		} else {
			opponents[i].target_alpha=0;
		}
	}
}

var base_x=W/3;
var base_y=H/2;
var size=array_length_1d(teammates);
var start_x=base_x-64-64*size;
for (var i=0; i<size; i++){
	if (teammates[i].alias==noone){
		var spr=World.all_races[teammates[i].race].sprite;
	} else {
		var spr=teammates[i].alias.sprite;
	}
	draw_sprite_part_ext(spr, 0, 32, 144, 32, 48, start_x+128*i, base_y, 4, 4, c_white, teammates[i].alpha);
	if (teammates[i].st_vis_hp<get_max_hp(teammates[i], true)-1&&teammates[i]!=player){
		if (teammates[i].st_vis_hp>0.25){
			draw_health_mini(start_x+128*i+2*32, base_y, teammates[i]);
		} else {
			teammates[i].target_alpha=0;
		}
	}
}

// Draw the background boxes and stuff

drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
drawPauseMenuInventoryBox(x1+16, y1+16, x1+32+128+16, H-16, border_width);
drawPauseMenuInventoryBox(W-16, y1+16, W-32-128-16, H-16, border_width);

// Draw the player stats

draw_set_halign(fa_center);
draw_set_color(c_white);
draw_text(32+128/2, H*3/4+32, player.name);
draw_health(32, H*3/4+64, false, false);
draw_magic(32, H*3/4+96, false, false);
draw_stamina(32, H*3/4+128, false, false);

// Draw the battler queue

var q=ds_priority_create();
ds_priority_copy(q, battle_queue);
draw_text(W-32-128/2, H*3/4+32, "Turn Order");
for (var n=0; n<5&&!ds_priority_empty(q); n++){
	var head=ds_priority_find_min(q);
	ds_priority_delete_min(q);
	if (n==0){
		var c=c_green;
	} else {
		var c=c_white;
	}
	draw_text_colour(W-32-128/2, H*3/4+48+16*n, head.name, c, c, c, c, 1);
}

// Draw the battle text or the command input

var player_options=battle_get_battle_options(player);
draw_set_halign(fa_left);

if (battle_stage==Misc.bs_input){
	drawPauseMenuInventoryBox(x1+32+128+16+16, y1+16, x1+32+128+16+16+128+32, H-16, border_width);
	draw_set_color(c_white);
	draw_text(x1+32+128+16+16+32, H*3/4+32, "What to do?");
	for (var i=0; i<ds_list_size(player_options); i++){
		draw_text(x1+32+128+16+16+32+32, H*3/4+32+16+16*i, battle_option_names[player_options[| i]]);
	}
	draw_sprite(spr_menu_arrow, 0, x1+32+128+16+16+16, H*3/4+32+16+16+16*battle_position);
	
	if (Controller.release_up){
		--battle_position;
	} else if (Controller.release_down){
		++battle_position;
	}
	battle_position=clamp(battle_position, 0, ds_list_size(player_options)-1);
} else if (battle_stage==Misc.bs_input_target){
	drawPauseMenuInventoryBox(x1+32+128+16+16, y1+16, x1+32+128+16+16+128+32, H-16, border_width);
	draw_set_color(c_white);
	draw_text(x1+32+128+16+16+32, H*3/4+32, "Target?");
	
	for (var i=0; i<array_length_1d(opponents); i++){
		if (opponents[i].st_act_hp<=0){
			var c=c_red;
		} else {
			var c=c_white;
		}
		draw_text_colour(x1+32+128+16+16+32+32, H*3/4+32+16+16*i, opponents[i].name, c, c, c, c, 1);
	}
	draw_sprite(spr_menu_arrow, 0, x1+32+128+16+16+16, H*3/4+32+16+16+16*battle_position);
	
	if (Controller.release_up){
		--battle_position;
	} else if (Controller.release_down){
		++battle_position;
	}
	battle_position=clamp(battle_position, 0, array_length_1d(opponents)-1);
} else {
	battle_text_t++;
	draw_text_ext(x1+32+128+16+16, H*3/4+32, string_copy(battle_text, 1, battle_text_t), -1, W-32-128-16-16-(x1+32+128+16+16));
}

// Process the battle logic

var advance=false;
switch (battle_stage){
	case Misc.bs_start:
		var str="";
		var al=array_length_1d(opponents);
		for (var i=0; i<al; i++){
			if (i>0&&i<al-1){
				str=str+", ";
			} else if (i==al-1){
				str=str+" and ";
			}
			str=str+opponents[i].name;
		}
		battle_text=str+" would like to battle!";
		if (Controller.release_a){
			advance=true;
		}
		break;
	case Misc.bs_turn_start:
		battle_active=ds_priority_find_min(battle_queue);
		
		// Decrease the shout timer of everyone in the battle
		var time=battle_active.battle_priority-battle_t;
		for (var i=0; i<array_length_1d(battlers); i++){
			if (battlers[i]!=Actors.no){
				battlers[i].shout_timer=max(0, battlers[i].shout_timer-time);
			}
		}
		
		// Do stuff
		if (battle_active==player){
			battle_stage=Misc.bs_input;
			battle_position=0;
		} else {
			battle_active_move=battle_get_battler_move(battle_active);
			battle_target=battle_get_battler_target(battle_active);
			advance=true;
		}
		
		// Finish up
		battle_t+=battle_active.battle_priority;
		break;
	case Misc.bs_turn_mid:
		battle_text=battle_active.name+" used "+battle_option_names[battle_active_move]+" on "+battle_target.name+"!";
		if (battle_target.st_act_hp<=0){
			battle_text=battle_text+"\nBut "+battle_target.name+" has already been defeated . . .";
		}
		if (Controller.release_a){
			battle_process_turn();
			advance=true;
		}
		break;
	case Misc.bs_turn_end:
		var defeated=ds_list_create();
		var defeat_string="";
		for (var i=0; i<array_length_1d(battlers); i++){
			if (battlers[i]!=Actors.no&&battlers[i].st_act_hp<=0&&!battlers[i].defeat_notify){
				ds_list_add(defeated, battlers[i]);
				battlers[i].defeat_notify=true;
				battlers[i].target_alpha=0;
			}
		}
		for (var i=0; i<ds_list_size(defeated); i++){
			defeat_string=defeat_string+defeated[| i].name;
			if (i==ds_list_size(defeated)-1){
				defeat_string=defeat_string+" and ";
			} else {
				defeat_string=defeat_string+", ";
			}
		}
		if (ds_list_size(defeated)>0){
			battle_text=defeat_string+" has been defeated!";
			if (Controller.release_a){
				advance=true;
			}
			if (player.st_act_hp<=0){
				battle_stage=Misc.bs_defeat;
				battle_t=0;
			}
		} else {
			// @todo Actual wait times for attacks
			var amt=battle_get_wait_time(battle_active, battle_active_move);
			ds_priority_delete_min(battle_queue);
			battle_active.battle_priority=battle_t+amt;
			ds_priority_add(battle_queue, battle_active, battle_t+amt);
			advance=true;
		}
		ds_list_destroy(defeated);
		break;
	case Misc.bs_input:
		if (Controller.release_a){
			battle_active_move=player_options[| battle_position];
			battle_position=0;
			advance=true;
		}
		break;
	case Misc.bs_input_target:
		if (Controller.release_a){
			battle_target=opponents[battle_position];
			battle_position=0;
			advance=true;
		}
		break;
	case Misc.bs_flee:
		// @todo a check for your Stealth level before running away
		battle_text="Fled the scene!";
		if (Controller.release_a){
			advance=true;
		}
		break;
	case Misc.bs_defeat:
		battle_text=player.name+" was defeated that day . . .";
		if (Controller.release_a){
			advance=true;
		}
		break;
}

if (advance){
	battle_text_t=0;
	battle_text="";
	switch (battle_stage){
		case Misc.bs_start:
			battle_stage=Misc.bs_turn_start;
			break;
		case Misc.bs_turn_start:
			battle_stage=Misc.bs_turn_mid;
			break;
		case Misc.bs_turn_mid:
			battle_stage=Misc.bs_turn_end;
			break;
		case Misc.bs_turn_end:
			battle_stage=Misc.bs_turn_start;
			break;
		case Misc.bs_input:
			if (array_length_1d(opponents)==1){
				battle_stage=Misc.bs_turn_mid;
				battle_target=0;
			} else if (battle_active_move==BattleOptions.flee){
				battle_stage=Misc.bs_flee;
			} else {
				battle_stage=Misc.bs_input_target;
			}
			break;
		case Misc.bs_input_target:
			battle_stage=Misc.bs_turn_mid;
			break;
		case Misc.bs_flee:
			battle_end();
			break;
		case Misc.bs_defeat:
			// @todo Game over condition
			break;
	}
}

ds_list_destroy(player_options);