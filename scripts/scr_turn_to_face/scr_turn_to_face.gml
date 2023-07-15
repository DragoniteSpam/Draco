/// @description  Turn to face the specified target
/// @param	ArgSet
///	scr_turn_to_face, active, target
function scr_turn_to_face(argument0) {

	var arg_set=argument0;

	TurnToFace(arg_set[1], arg_set[2]);

	scr_continue();



}
