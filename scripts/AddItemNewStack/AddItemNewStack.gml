/// @description  Adds an item.
/// @param ActorIndex
/// @param  index
/// @param  quantity
///	@param	[notify?]
function AddItemNewStack() {

	var actor=GetMyActor(argument[0]);

	var n=instantiate(ItemStack);
	n.index=argument[1];
	n.quantity=argument[2];
	ds_list_add(actor.inventory, n);
	// Sort the inventory
	SortInventory(argument[0]);

	if (argument_count==4&&argument[3]&&argument[0]==Player){
		AddNotification(all_items[argument[1]].name+" added");
	}


}
