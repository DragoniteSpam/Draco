/// @description  Moves to a specified point.
/// @param	ArgSet
function scr_move_to_var(argument0) {
	//	scr_move_to_var
	// Same as scr_move_to, except it takes the calling instance's coordinate_x and coordinate_y variables

	var arg_set=argument0;
	MoveTo(arg_set[1], World.active.var_coordinate_x, World.active.var_coordinate_y);

	scr_continue();


}
