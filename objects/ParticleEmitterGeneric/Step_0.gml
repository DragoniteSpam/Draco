/// @description Insert description here
// You can write your code in this editor

var system=World.all_effect_systems[type];
var part=World.all_effect_types[type];

part_emitter_burst(system, emitter, part, irandom_range(range_lower, range_upper));