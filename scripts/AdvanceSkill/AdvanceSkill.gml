///	@description	Advances the specified skill one level (or to the specified level)
///	@param	ActorIndex
///	@param	Skill
function AdvanceSkill() {

	var actor=GetMyActor(argument[0]);
	var current_exp=actor.skill_exp[argument[1]];
	var current_level=GetSkillLevel(argument[0], argument[1]);
	var target=current_level+1;

	SetSkillExperience(argument[0], argument[1], get_skill_level_experience(argument[1], target));
	SetSkillLevel(argument[0], argument[1], target);

	AdvanceExperience(argument[0], target);

	// @todo Some kind of graphic for this

	return current_level;


}
