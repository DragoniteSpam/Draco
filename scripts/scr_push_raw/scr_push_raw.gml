/// @description	Sets one of the World.variable[n] values
/// @param	ArgSet
function scr_push_raw(argument0) {
	/* syntax (in the const_npc thing):
	 *  scr_push, index, value
	 */

	var arg_set=argument0;

	World.variable[arg_set[1]]=arg_set[2];

	scr_continue();


}
