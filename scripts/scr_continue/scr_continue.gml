/// @description  Continues the currently active cutscene.
function scr_continue() {

	scene_index++;
	var actor=GetMyActor(active.actor_index);
	if (scene_index==ds_list_size(actor.cutscenes[? active.cutscene_index])){
	    scene_index=0;
	    active=noone;
	} else {
	    scr_set_scene(active, active.cutscene_index, scene_index);
	}



}
