/// @description	Equips the specified item.
/// @param	ItemStack
/// @param	lefthand?
function use_equip_one_hand(argument0, argument1) {

	DequipItem(Actors.playable, argument0);

	if (argument1){
		EquipLeftHand(Actors.playable, argument0);
	} else {
		EquipRightHand(Actors.playable, argument0);
	}


}
