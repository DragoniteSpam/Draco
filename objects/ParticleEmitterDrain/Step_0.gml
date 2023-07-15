/// @description Insert description here
// You can write your code in this editor

var system=all_effect_systems[type];
var part=all_effect_types[type];
var part2=all_effect_types[type2];

part_emitter_burst(system, emitter, part, irandom_range(2, 4));

if (from!=noone||to!=noone){
	var dir=point_direction(from.alias.x, from.alias.y, to.alias.x, to.alias.y);
	part_type_direction(part2, dir-10, dir+10, 0, 0);

	part_emitter_burst(system, emitter, part2, irandom_range(2, 4));
}