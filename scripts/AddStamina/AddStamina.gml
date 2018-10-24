///	@description	Sets the specified character's SP.
///	@param	ActorIndex
///	@param	Amount

var character=GetMyActor(argument[0]);

character.st_act_sp=clamp(character.st_act_sp+argument[1], 0, get_max_sp(argument[0]));

return true;