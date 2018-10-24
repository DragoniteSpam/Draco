/// @description	Use a spell tome.
/// @param	ItemStack
/// @param	lefthand?

var stack=argument0;
var left_hand=argument1;

if (TeachSpell(Actors.playable, World.all_items[stack.index].variable, true)){
	RemoveItem(stack.index, 1, Actors.playable);
}