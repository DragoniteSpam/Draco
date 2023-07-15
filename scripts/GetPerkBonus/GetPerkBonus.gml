///	@description	Returns true if the specified actor has a perk, false otherwise
///	@param	actor_index
///	@param	perk
function GetPerkBonus(argument0, argument1) {

	return all_perks[argument1].bonus[GetMyActor(argument0).perk_levels[argument1]];


}
