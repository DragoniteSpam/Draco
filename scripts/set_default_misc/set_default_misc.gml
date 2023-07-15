///	@description	Sets the default skills of the specified actor for their Race.
///	@param	Actor
function set_default_misc(argument0) {

	var base_race=all_races[argument0.race];
	for (var i=0; i<array_length_1d(base_race.spells); i++){
		TeachSpell(argument0, base_race.spells[i], false, true);
	}


}
