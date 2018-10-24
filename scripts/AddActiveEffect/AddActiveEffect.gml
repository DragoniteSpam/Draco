/// @description  Adds an effect.
/// @param	Solid
/// @param  index
/// @param  magnitude
///	@param	time
///	@param	[notify?]

with (instantiate(ActiveEffect)){
	index=argument[1];
	effect[index]=argument[2];
	time=argument[3];
	ds_list_add(GetMyActor(argument[0]).effects, id);
	if (argument_count==5&&argument[4]){
		AddNotification(all_effects[index].name+" added");
	}
}