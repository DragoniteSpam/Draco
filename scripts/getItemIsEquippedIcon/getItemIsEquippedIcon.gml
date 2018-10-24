/// @description	Returns the proper icon to go with the slot the item stack is equipped to. Prerequisite: the stack is equipped.
/// @param	ItemStack
/// @param	Character

var base_item=World.all_items[argument0.index];
if (base_item.equip==ItemEquipClasses.twohand){
	return 3;
}

if (argument1.equip_left==argument0){
	return 1;
}
if (argument1.equip_right==argument0){
	return 2;
}

return 0;