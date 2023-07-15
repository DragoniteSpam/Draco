/// @description  Shows the inventory of the specified character, with the "exchange money" flag set to false.
/// @param	ArgSet
/// @param	[continue?]
function scr_show_inventory() {

	var arg_set=argument[0];

	set_pause(PauseMenu.inventory);
	World.pause_end_action=PauseEndActions.ReturnToGame;
	switch (argument_count){
		case 2:
			World.pause_end_action=argument[1];
			break;
	}
	World.pause_other_inventory=arg_set[1];

	World.pausing=Player;
	Player.free=false;
	World.pause_greater=PauseInventoryScreens.base;
	World.pause_exchange_money=false;

	World.pause_menu_offset=-256;


}
