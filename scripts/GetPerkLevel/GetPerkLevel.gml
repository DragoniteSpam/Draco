///	@description	Returns true if the specified actor has a perk, false otherwise
///	@param	actor_index
///	@param	perk
function GetPerkLevel(argument0, argument1) {

	return GetMyActor(argument0).perk_levels[argument1];


}
