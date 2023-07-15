/// @description  Fully restores an actor's health
/// @param	ArgSet
///	scr_restore_health_full, actor
function scr_restore_health_full(argument0) {

	var arg_set=argument0;
	var actor=GetMyActor(arg_set[1]);

	actor.st_act_hp=get_max_hp(arg_set[1]);

	scr_continue();



}
