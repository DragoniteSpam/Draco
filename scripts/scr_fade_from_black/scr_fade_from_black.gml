function scr_fade_from_black() {
	/* Fades to black.
	 * syntax (in the _cc_Actors thing):
	 *  scr_sleep
	 */
	World.shade_target = 0;
	World.shade_alpha = 1;
}