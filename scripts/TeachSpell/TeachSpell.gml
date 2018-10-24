///	@description	Teaches the specified Character a spell.
///	@param	ActorIndex
///	@param	Spell
///	@param	[notify?]

var character=GetMyActor(argument[0]);
var spell=argument[1];
var notify=argument_count==3&&argument[2]&&argument[0]==Actors.playable;

if (HasSpell(argument[0], spell)){
	if (notify){
		AddNotification("You already know "+World.all_magic[spell].name);
	}
	return false;
}

ds_list_add(character.magic, spell);
SortMagic(argument[0]);

if (notify){
	AddNotification("Learned "+World.all_magic[spell].name);
}

return true;