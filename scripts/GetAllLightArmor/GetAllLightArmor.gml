///	@description	Returns true if the actor is wearing all heavy armor, false otherwise.
///	@param	actor	The actor to check.
function GetAllLightArmor(argument0) {

	var actor=GetMyActor(argument0);
	var base_no=all_items[Items.no];
	var base_item=all_items[actor.equip_body!=noone?actor.equip_body.index:Items.no];
	var base_head=all_items[actor.equip_head!=noone?actor.equip_head.index:Items.no];
	var base_feet=all_items[actor.equip_feet!=noone?actor.equip_feet.index:Items.no];
	var base_hands=all_items[actor.equip_hands!=noone?actor.equip_hands.index:Items.no];

	if (base_item==base_no||base_head==base_no||base_hands==base_no||base_feet==base_no){
		return false;
	}

	if (base_item.armor==ItemArmorTypes.light){
		return false;
	}
	if (base_head.armor==ItemArmorTypes.light){
		return false;
	}
	if (base_feet.armor==ItemArmorTypes.light){
		return false;
	}
	if (base_hands.armor==ItemArmorTypes.light){
		return false;
	}

	return true;


}
