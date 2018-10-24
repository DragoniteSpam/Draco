/// @description  Unlocks the Player.
/// @param	ArgSet

var arg_set=argument0;
(GetMyActor(arg_set[1])).alias.free=true;

scr_continue();
