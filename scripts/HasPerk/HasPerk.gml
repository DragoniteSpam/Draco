///	@description	Returns true if the specified actor has a perk, false otherwise
///	@param	actor_index
///	@param	perk
function HasPerk(argument0, argument1) {

	return (GetPerkLevel(argument0, argument1)>0);


}
