with (World){
	if (game_current_hour<6||game_current_hour>20){
	    return Misc.night;
	} else if (game_current_hour<12){
	    return Misc.morning;
	} else if (game_current_hour<16){
	    return Misc.afternoon;
	}

	return Misc.evening;
}