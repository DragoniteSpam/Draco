///	@description	Gets the armor rating for the specified solid.
///	@param	actor_index
function get_armor_rating(argument0) {

	var actor=GetMyActor(argument0);
	var base_item=all_items[actor.equip_body!=noone?actor.equip_body.index:Items.no];
	var base_ring=all_items[actor.equip_ring!=noone?actor.equip_ring.index:Items.no];
	var base_head=all_items[actor.equip_head!=noone?actor.equip_head.index:Items.no];
	var base_feet=all_items[actor.equip_feet!=noone?actor.equip_feet.index:Items.no];
	var base_hands=all_items[actor.equip_hands!=noone?actor.equip_hands.index:Items.no];
	var base_necklace=all_items[actor.equip_necklace!=noone?actor.equip_necklace.index:Items.no];

	var fortify_heavy_armor=1+get_active_effect_modifier(argument0, AllEffects.FortifyHeavyArmor);
	var fortify_light_armor=1+get_active_effect_modifier(argument0, AllEffects.FortifyLightArmor);
	var all_heavy_armor=GetAllHeavyArmor(argument0);
	var all_light_armor=GetAllLightArmor(argument0);
	var t=0;
	if (base_item.armor==ItemArmorTypes.heavy){
		t+=base_item.base_power*fortify_heavy_armor;
	} else {
		t+=base_item.base_power*fortify_light_armor;
	}
	if (base_head.armor==ItemArmorTypes.heavy){
		t+=base_head.base_power*fortify_heavy_armor;
	} else {
		t+=base_head.base_power*fortify_light_armor;
	}
	if (base_feet.armor==ItemArmorTypes.heavy){
		t+=base_feet.base_power*fortify_heavy_armor;
	} else {
		t+=base_feet.base_power*fortify_light_armor;
	}
	if (base_hands.armor==ItemArmorTypes.heavy){
		t+=base_hands.base_power*fortify_heavy_armor;
	} else {
		t+=base_hands.base_power*fortify_light_armor;

	}
	t+=base_necklace.base_power;
	t+=base_ring.base_power;

	if (all_heavy_armor&&HasPerk(argument0, Perks.WellFitted)){
		t*=1.25;
	} else if (all_light_armor&&HasPerk(argument0, Perks.CustomFit)){
		t*=1.25;
	}
	// @todo MatchingSetHA: 25% armor bonus if wearing a matched set of Heavy Armor
	// @todo MatchingSetLA: 25% armor bonus if wearing a matched set of Light Armor
	return t;


}
