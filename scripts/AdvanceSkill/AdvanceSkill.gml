///	@description	Advances the specified skill one level (or to the specified level)
///	@param	ActorIndex
///	@param	Skill

var actor=GetMyActor(argument[0]);
var current_exp=actor.skill_exp[argument[1]];
var current_level=actor.skill_level[argument[1]];
var target=current_level+1;

actor.skill_exp[argument[1]]=get_skill_level_experience(argument[1], target);
actor.skill_level[argument[1]]=target;

AdvanceExperience(argument[0], target);

// @todo Some kind of graphic for this

return current_level;