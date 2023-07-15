/// @description  Moves you to a position in the current map.
/// @param	ArgSet
function scr_coc_var(argument0) {
	// Same as scr_coc, except it takes the calling instance's int variable instead of a parameter

	var arg_set=argument0;

	instance_activate_object(Struct);
	with (Struct){
		persistent=true;
	}
	//instance_activate_all();
	room_goto(World.active.var_int);
	//instance_deactivate_object(Struct);
	Player.free=true;
	World.shade_target=0;
	scr_continue();


}
