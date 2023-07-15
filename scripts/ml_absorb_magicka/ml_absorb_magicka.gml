///	@description	Absorb health from the target
///	@param	user
///	@param	target
///	@param	return	ItemEnchantment representing the Drain Magicka spell (passed as a parameter)
function ml_absorb_magicka() {

	var user=argument[0];
	var target=argument[1];

	if (target.race!=Races.inanimate){
		var damage=12;	// @todo this
		target.st_act_hp=max(target.st_act_hp-damage, 0);
		user.st_act_hp=min(user.st_act_hp+damage, get_max_hp(user, true));
	}

	return [argument[2]];


}
