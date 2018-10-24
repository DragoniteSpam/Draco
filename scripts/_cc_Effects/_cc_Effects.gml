/// @description These are graphical effects. ActiveEffects can be found in _cc_Skills

enum Effects {
	smoke,
	fire,
	sparks,
	ice,
	glow_blue,
	water_ring,
	water_splish,
}

layer_particles_smoke=layer_create(DEPTH_PARTICLES);
layer_particles_sub=layer_create(DEPTH_PARTICLES_SUB);
var second=game_get_speed(gamespeed_fps);

// Smoke

var system_smoke=part_system_create_layer(layer_particles_smoke, true);
part_system_automatic_draw(system_smoke, true);
var type_smoke=part_type_create();
part_type_shape(type_smoke, pt_shape_cloud);
part_type_life(type_smoke, second*5, second*5);
part_type_direction(type_smoke, 90, 90, 0, 0);
part_type_orientation(type_smoke, 0, 360, 0, 0, false);
part_type_speed(type_smoke, 0.5, 0.5, 0.0, 0);
part_type_alpha3(type_smoke, 0, 1, 0);
part_type_color1(type_smoke, c_gray);
part_type_scale(type_smoke, 0.75, 0.75);

all_effect_systems[Effects.smoke]=system_smoke;
all_effect_types[Effects.smoke]=type_smoke;

// Destruction magic

var system_fire=part_system_create_layer(layer_particles_smoke, true);
part_system_automatic_draw(system_fire, true);
var type_fire=part_type_create();
part_type_shape(type_fire, pt_shape_spark);
part_type_life(type_fire, second/4, second/2);
part_type_direction(type_fire, 80, 100, 0, 0);
part_type_orientation(type_fire, 0, 360, 0, 0, false);
part_type_speed(type_fire, 1, 1.5, 0, 0);
part_type_alpha2(type_fire, 1, 0);
part_type_color2(type_fire, c_orange, c_red);
part_type_scale(type_fire, 0.25, 0.25);

all_effect_systems[Effects.fire]=system_fire;
all_effect_types[Effects.fire]=type_fire;

var system_sparks=part_system_create_layer(layer_particles_smoke, true);
part_system_automatic_draw(system_sparks, true);
var type_sparks=part_type_create();
part_type_shape(type_sparks, pt_shape_spark);
part_type_life(type_sparks, second/4, second/2);
part_type_direction(type_sparks, 0, 360, 0, 0);
part_type_orientation(type_sparks, 0, 360, 0, 0, false);
part_type_speed(type_sparks, 1, 1.5, 0, 0);
part_type_alpha2(type_sparks, 1, 0);
part_type_color2(type_sparks, c_yellow, c_yellow);
part_type_scale(type_sparks, 0.15, 0.15);

all_effect_systems[Effects.sparks]=system_sparks;
all_effect_types[Effects.sparks]=type_sparks;

var system_ice=part_system_create_layer(layer_particles_smoke, true);
part_system_automatic_draw(system_ice, true);
var type_ice=part_type_create();
part_type_shape(type_ice, pt_shape_spark);
part_type_life(type_ice, second/4, second/2);
part_type_direction(type_ice, 260, 280, 0, 0);
part_type_orientation(type_ice, 0, 360, 0, 0, false);
part_type_speed(type_ice, 0.4, 0.6, 0, 0);
part_type_alpha2(type_ice, 1, 0);
part_type_color2(type_ice, c_aqua, c_blue);
part_type_scale(type_ice, 0.25, 0.25);

all_effect_systems[Effects.ice]=system_ice;
all_effect_types[Effects.ice]=type_ice;

// Other schools of magic

var system_glow_blue=part_system_create_layer(layer_particles_smoke, true);
part_system_automatic_draw(system_glow_blue, true);
var type_glow_blue=part_type_create();
part_type_shape(type_glow_blue, pt_shape_spark);
part_type_life(type_glow_blue, second/4, second/2);
part_type_orientation(type_glow_blue, 0, 360, 0, 0, false);
part_type_speed(type_glow_blue, 0, 0, 0, 0);
part_type_alpha2(type_glow_blue, 1, 0);
part_type_color2(type_glow_blue, c_aqua, c_blue);
part_type_scale(type_glow_blue, 0.25, 0.25);

all_effect_systems[Effects.glow_blue]=system_glow_blue;
all_effect_types[Effects.glow_blue]=type_glow_blue;

// Water splishes and splashes

var system_water=part_system_create_layer(layer_particles_sub, true);

part_system_automatic_draw(system_water, true);
var part_type_water_ring=part_type_create();
part_type_shape(part_type_water_ring, pt_shape_circle);
part_type_life(part_type_water_ring, second/2, second);
part_type_speed(part_type_water_ring, 0, 0, 0, 0);
part_type_alpha3(part_type_water_ring, 1, 1, 0);
part_type_color1(part_type_water_ring, c_aqua);
part_type_scale(part_type_water_ring, 0.25, 0.25);
part_type_size(part_type_water_ring, 1, 1, 0.1, 0);

all_effect_systems[Effects.water_ring]=system_water;
all_effect_types[Effects.water_ring]=part_type_water_ring;

var part_type_water_splish=part_type_create();
part_type_shape(part_type_water_splish, pt_shape_disk);
part_type_life(part_type_water_splish, second/4, second/2);
part_type_speed(part_type_water_splish, 3.6, 4.4, 0, 0);
part_type_direction(part_type_water_splish, 60, 120, 0, 0);
part_type_gravity(part_type_water_splish, 0.25, 270);
part_type_color2(part_type_water_splish, c_aqua, c_blue);
part_type_alpha3(part_type_water_splish, 1, 1, 0);
part_type_scale(part_type_water_splish, 0.0625, 0.0625);

all_effect_systems[Effects.water_splish]=system_water;
all_effect_types[Effects.water_splish]=part_type_water_splish;