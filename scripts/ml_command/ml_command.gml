function ml_command() {
	var user=argument[0];
	var target=argument[1];

	if (all_races[target.race].animal){
		if (irandom(100)+GetMyActor().skill_level[Skills.conjour]/50>user.character_level){
			actor.alias.target=noone;
			for (var i=0; i<instance_number(Character); i++){
				var char=instance_find(Character, i);
				if (char.object_index==Character&&GetMyActor(char.actor_index).target==Actors.playable){
					target.target=char.actor_index;
					break;
				}
			}
		} else {
			AddNotification("Could not be commanded . . . crap.");
		}
	} else {
		AddNotification("That race can't be commanded with this spell!");
	}

	return [argument[2]];


}
