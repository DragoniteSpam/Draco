///	@description	Updates the in-game current minute.
///	@param amount
function game_clock_update_minute(argument0) {

	game_current_minute=game_current_minute+argument0;
	if (game_current_minute>=60){
	    game_clock_update_hour(game_current_minute div 60);
	    game_current_minute=game_current_minute%60;
	}


}
