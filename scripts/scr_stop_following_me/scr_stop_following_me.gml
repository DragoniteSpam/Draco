/// @description  void scr_add_item();
/// @function  void scr_add_item
/// @param	ArgSet
function scr_stop_following_me(argument0) {
	/* gives an item
	 * syntax (in the _cc_Actors thing):
	 *  scr_add_item, skill_index
	 */

	var arg_set=argument0;
	var actor=GetMyActor(arg_set[1]);

	actor.alias.control_script=process_npc_random_movement;

	actor.alias.persistent=false;

	Player.follower=Actors.no;

	scr_continue();


}
