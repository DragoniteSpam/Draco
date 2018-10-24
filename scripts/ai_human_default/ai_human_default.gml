/// @description	Basic AI for people.
///	@param	battler
/// @param	options

var race=all_races[argument0.race];
var list=argument1;

// @todo Go through the options and find the one that has the greatest damage output (on Player).

for (var i=0; i<ds_list_size(list); i++){
	show_debug_message(list[| i])
}
return list[| irandom(ds_list_size(list)-1)];