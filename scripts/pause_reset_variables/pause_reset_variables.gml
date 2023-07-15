function pause_reset_variables() {
	// Pause menu.
	pause_stage=PauseMenu.rose;
	pause_rose_direction=Directions.no;
	pause_greater=PauseInventoryScreens.base;	// are you in the outer position in the sub menu?
	pause_greater_position=0;
	pause_lesser_position=0;
	pause_end_action=PauseEndActions.ReturnToRose;
	pause_exchange_money=false;
	pause_other_inventory=noone;
	pause_inventory_transaction_quantity=1;
	pause_inventory_temp_category=-1;
	pause_inventory_temp_owner=noone;

	pause_boolean_position=false;
	pause_wait_hours=1;
	pause_wait_alpha=0;

	lock_cursor=false;
	info="";

	// Paues graphics.
	pause_rose_alpha=0.75;
	pause_menu_offset=0;
	pause_menu_image_index=0;

	// Pause settings.
	pause_base_alpha=0.5;


}
