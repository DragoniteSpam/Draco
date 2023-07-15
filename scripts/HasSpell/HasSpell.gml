///	@description	Returns whether the specified Character knkows a spell.
///	@param	ActorIndex
///	@param	Spell
///	@param	[useStrictActor?]
function HasSpell() {

	if (argument_count==3&&argument[2]){
		var character=argument[0];
	} else {
		var character=GetMyActor(argument[0]);
	}
	var spell=argument[1];

	return ds_list_find_index(character.magic, spell)!=-1;


}
