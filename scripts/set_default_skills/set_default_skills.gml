///	@description	Sets the default skills of the specified actor for their Race.
///	@param	Actor
function set_default_skills(argument0) {

	var base_race=all_races[argument0.race];
	for (var i=0; i<array_length_1d(all_skills); i++){
		argument0.skill_exp[i]=get_skill_level_experience(i, base_race.skill[i]);
		argument0.skill_level[i]=base_race.skill[i];
	}


}
