///	@description	Gives experience to the player (probably on skill level)
///	@param	ActorIndex
///	@param	amount
function AdvanceExperience(argument0, argument1) {

	var actor=GetMyActor(argument0);
	var level=actor.character_level;

	actor.character_exp+=argument1;

	if (get_character_level_experience(level+1)<actor.character_exp){
		LevelUp(argument0);
	}


}
