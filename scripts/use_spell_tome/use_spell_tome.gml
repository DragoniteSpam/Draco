/// @description	Use a spell tome.
/// @param	ItemStack
/// @param	lefthand?
function use_spell_tome(argument0, argument1) {

	var stack=argument0;
	var left_hand=argument1;

	if (TeachSpell(Actors.playable, all_items[stack.index].variable, true)){
		RemoveItem(stack, 1, Actors.playable);
	}


}
