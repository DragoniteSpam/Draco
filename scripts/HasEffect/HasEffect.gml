///	@description	Returns whether the specified Character knkows a spell.
///	@param	ActorIndex
///	@param	EffectIndex
function HasEffect(argument0, argument1) {

	var character=GetMyActor(argument0);
	var effect=argument1;

	for (var i=0; i<ds_list_size(character.effects); i++){
		var e=character.effects[| i];
		if (e.index==effect){
			return true;
		}
	}

	return false;


}
