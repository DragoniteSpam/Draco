///	@description	Absorb health from the target
///	@param	user
///	@param	target
///	@param	powercast?
///	@param	return	ItemEnchantment representing the Drain Life spell (passed as a parameter)
function ml_chaos() {

	var user=argument[0];
	var target=argument[1];

	if (target.race!=Races.inanimate){
	
	}

	var array=[argument[2]];
	if (choose(true, false)){
		var fire=instantiate(ItemEnchantment);
		var base_effect=all_effects[AllEffects.FireDamage];
		fire.index=AllEffects.FireDamage;
		fire.enchantment_power=base_effect.def_true*(1+GetSkillLevel(user.alias.actor_index, base_effect.school)/200)*(argument[3]?2.5:1);
		array[array_length_1d(array)]=fire;
	}
	if (choose(true, false)){
		var ice=instantiate(ItemEnchantment);
		var base_effect=all_effects[AllEffects.FrostDamage];
		ice.index=AllEffects.FrostDamage;
		ice.enchantment_power=base_effect.def_true*(1+GetSkillLevel(user.alias.actor_index, base_effect.school)/200)*(argument[3]?2.5:1);
		array[array_length_1d(array)]=ice;
	}
	if (choose(true, false)){
		var shock=instantiate(ItemEnchantment);
		var base_effect=all_effects[AllEffects.ShockDamage];
		shock.index=AllEffects.ShockDamage;
		shock.enchantment_power=base_effect.def_true*(1+GetSkillLevel(user.alias.actor_index, base_effect.school)/200)*(argument[3]?2.5:1);
		array[array_length_1d(array)]=shock;
	}

	return array;


}
