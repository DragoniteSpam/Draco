///	@description	Adds an amount of gold the specified Solid.
///	@param	ActorIndex
///	@param	Amount
function RemoveGold(argument0, argument1) {

	RemoveItem(HasItem(argument0, Items.gold), argument1, argument0);


}
