/// @description  void scr_fade_to_black();
/// @param	ArgSet
/* Fades to black.
 * syntax (in the _cc_Actors thing):
 *  scr_sleep
 */

var catch=argument0;

World.shade_target=0;
World.shade_alpha=1;