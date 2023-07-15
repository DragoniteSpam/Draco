/// @description Insert description here
// You can write your code in this editor

ds_list_destroy(inventory);
ds_list_destroy(magic);
ds_list_destroy(shouts);
ds_list_destroy(powers);
ds_list_destroy(effects);

var cut=ds_map_find_first(cutscenes);
do {
	ds_list_destroy(cutscenes[? cut]);
	cut=ds_map_find_next(cutscenes, cut);
} until(is_undefined(cut));
ds_map_destroy(cutscenes);