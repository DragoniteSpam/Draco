/// @description  void scr_add_item();
/// @function  void scr_add_item
/// @param	ArgSet
function scr_show_skill_trainer(argument0) {
	/* gives an item
	 * syntax (in the _cc_Actors thing):
	 *  scr_add_item, skill_index
	 */

	var arg_set=argument0;

	World.show_skill_trainer=arg_set[1];


}
