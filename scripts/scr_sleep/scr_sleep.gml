/// @description  void scr_sleep();
/// @param	ArgSet
/* Opens up the "sleep" thing
 * syntax (in the _cc_Actors thing):
 *  scr_sleep
 */

var catch=argument0;

set_pause(PauseMenu.wait);
World.pause_end_action=PauseEndActions.ReturnFromSleep;
World.pausing=Player;
Player.free=false;