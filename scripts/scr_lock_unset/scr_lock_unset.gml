/// @description  Unlocks the Player.
/// @param	ArgSet
function scr_lock_unset(argument0) {

	var arg_set=argument0;
	(GetMyActor(arg_set[1])).alias.free=true;

	scr_continue();



}
