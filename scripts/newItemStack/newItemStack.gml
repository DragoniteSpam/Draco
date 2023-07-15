/// @description	Creates a new ItemStack.
///	@param	item
///	@param	quantity
function newItemStack(argument0, argument1) {

	with (instantiate(ItemStack)){
		index=argument0;
		quantity=argument1;
		return id;
	}


}
