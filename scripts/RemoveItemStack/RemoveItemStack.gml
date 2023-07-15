/// @description	Removes an item stack from the specified inventory.
///	@param ItemStack
///	@param ActorIndex
function RemoveItemStack(argument0, argument1) {

	DequipItem(argument1, argument0);
	ds_list_delete(GetMyActor(argument1).inventory, HasItemIndex(argument0.index, argument1));
	instance_activate_object(argument0);
	with (argument0){
	    instance_destroy();
	}

	return true;



}
