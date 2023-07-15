/// @description	Sets one of the boolean flag values
/// @param	ArgSet
function scr_set_flag(argument0) {
	/*	syntax (in the const_npc thing):
	 *  scr_set_boolean_flag, index, value
	 */

	var arg_set=argument0;

	World.boolean_flags[arg_set[1]]=arg_set[2];

	scr_continue();


}
