/// @description  Fully restores an actor's health
/// @param	ArgSet
///	scr_restore_health_full, actor
function scr_restore_stamina_full(argument0) {

	var arg_set=argument0;
	var actor=GetMyActor(arg_set[1]);

	actor.st_act_sp=get_max_sp(arg_set[1]);

	scr_continue();



}
