/// @description  Shows the inventory of the specified character, with the "exchange money" flag set to true.
/// @param	ArgSet
function scr_show_shop(argument0) {

	var arg_set=argument0;

	set_pause(PauseMenu.inventory);
	World.pause_end_action=PauseEndActions.ReturnToGame;
	World.pause_other_inventory=arg_set[1];

	World.pausing=Player;
	Player.free=false;
	World.pause_greater=PauseInventoryScreens.base;
	World.pause_exchange_money=true;

	World.pause_menu_offset=-256;


}
