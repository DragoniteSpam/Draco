///	@description	Teaches the specified Character a spell.
///	@param	ActorIndex
///	@param	Spell
///	@param	[notify?]
///	@param	[useStrictActor?]
function TeachSpell() {

	if (argument_count>=4&&argument[3]){
		var character=argument[0];
		var useStrictActor=true;
	} else {
		var character=GetMyActor(argument[0]);
		var useStrictActor=false;
	}
	var spell=argument[1];
	var notify=(argument_count>=3&&argument[2]);

	if (HasSpell(argument[0], spell, useStrictActor)){
		if (notify){
			AddNotification("You already know "+all_effects[spell].name);
		}
		return false;
	}

	ds_list_add(character.magic, spell);
	SortMagic(argument[0], useStrictActor);

	if (notify){
		AddNotification("Learned "+all_effects[spell].name);
	}

	return true;


}
