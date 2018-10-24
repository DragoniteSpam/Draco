///	@description	Removes an item from the specified inventory.
///	@param	item
///	@param	quantity
///	@param	ActorIndex

var t=HasItem(argument2, argument0);

if (t==noone){
    return false;
}

t.quantity-=argument1;
if (t.quantity<=0){
    RemoveItemStack(t, argument2);
    return false;
}

return true;
