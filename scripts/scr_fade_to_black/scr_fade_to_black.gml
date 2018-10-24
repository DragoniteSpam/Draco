/// @description  void scr_fade_from_black();
/// @param	ArgSet
/* Fades from black.
 * syntax (in the _cc_Actors thing):
 *  scr_sleep
 */

var catch=argument0;

World.shade_target=1;
World.shade_alpha=0;