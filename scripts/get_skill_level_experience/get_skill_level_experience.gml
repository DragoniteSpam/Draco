///	@description	Returns the amount of experience needed to reach the current level.
///	@param	Skill
///	@param	level

var t=0;
var mult=World.all_skills[argument0].skill_improve_multiplier;
var offset=World.all_skills[argument0].skill_improve_offset;

for (var i=0; i<=argument1; i++){
	t+=mult*power(i, SKILL_CURVE)+offset;
}

return t;