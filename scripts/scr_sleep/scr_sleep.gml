function scr_sleep() {
	/* Opens up the "sleep" thing
	 * syntax (in the _cc_Actors thing):
	 *  scr_sleep
	 */
	set_pause(PauseMenu.wait);
	World.pause_end_action = PauseEndActions.ReturnFromSleep;
	World.pausing = Player;
	Player.free = false;
}