/// @description	Equips the specified item.
/// @param	ItemStack
/// @param	unused
function use_equip_ring(argument0) {

	DequipItem(Actors.playable, argument0);

	EquipRing(Actors.playable, argument0);


}
