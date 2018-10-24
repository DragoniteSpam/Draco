///	@description	Gets the max HP for the specified character.
///	@param	ActorIndex
///	@param	[useStrictActor?]

// @todo implement modifiers like equipment and potions and stuff

if (argument_count==2&&argument[1]){
	var actor=argument[0];
} else {
	var actor=GetMyActor(argument[0]);
}

var race=World.all_races[actor.race];

return race.hp+actor.st_mod_hp;