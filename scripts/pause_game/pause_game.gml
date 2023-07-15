/// @description  void pause_game(target);
/// @function  void pause_game
/// @param target
function pause_game(argument0) {
	/* if the target is noone, the menu closes
	 * if the target is the player, you get to see your stats/inventory
	 * if the target is some other NPC, you get to see their stats/inventory
	 */

	World.pausing=argument0;
	Player.free=(argument0==noone);

	if (argument0!=noone){
	    set_pause(PauseMenu.rose);
		World.state_sepia_target=SEPIA_TONE;
	} else {
		World.state_sepia_target=0;
	}

	pause_reset_variables();


}
