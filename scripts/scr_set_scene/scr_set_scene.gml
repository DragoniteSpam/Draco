/// @description  Goes to a particular stage in someone's cutscene.
/// @param actor
///	@param	cutscene_index
/// @param  index
function scr_set_scene(argument0, argument1, argument2) {

	with (World){
		var actor=GetMyActor(argument0.actor_index);
		if (actor.alias!=noone){
			active=argument0;
			var arg_set=ds_list_find_value(actor.cutscenes[? argument1], argument2);
			script_execute(arg_set[0], arg_set);
		}
	}


}
