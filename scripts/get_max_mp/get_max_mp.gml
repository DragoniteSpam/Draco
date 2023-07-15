///	@description	Gets the max MP for the specified character.
///	@param	ActorIndex
///	@param	[useStrictActor?]
function get_max_mp() {

	// @todo implement modifiers like equipment and potions and stuff

	if (argument_count==2&&argument[1]){
		var actor=argument[0];
	} else {
		var actor=GetMyActor(argument[0]);
	}

	var race=all_races[actor.race];

	return race.magicka+actor.st_mod_mp;


}
