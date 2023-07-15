/// @description  Turn to face the specified target
/// @param	ArgSet
///	scr_cutscebe_set, actor, cutscene, reset cutscene index?
function scr_cutscene_set(argument0) {

	var arg_set=argument0;
	var actor=GetMyActor(arg_set[1]);
	actor.alias.cutscene_index=arg_set[2];

	if (arg_set[3]){
		World.scene_index=0;
	}

	scr_continue();



}
