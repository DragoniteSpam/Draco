// Close down stuff that was set up for the battle

ds_priority_destroy(battle_queue);

for (var i=0; i<array_length_1d(battlers); i++){
	if (battlers[i]==Actors.no){
		break;
	}
	if (battlers[i].battle_deleteable){
		instance_activate_object(battlers[i]);
		with (battlers[i]){
			instance_destroy();
		}
	}
}

state=Misc.play;

state_sepia_target=0;
(GetMyActor(Actors.playable)).alias.draw=true;
active.draw=true;

scr_continue();