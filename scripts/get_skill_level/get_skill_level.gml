///	@description	Takes the experience and skill type as input and calculates the level.
///	@param	skill
///	@param	experience
function get_skill_level(argument0, argument1) {

	var skill=all_skills[argument0];

	var l=0;

	for (var i=0; i<=MAX_SKILL_LEVEL; i++){
		if (get_skill_level_experience(argument0, i)>argument1){
			return i-1;
		}
	}

	return MAX_SKILL_LEVEL;


}
