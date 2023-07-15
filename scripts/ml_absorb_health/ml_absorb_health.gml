///	@description	Absorb health from the target
///	@param	user
///	@param	target
///	@param	return	ItemEnchantment representing the Drain Life spell (passed as a parameter)
function ml_absorb_health() {

	var user=argument[0];
	var target=argument[1];

	if (target.race!=Races.inanimate){
		var damage=12;	// @todo this
		target.st_act_mp=max(target.st_act_mp-damage, 0);
		user.st_act_mp=min(user.st_act_mp+damage, get_max_hp(user, true));
	}

	return [argument[2]];


}
