///	@description	Adds an enchantment to an ItemStack (and separates that ItemStack as its own).
///	@param	enchant
///	@param	itemstack
///	@param	power
///	@param	duration
///	@param	actor_index
function AddEnchantment(argument0, argument1, argument2, argument3, argument4) {

	var enchant=argument0;
	var itemstack=argument1;
	var enchant_power=argument2;
	var enchant_duration=argument3;
	var actor=argument4;

	var stack=AddItemNewStack(argument3, itemstack.index, 1, true);
	var ench=instantiate(ItemEnchantment);
	ench.index=enchant;
	ench.enchantment_power=enchant_power;
	stack.enchantment[array_length_1d(stack.enchantment)-1]=ench;
	stack.enchantment_charge=enchant_duration;
	stack.enchantment_max_charge=enchant_duration;

	RemoveItem(itemstack, 1, actor);


}
