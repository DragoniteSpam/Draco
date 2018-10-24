///	@description	Removes all items from the specified inventory and gives them to the Player.
///	@param	ActorIndex
var actor=GetMyActor(argument0);
while (!ds_list_empty(actor.inventory)){
	var stack=actor.inventory[| 0];

	AddItem(Actors.playable, stack.index, stack.quantity);
	RemoveItem(stack.index, stack.quantity, argument0);
	// This is not needed because RemoveItem will also, in this case,
	// remove the entry from the inventory.
	//ds_list_delete(argument0.inventory, 0);
}