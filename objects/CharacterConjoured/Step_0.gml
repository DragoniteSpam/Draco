/// @description Chase after your enemies

var owner_actor=GetMyActor(owner);

if (GetMyActor().target==noone&&irandom(16)==10){
	with (Character){
		if (GetMyActor().target==other.owner){
			(GetMyActor(other.actor_index)).target=actor_index;
		}
	}
}

event_inherited();