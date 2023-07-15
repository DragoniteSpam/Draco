function death_npc() {
	var temp_arg_set=args(scr_show_inventory, actor_index);
	scr_show_inventory(temp_arg_set, PauseEndActions.ReturnToGameNoContinue);
	temp_arg_set=noone;
	(GetMyActor()).alive=false;
	removeSelfFromGrid();


}
