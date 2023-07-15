/// @description  Adds an effect.
/// @param  effect_index
/// @param	actor_index
/// @param  magnitude
///	@param	time
///	@param	[notify?]
function AddActiveEffect() {

	with (instantiate(ActiveEffect)){
		index=argument[0];
		effect[index]=argument[2];
		time=argument[3];
		ds_list_add(GetMyActor(argument[1]).effects, id);
		if (argument_count==5&&argument[4]){
			AddNotification(all_effects[index].name+" added");
		}
	}


}
