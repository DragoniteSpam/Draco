///	@description	Advances the specified perk of a particular Actor to the next stage, if one is available.
///	@param	ActorIndex
///	@param	PerkIndex

var actor=World.game_actors[argument0];
var perk=World.all_perks[argument1];

actor.perk_levels[argument1]=min(++actor.perk_levels[argument1], array_length_1d(perk.require));