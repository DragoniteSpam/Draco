/// @description	Equips the specified item.
/// @param	ItemStack
/// @param	unused
function use_equip_hands(argument0) {

	DequipItem(Actors.playable, argument0);

	EquipHands(Actors.playable, argument0);


}
