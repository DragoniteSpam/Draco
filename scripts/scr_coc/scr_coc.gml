/// @description  Moves you to a position in the current map.
/// @param	ArgSet
function scr_coc(argument0) {

	var arg_set=argument0;

	instance_activate_object(Struct);
	//instance_activate_all();
	room_goto(arg_set[1]);
	//instance_deactivate_object(Struct);
	// @todo Go back and un-comment that when Yoyo fixes their bug
	Player.free=true;
	World.shade_target=0;
	scr_continue();


}
