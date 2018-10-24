/// @description  void scr_add_item();
/// @function  void scr_add_item
/// @param	ArgSet
/* gives an item
 * syntax (in the _cc_Actors thing):
 *  scr_add_item, target, item index, quantity
 */

var arg_set=argument0;

AddShout(arg_set[1], arg_set[2]);

scr_continue();
