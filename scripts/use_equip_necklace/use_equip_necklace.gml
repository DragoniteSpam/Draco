/// @description	Equips the specified item.
/// @param	ItemStack
/// @param	unused
function use_equip_necklace(argument0) {

	DequipItem(Actors.playable, argument0);

	EquipNecklace(Actors.playable, argument0);


}
