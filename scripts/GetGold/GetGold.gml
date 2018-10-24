///	@description	Returns the amount of gold the specified Solid has.
///	@param	ActorIndex

var stack=HasItem(argument0, Items.gold);

if (stack==noone){
	return 0;
}

return stack.quantity;