/// @description  Adds an item.
/// @param ActorIndex
/// @param  index
/// @param  quantity
///	@param	[notify?]
///	@param	[useStrictActor?]
function AddItem() {

	if (argument_count>=5&&argument[4]){
		var actor=argument[0];
		var useStrictActor=true;
	} else {
		var actor=GetMyActor(argument[0]);
		var useStrictActor=false;
	}

	var t=HasItem(argument[0], argument[1], useStrictActor);

	if (t==noone){
	    var n=instantiate(ItemStack);
	    n.index=argument[1];
	    n.quantity=argument[2];
	    ds_list_add(actor.inventory, n);
		// Sort the inventory
		SortInventory(argument[0], useStrictActor);
	} else {
	    t.quantity+=argument[2];
	}

	if (argument_count>=4&&argument[3]){
		AddNotification(all_items[argument[1]].name+" added");
	}


}
