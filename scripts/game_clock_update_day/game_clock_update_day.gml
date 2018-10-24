///	@description	Updates the in-game current day.
///	@param amount

with (World){
    game_current_day=game_current_day+argument0;
    if (game_current_hour>=28){
        switch (game_current_month){
            case Misc.January:
            case Misc.March:
            case Misc.May:
            case Misc.July:
            case Misc.August:
            case Misc.October:
            case Misc.December:
                if (game_current_day>=31){
                    game_clock_update_month(game_current_day div 31);
                    game_current_day=game_current_day%31;
                }
                break;
            case Misc.February:
                game_clock_update_month(game_current_day div 28);
                game_current_day=game_current_day%28;
                break;
            default:
                if (game_current_day>=30){
                    game_clock_update_month(game_current_day div 30);
                    game_current_day=game_current_day%30;
                }
                break;
        }
    }
}