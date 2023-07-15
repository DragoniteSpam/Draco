///	@description	Updates the in-game current hour.
///	@param amount
function game_clock_update_hour(argument0) {

	game_current_hour=game_current_hour+argument0;
	if (game_current_hour>=24){
	    game_clock_update_day(game_current_hour div 24);
	    game_current_hour=game_current_hour%24;
	}


}
