///	@description	Removes an item from the specified inventory.
///	@param	ItemStack;
///	@param	quantity
///	@param	ActorIndex
function RemoveItem(argument0, argument1, argument2) {

	argument0.quantity-=argument1;
	if (argument0.quantity<=0){
	    RemoveItemStack(argument0, argument2);
	    return false;
	}

	return true;



}
