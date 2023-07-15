///	@description	Adds to the specified character's HP.
///	@param	ActorIndex
///	@param	Amount
function AddHP() {

	var character=GetMyActor(argument[0]);

	character.st_act_hp=clamp(character.st_act_hp+argument[1], 0, get_max_hp(argument[0]));

	return true;


}
