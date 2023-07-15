/// @description	Equips the specified item.
/// @param	ItemStack
/// @param	lefthand?
function use_equip_two_hand(argument0) {

	DequipItem(Actors.playable, argument0);
	DequipItem(Actors.playable, GetMyActor(Actors.playable).equip_left);

	EquipRightHand(Actors.playable, argument0);


}
