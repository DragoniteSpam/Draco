///	@description	Returns the current level of the specified skill for the specified Actor.
///	@param	actor
///	@param	skill
function GetSkillExperience(argument0, argument1) {

	return GetMyActor(argument0).skill_exp[argument1];


}
