///	@description	Sets the default skills of the specified actor for their Race.
///	@param	Actor
function set_default_items(argument0) {

	var base_race=all_races[argument0.race];
	for (var i=0; i<array_length_1d(base_race.weapons); i++){
		AddItem(argument0, base_race.weapons[i], 1, false, true);
	}
	for (var i=0; i<array_length_1d(base_race.armor); i++){
		AddItem(argument0, base_race.weapons[i], 1, false, true);
	}
	for (var i=0; i<array_length_1d(base_race.items); i+=2){
		AddItem(argument0, base_race.items[i], irandom_range(0, base_race.items[i+1]), false, true);
	}


}
