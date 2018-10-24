/// @description  void scr_add_item();
/// @function  void scr_add_item
/// @param	ArgSet
/* gives an item
 * syntax (in the _cc_Actors thing):
 *  scr_add_item, skill_index
 */

var arg_set=argument0;
var actor=GetMyActor(arg_set[1]);

actor.alias.control_script=process_npc_player_follower;

MoveTo(arg_set[1], Player.last_xx, Player.last_yy);
actor.alias.persistent=true;

Player.follower=arg_set[1];

scr_continue();