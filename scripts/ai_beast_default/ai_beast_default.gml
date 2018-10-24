/// @description	Basic AI for animals.
///	@param	battler
/// @param	options (unused)

var race=all_races[argument0.race];
var list=argument1;

return race.unarmed_attacks[irandom(array_length_1d(race.unarmed_attacks)-1)];