///	@description	Returns the current level of the specified skill for the specified Actor.
///	@param	actor
///	@param	skill
function GetSkillLevel(argument0, argument1) {

	return GetMyActor(argument0).skill_level[argument1];


}
