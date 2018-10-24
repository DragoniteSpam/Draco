///	@description	Returns whether the specified Character knkows a spell.
///	@param	ActorIndex
///	@param	Spell

var character=GetMyActor(argument0);
var spell=argument1;

return ds_list_find_index(character.magic, spell)!=-1;