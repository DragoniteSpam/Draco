/// @description	Dequips the specified item, if it's equipped. There's probably a better way to do this.
///	@param	ActorIndex
///	@param	ItemStack
function DequipItem(argument0, argument1) {

	var actor=GetMyActor(argument0);

	if (actor.equip_head==argument1){
		actor.equip_head=noone;
	}
	if (actor.equip_hands==argument1){
		actor.equip_hands=noone;
	}
	if (actor.equip_body==argument1){
		actor.equip_body=noone;
	}
	if (actor.equip_feet=argument1){
		actor.equip_feet=noone;
	}
	if (actor.equip_ring==argument1){
		actor.equip_ring=noone;
	}
	if (actor.equip_necklace==argument1){
		actor.equip_necklace=noone;
	}
	if (actor.equip_left==argument1){
		actor.equip_left=noone;
	}
	if (actor.equip_right==argument1){
		actor.equip_right=noone;
	}


}
