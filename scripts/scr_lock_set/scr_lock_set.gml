/// @description  Locks the Player.
/// @param	ArgSet
function scr_lock_set(argument0) {

	var arg_set=argument0;
	(GetMyActor(arg_set[1])).alias.free=false;

	scr_continue();



}
