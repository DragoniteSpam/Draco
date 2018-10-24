/// @description	Equips the specified item.
/// @param	ItemStack
/// @param	lefthand?

DequipItem(Actors.playable, argument0);

if (argument1){
	EquipLeftHand(Actors.playable, argument0);
} else {
	EquipRightHand(Actors.playable, argument0);
}