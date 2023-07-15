///	@description	Returns whether or not the specified Actor has at least one point towards a perk.
///	@param	ActorIndex
///	@param	PerkIndex
function ActorHasPerk(argument0, argument1) {

	return (World.game_actors[argument0].perk_levels[argument1]>0);


}
