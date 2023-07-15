function scr_fade_to_black() {
	/* Fades from black.
	 * syntax (in the _cc_Actors thing):
	 *  scr_sleep
	 */
	World.shade_target = 1;
	World.shade_alpha = 0;
}