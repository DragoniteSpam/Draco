function ml_soultrap() {
	var user=argument[0];
	var target=argument[1];

	if (target.race==Races.inanimate){
		AddNotification("Inanimate objects can't be Soul Trapped!");
	} else {
		if (get_active_effect_modifier(target.actor_index, AllEffects.SoulTrap)==all_effects[AllEffects.SoulTrap].def_false){
			AddActiveEffect(AllEffects.SoulTrap, target.actor_index, all_effects[AllEffects.SoulTrap].def_true, 120, true);
		} else {
			AddNotification("This actor is already soul trapped!");
		}
	}

	return [argument[2]];


}
