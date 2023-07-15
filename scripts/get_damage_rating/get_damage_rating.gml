///	@description	Gets the damage rating for the specified solid.
///	@param	ActorIndex
function get_damage_rating(argument0) {

	var actor=GetMyActor(argument0);

	var right=actor.equip_right;

	if (right==noone){
		var right_value=0;
	} else {
		var base_item=all_items[right.index];
		var right_value=base_item.base_power;
		if (base_item.equip==ItemEquipClasses.twohand){
			return right_value;
		}
	}

	var left_value=all_items[actor.equip_left!=noone?actor.equip_left.index:Items.no].base_power;

	return (left_value+right_value);


}
