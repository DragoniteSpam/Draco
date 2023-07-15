///	@description	Updates the in-game current second.
///	@param amount
function game_clock_update_second(argument0) {

	game_current_second=game_current_second+argument0;
	if (game_current_second>=60){
	    game_clock_update_minute(game_current_second div 60);
	    game_current_second=game_current_second%60;
	}


}
