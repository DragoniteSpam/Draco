///	@description	Absorb health from the target
///	@param	user
///	@param	target
///	@param	return	ItemEnchantment representing the Drain Stamina spell (passed as a parameter)
function ml_absorb_stamina() {

	var user=argument[0];
	var target=argument[1];

	if (target.race!=Races.inanimate){
		var damage=12;	// @todo this
		target.st_act_sp=max(target.st_act_sp-damage, 0);
		user.st_act_sp=min(user.st_act_sp+damage, get_max_hp(user, true));
	}

	return [argument[2]];


}
