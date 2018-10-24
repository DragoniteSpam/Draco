/// @description  Creates a new item class.
/// @param name
/// @param  description
/// @param  default_cutscene
///	@param	race
///	@param	respawns?
///	@param	is_ghost

with (instantiate(ActorData)){
	name=argument[0];
	description=argument[1];
	cutscenes[? "default"]=argument[2];
	race=argument[3];
	respawns=argument[4];
	is_ghost=argument[5];
	set_default_skills(id);
	return id;
}