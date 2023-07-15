/// @description	Equips the specified item.
/// @param	ItemStack
/// @param	unused
function use_equip_body(argument0) {

	DequipItem(Actors.playable, argument0);

	EquipBody(Actors.playable, argument0);


}
