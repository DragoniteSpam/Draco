/// @description Set up the light and particle emitter

var system=all_effect_systems[Effects.explosion];

emitter=part_emitter_create(system);
part_emitter_region(system, emitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear);

var part2=all_effect_types[Effects.explosion_fire];
part_emitter_burst(system, emitter, part2, 4);

alarm[0]=60;

if (World.lights[# x div GRID_CELL_WIDTH, y div GRID_CELL_HEIGHT]==noone){
	light=instance_create_depth(x-GRID_CELL_WIDTH/2, y-GRID_CELL_HEIGHT/2, DEPTH_PARTICLES, NonSolidLight);
} else {
	light=noone;
}