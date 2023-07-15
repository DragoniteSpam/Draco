/// @description	Equips the specified item.
/// @param	ItemStack
/// @param	unused
function use_equip_head(argument0) {

	DequipItem(Actors.playable, argument0);

	EquipHead(Actors.playable, argument0);


}
