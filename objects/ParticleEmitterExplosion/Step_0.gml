/// @description Insert description here
// You can write your code in this editor

var system=all_effect_systems[Effects.explosion];
var part=all_effect_types[Effects.explosion];
var part2=all_effect_types[Effects.explosion_fire];

part_emitter_burst(system, emitter, part, 4);
part_emitter_burst(system, emitter, part2, 4);