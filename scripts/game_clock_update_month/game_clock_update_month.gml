///	@description	Updates the in-game current month.
///	@param amount
function game_clock_update_month(argument0) {

	var cm=game_current_month-1+argument0;
	if (cm>=12){
	    game_current_year=game_current_year+(cm div 12);
	    cm=cm%12;
	}
	game_current_month=cm+1;


}
