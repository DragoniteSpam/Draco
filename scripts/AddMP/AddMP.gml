///	@description	Adds to the specified character's MP.
///	@param	ActorIndex
///	@param	Amount
function AddMP() {

	var character=GetMyActor(argument[0]);

	character.st_act_mp=clamp(character.st_act_mp+argument[1], 0, get_max_mp(argument[0]));

	return true;


}
