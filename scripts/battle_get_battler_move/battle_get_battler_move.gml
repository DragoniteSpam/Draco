///	@description	Uses the AI to select a move for the chosen battler.
///	@param	battler

var options=battle_get_battle_options(argument0);

var result=script_execute(all_races[argument0.race].ai, argument0, options);

ds_list_destroy(options);

return result;