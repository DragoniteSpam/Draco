/// @description	Equips the specified item.
/// @param	ItemStack
/// @param	unused
function use_equip_feet(argument0) {

	DequipItem(Actors.playable, argument0);

	EquipFeet(Actors.playable, argument0);


}
