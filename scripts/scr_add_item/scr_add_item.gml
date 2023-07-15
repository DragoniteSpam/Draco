/// @description  void scr_add_item();
/// @function  void scr_add_item
/// @param	ArgSet
function scr_add_item(argument0) {
	/* gives an item
	 * syntax (in the _cc_Actors thing):
	 *  scr_add_item, target, item index, quantity
	 */

	var arg_set=argument0;

	AddItem(GetMyActor(arg_set[1]).alias, arg_set[2], arg_set[3]);

	scr_continue();



}
