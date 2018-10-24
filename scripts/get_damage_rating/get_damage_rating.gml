///	@description	Gets the damage rating for the specified solid.
///	@param	ActorIndex

var actor=GetMyActor(argument0);
var right=actor.equip_right;

if (right==noone){
	var right_value=0;
} else {
	var base_item=World.all_items[right.index];
	var right_value=base_item.base_power;
	if (base_item.equip==ItemEquipClasses.twohand){
		return right_value;
	}
}

var left_value=World.all_items[actor.equip_left!=noone?actor.equip_left.index:Items.no].base_power;

// @todo multiply that by any multipliers on damage rating (potions, etc)
return (left_value+right_value);