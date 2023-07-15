function scr_restart() {
	/* Restarts the game.
	 * syntax (in the _cc_Actors thing):
	 *  scr_restart
	 */
	var player = GetMyActor(Actors.playable);
	player.xx = 10;
	player.yy = 7;
	player.x = player.xx * GRID_CELL_WIDTH;
	player.y = player.yy * GRID_CELL_HEIGHT;
	// @todo clear everything the player shouldn't have like spells,
	// shouts, active effects, etc.

	scr_continue();
}