/// @description Insert description here
// You can write your code in this editor

alarm[0]=60;

var system=all_effect_systems[Effects.smoke];
var part=all_effect_types[Effects.smoke];

part_emitter_burst(system, emitter, part, 1);