/// @description Insert description here
// You can write your code in this editor

var system=all_effect_systems[Effects.drain_health_main];

from=noone;
to=noone;

emitter=part_emitter_create(system);
part_emitter_region(system, emitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear);

alarm[0]=30;