///	@description	Returns the amount of experience needed to reach the current level.
///	@param	skill
///	@param	level
function get_skill_level_experience(argument0, argument1) {

	var t=0;
	var mult=all_skills[argument0].skill_improve_multiplier;
	var offset=all_skills[argument0].skill_improve_offset;

	for (var i=0; i<=argument1; i++){
		t+=mult*power(i, SKILL_CURVE)+offset;
	}

	return t;


}
