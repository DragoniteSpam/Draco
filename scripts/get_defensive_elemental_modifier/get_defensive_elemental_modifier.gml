///	@param	target	Who you're checking the modifier on.
///	@param	type	The type of damage you're checking for.
///	@return			The RESISTANCE FACTOR (so divide damage by this result)
function get_defensive_elemental_modifier(argument0, argument1) {

	var actor=GetMyActor(argument0);

	if (argument1==MagicFlags.no){
		// @todo Replace this with armor rating
		return 0;
	}

	switch (argument1){
		case MagicFlags.shock:
			return get_active_effect_modifier(argument0, AllEffects.ResistShock)*get_active_effect_modifier(argument0, AllEffects.ResistMagic)/
				get_active_effect_modifier(argument0, AllEffects.WeaknessToShock)*get_active_effect_modifier(argument0, AllEffects.WeaknessToMagic);
			break;
		case MagicFlags.fire:
			return get_active_effect_modifier(argument0, AllEffects.ResistFire)*get_active_effect_modifier(argument0, AllEffects.ResistMagic)/
				(get_active_effect_modifier(argument0, AllEffects.WeaknessToFire)*get_active_effect_modifier(argument0, AllEffects.WeaknessToMagic));
			break;
		case MagicFlags.ice:
			return get_active_effect_modifier(argument0, AllEffects.ResistFrost)*get_active_effect_modifier(argument0, AllEffects.ResistMagic)/
				(get_active_effect_modifier(argument0, AllEffects.WeaknessToFrost)*get_active_effect_modifier(argument0, AllEffects.WeaknessToMagic));
			break;
		case MagicFlags.light:
			return get_active_effect_modifier(argument0, AllEffects.ResistLight)*get_active_effect_modifier(argument0, AllEffects.ResistMagic)/
				(get_active_effect_modifier(argument0, AllEffects.WeaknessToLight)*get_active_effect_modifier(argument0, AllEffects.WeaknessToMagic));
			break;
		case MagicFlags.sun:
			return get_active_effect_modifier(argument0, AllEffects.ResistSun)*get_active_effect_modifier(argument0, AllEffects.ResistMagic)/
				(get_active_effect_modifier(argument0, AllEffects.WeaknessToSun)*get_active_effect_modifier(argument0, AllEffects.WeaknessToMagic));
			break;
		case MagicFlags.poison:
			return get_active_effect_modifier(argument0, AllEffects.ResistPoison)*get_active_effect_modifier(argument0, AllEffects.ResistMagic)/
				(get_active_effect_modifier(argument0, AllEffects.WeaknessToPoison)*get_active_effect_modifier(argument0, AllEffects.WeaknessToMagic));
			break;
		default:
			return 1;
			break;
	}


}
