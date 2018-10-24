/// @description Insert description here
// You can write your code in this editor

var system=World.all_effect_systems[type];
var part=World.all_effect_types[type];

emitter=part_emitter_create(system);
part_emitter_region(system, emitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear);

alarm[0]=15;