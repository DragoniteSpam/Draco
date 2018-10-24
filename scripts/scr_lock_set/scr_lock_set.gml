/// @description  Locks the Player.
/// @param	ArgSet

var arg_set=argument0;
(GetMyActor(arg_set[1])).alias.free=false;

scr_continue();
