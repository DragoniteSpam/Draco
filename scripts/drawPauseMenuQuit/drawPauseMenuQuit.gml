///	@description	Returns from the pause menu (or potentially other menus) to the Rose, or to the game, or to something else.
switch (pause_end_action){
	case PauseEndActions.ReturnToRose:
		pause_stage=PauseMenu.rose;
		break;
	case PauseEndActions.ReturnToGame:
		pause_game(noone);
		scr_continue();
		break;
}