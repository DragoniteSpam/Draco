/// @description Effect timer countdown

if (pausing==noone){
	var player=GetMyActor(Actors.playable);
	with (player){
		for (var i=0; i<ds_list_size(player.effects); i++){
			player.effects[| i].time--;
			if (player.effects[| i].time==0){
				RemoveEffect(Actors.playable, i);
				i--;
			}
		}
	}
}

alarm[ALARM_EFFECT_TIMER]=game_get_speed(gamespeed_fps);