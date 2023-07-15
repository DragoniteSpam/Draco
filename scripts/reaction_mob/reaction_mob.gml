///	@description	What happens when you hit a mob physically.
///	@param	attacking_actor
///	@param	combat_style
///	@param	base_damage
///	@param	magical_array
///	@param	skill
function reaction_mob(argument0, argument1, argument2, argument3) {

	var attacker=GetMyActor(argument0);
	var me=GetMyActor();

	var base_damage=1;
	var magical=argument2;
	var skill=argument3;

	if (argument0==Actors.playable){
		AddExperience(argument0, skill, base_damage);
	}

	if (argument1==CombatStyles.physical){
		actor.st_act_hp-=max(base_damage-get_armor_rating(actor_index), 1);
	} else if (argument1==CombatStyles.magical){
		var magic_modifier=1;
		for (var i=0; i<array_length_1d(magical); i++){
			magic_modifier*=get_active_effect_modifier(actor_index, AllEffects.WeaknessToMagic)
				/get_active_effect_modifier(actor_index, AllEffects.ResistMagic);
			base_damage*=magical[i].enchantment_power;
			switch (all_effects[magical[i].index].flag){
				case MagicFlags.fire:
					magic_modifier*=get_active_effect_modifier(actor_index, AllEffects.WeaknessToFire)
						/get_active_effect_modifier(actor_index, AllEffects.ResistFire);
						AddNotification("Fire damage")
					break;
				case MagicFlags.ice:
					magic_modifier*=get_active_effect_modifier(actor_index, AllEffects.WeaknessToFrost)
						/get_active_effect_modifier(actor_index, AllEffects.ResistFrost);
						AddNotification("Ice damage")
					break;
				case MagicFlags.shock:
					magic_modifier*=get_active_effect_modifier(actor_index, AllEffects.WeaknessToShock)
						/get_active_effect_modifier(actor_index, AllEffects.ResistShock);
					AddNotification("Shock damage")
					break;
				case MagicFlags.poison:
					magic_modifier*=get_active_effect_modifier(actor_index, AllEffects.WeaknessToPoison)
						/get_active_effect_modifier(actor_index, AllEffects.ResistPoison);
					break;
			}
		}
		base_damage*=magic_modifier;
		var actual_base_damage=max(0, base_damage-me.ward_points);
		me.ward_points=max(0, me.ward_points-base_damage);
		AddHP(actor_index, -actual_base_damage);
	}


}
