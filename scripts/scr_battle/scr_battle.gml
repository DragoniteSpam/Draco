/// @description  void scr_battle();
/// @param	ArgSet
function scr_battle(argument0) {
	// Sets an Actor to go into battle with another Actor
	// scr_talk actor_agressor, actor_target

	var arg_set=argument0;

	var agressor=GetMyActor(arg_set[1]);

	agressor.target=arg_set[2];

	scr_continue();


}
