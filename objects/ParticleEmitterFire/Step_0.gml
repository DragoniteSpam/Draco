/// @description Insert description here
// You can write your code in this editor

var system=World.all_effect_systems[Effects.fire];
var part=World.all_effect_types[Effects.fire];

part_emitter_burst(system, emitter, part, irandom_range(2, 4));