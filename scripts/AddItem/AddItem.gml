/// @description  Adds an item.
/// @param ActorIndex
/// @param  index
/// @param  quantity
///	@param	[notify?]

var actor=GetMyActor(argument[0]);

var t=HasItem(argument[0], argument[1]);

if (t==noone){
    var n=instantiate(ItemStack);
    n.index=argument[1];
    n.quantity=argument[2];
    ds_list_add(actor.inventory, n);
	// Sort the inventory
	SortInventory(argument[0]);
} else {
    t.quantity+=argument[2];
}

if (argument_count==4&&argument[3]&&argument[0]==Player){
	AddNotification(World.all_items[argument[1]].name+" added");
}