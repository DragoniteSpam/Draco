///	@description	Gets the armor rating for the specified solid.
///	@param	Solid

var actor=GetMyActor(argument0);
var base_item=World.all_items[actor.equip_body!=noone?actor.equip_body.index:Items.no];
var base_ring=World.all_items[actor.equip_ring!=noone?actor.equip_ring.index:Items.no];
var base_head=World.all_items[actor.equip_head!=noone?actor.equip_head.index:Items.no];
var base_feet=World.all_items[actor.equip_feet!=noone?actor.equip_feet.index:Items.no];
var base_hands=World.all_items[actor.equip_hands!=noone?actor.equip_hands.index:Items.no];
var base_necklace=World.all_items[actor.equip_necklace!=noone?actor.equip_necklace.index:Items.no];

// @todo multiply that by any multipliers on armor rating (potions, etc)
return (base_item.base_power+base_ring.base_power+base_head.base_power+
	base_feet.base_power+base_hands.base_power+base_necklace.base_power);