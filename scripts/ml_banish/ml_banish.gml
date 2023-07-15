function ml_banish() {
	var user=argument[0];
	var target=argument[1];

	if (all_races[target.race].can_be_banished){
		if (irandom(100)+GetMyActor().skill_level[Skills.conjour]/50>user.character_level){
			target.alias.death_script=death_banished;
			target.st_act_hp=0;
		} else {
			AddNotification("Could not be banished . . . crap.");
		}
	} else {
		AddNotification("That race can't be banished!");
	}

	return [argument[2]];


}
