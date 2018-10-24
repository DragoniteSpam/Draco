/// @description  void scr_battle();
/// @param	ArgSet
// Starts a battle.
// scr_battle [fleeable?]

var arg_set=argument0;

with (World){
	state_sepia_target=SEPIA_TONE;

	state=Misc.battle;
	battlers=array_create(32, Actors.no);

	battlers[0]=GetMyActor(Actors.playable);
	battlers[0].side=Misc.side_player;
	battlers[0].alias.draw=false;
	active.draw=false;

	for (var i=0; i<array_length_1d(active.var_battlers); i++){
		var array=active.var_battlers[i];
		var base_race=all_races[array[0]];
		battlers[1+i]=newActor(array[1], "", null_cutscene, array[0], false, array[2]);
		var battler=battlers[1+i];
		battler.battle_deleteable=true;
		battler.side=Misc.side_opponent;
		battler.st_act_hp=get_max_hp(battler, true);
		battler.st_act_mp=get_max_mp(battler, true);
		battler.st_act_sp=get_max_sp(battler, true);
		battler.st_vis_hp=battler.st_act_hp;
		battler.st_vis_mp=battler.st_act_mp;
		battler.st_vis_sp=battler.st_act_sp;
		battler.alpha=1;
		battler.target_alpha=1;
		battler.defeat_notify=false;
		battler.blocking=false;
	}

	if (Player.follower!=Actors.no){
		var actor=GetMyActor(Player.follower);
		battlers[i]=actor;
		actor.side=Misc.side_player;
		actor.alias.draw=false;
	}

	battle_queue=ds_priority_create();

	for (var i=0; i<array_length_1d(battlers); i++){
		if (battlers[i]==Actors.no){
			break;
		}
		var priority=random(1.5);
		ds_priority_add(battle_queue, battlers[i], priority);
		battlers[i].shout_timer=0;
		battlers[i].battle_priority=priority;
	}
	
	battle_text_t=0;
	battle_text="";
	battle_t=0;
	battle_active=noone;
	battle_active_move=BattleOptions.no;
	battle_position=0;
	battle_target=0;
	battle_stage=Misc.bs_start;
	
	// Default parameters
	battle_fleeable=true;
	switch (array_length_1d(arg_set)){
		case 2:
			battle_fleeable=arg_set[1];
		default:
			break;
	}
}