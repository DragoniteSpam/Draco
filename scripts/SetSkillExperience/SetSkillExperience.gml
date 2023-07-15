///	@description	Returns the current level of the specified skill for the specified Actor.
///	@param	actor
///	@param	skill
///	@param	experience
function SetSkillExperience(argument0, argument1, argument2) {

	(GetMyActor(argument0)).skill_exp[argument1]=argument2;


}
