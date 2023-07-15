/// @description These are graphical effects. ActiveEffects can be found in _cc_Skills
function _cc_Effects() {

	enum Effects {
		smoke,
		fire,
		sparks,
		ice,
		glow_blue,
		water_ring,
		water_splish,
		conjouration,
		explosion,
		explosion_fire,
		drain_health_main,
		drain_health_trail,
		drain_stamina_main,
		drain_stamina_trail,
		drain_magicka_main,
		drain_magicka_trail,
		glow_white,
	}

	globalvar all_effect_systems, all_effect_types;

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

	var system_glow_white=part_system_create_layer(layer_particles_smoke, true);
	part_system_automatic_draw(system_glow_white, true);
	var type_glow_white=part_type_create();
	part_type_shape(type_glow_white, pt_shape_spark);
	part_type_life(type_glow_white, second/4, second/2);
	part_type_orientation(type_glow_white, 0, 360, 0, 0, false);
	part_type_speed(type_glow_white, 0, 0, 0, 0);
	part_type_alpha2(type_glow_white, 1, 0);
	part_type_color2(type_glow_white, c_white, c_white);
	part_type_scale(type_glow_white, 0.25, 0.25);

	all_effect_systems[Effects.glow_white]=system_glow_white;
	all_effect_types[Effects.glow_white]=type_glow_white;

	var system_conjouration=part_system_create_layer(layer_particles_smoke, true);
	part_system_automatic_draw(system_conjouration, true);
	var type_conjouration=part_type_create();
	part_type_shape(type_conjouration, pt_shape_spark);
	part_type_life(type_conjouration, second/4, second/2);
	part_type_orientation(type_conjouration, 0, 360, 1, 0, false);
	part_type_speed(type_conjouration, 0, 0, 0, 0);
	part_type_alpha2(type_conjouration, 1, 0);
	part_type_color2(type_conjouration, merge_colour(c_black, c_purple, 0.5), c_purple);
	part_type_scale(type_conjouration, 0.25, 0.25);

	all_effect_systems[Effects.conjouration]=system_conjouration;
	all_effect_types[Effects.conjouration]=type_conjouration;

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

	// Explosions

	var system_explosion=part_system_create_layer(layer_particles_smoke, true);
	part_system_automatic_draw(system_explosion, true);

	var part_type_explosion=part_type_create();
	part_type_shape(part_type_explosion, pt_shape_cloud);
	part_type_life(part_type_explosion, second/4, second/2);
	part_type_speed(part_type_explosion, 1, 2, 0, 0);
	part_type_direction(part_type_explosion, 0, 360, 0, 0);
	part_type_orientation(part_type_explosion, 0, 360, 0, 0, false);
	part_type_color2(part_type_explosion, c_dkgray, c_gray);
	part_type_alpha2(part_type_explosion, 1, 0);
	part_type_scale(part_type_explosion, 0.5, 0.75);

	all_effect_systems[Effects.explosion]=system_explosion;
	all_effect_types[Effects.explosion]=part_type_explosion;

	var part_type_explosion_fire=part_type_create();
	part_type_shape(part_type_explosion_fire, pt_shape_spark);
	part_type_life(part_type_explosion_fire, second/4, second/2);
	part_type_direction(part_type_explosion_fire, 0, 360, 0, 0);
	part_type_orientation(part_type_explosion_fire, 0, 360, 0, 0, false);
	part_type_speed(part_type_explosion_fire, 1, 1.5, 0, 0);
	part_type_alpha2(part_type_explosion_fire, 1, 0);
	part_type_color2(part_type_explosion_fire, c_orange, c_red);
	part_type_scale(part_type_explosion_fire, 0.15, 0.25);

	all_effect_systems[Effects.explosion_fire]=system_explosion;
	all_effect_types[Effects.explosion_fire]=part_type_explosion_fire;

	// Drain effects: Health

	var system_drain=part_system_create_layer(layer_particles_smoke, true);
	part_system_automatic_draw(system_drain, true);

	var part_type_drain_health_main=part_type_create();
	part_type_shape(part_type_drain_health_main, pt_shape_spark);
	part_type_life(part_type_drain_health_main, second/4, second/2);
	part_type_direction(part_type_drain_health_main, 0, 360, 0, 0);
	part_type_orientation(part_type_drain_health_main, 0, 360, 0, 0, false);
	part_type_speed(part_type_drain_health_main, 0, 0, 0, 0);
	part_type_alpha2(part_type_drain_health_main, 1, 0);
	part_type_color2(part_type_drain_health_main, c_pink, c_pink);
	part_type_scale(part_type_drain_health_main, 0.25, 0.35);

	all_effect_systems[Effects.drain_health_main]=system_drain;
	all_effect_types[Effects.drain_health_main]=part_type_drain_health_main;

	var part_type_drain_health_trail=part_type_create();
	part_type_shape(part_type_drain_health_trail, pt_shape_spark);
	part_type_life(part_type_drain_health_trail, second/2, second/2);
	part_type_direction(part_type_drain_health_trail, 0, 0, 0, 0);
	part_type_orientation(part_type_drain_health_trail, 0, 360, 0, 0, false);
	part_type_speed(part_type_drain_health_trail, 1, 1.25, 0, 0);
	part_type_alpha2(part_type_drain_health_trail, 1, 0);
	part_type_color2(part_type_drain_health_trail, c_pink, c_pink);
	part_type_scale(part_type_drain_health_trail, 0.05, 0.1);

	all_effect_systems[Effects.drain_health_trail]=system_drain;
	all_effect_types[Effects.drain_health_trail]=part_type_drain_health_trail;

	// Drain effects: Stamina

	var part_type_drain_stamina_main=part_type_create();
	part_type_shape(part_type_drain_stamina_main, pt_shape_spark);
	part_type_life(part_type_drain_stamina_main, second/4, second/2);
	part_type_direction(part_type_drain_stamina_main, 0, 360, 0, 0);
	part_type_orientation(part_type_drain_stamina_main, 0, 360, 0, 0, false);
	part_type_speed(part_type_drain_stamina_main, 0, 0, 0, 0);
	part_type_alpha2(part_type_drain_stamina_main, 1, 0);
	part_type_color2(part_type_drain_stamina_main, c_lime, c_lime);
	part_type_scale(part_type_drain_stamina_main, 0.25, 0.35);

	all_effect_systems[Effects.drain_stamina_main]=system_drain;
	all_effect_types[Effects.drain_stamina_main]=part_type_drain_stamina_main;

	var part_type_drain_stamina_trail=part_type_create();
	part_type_shape(part_type_drain_stamina_trail, pt_shape_spark);
	part_type_life(part_type_drain_stamina_trail, second/2, second/2);
	part_type_direction(part_type_drain_stamina_trail, 0, 0, 0, 0);
	part_type_orientation(part_type_drain_stamina_trail, 0, 360, 0, 0, false);
	part_type_speed(part_type_drain_stamina_trail, 1, 1.25, 0, 0);
	part_type_alpha2(part_type_drain_stamina_trail, 1, 0);
	part_type_color2(part_type_drain_stamina_trail, c_aqua, c_aqua);
	part_type_scale(part_type_drain_stamina_trail, 0.05, 0.1);

	all_effect_systems[Effects.drain_stamina_trail]=system_drain;
	all_effect_types[Effects.drain_stamina_trail]=part_type_drain_stamina_trail;

	// Drain effects: Magicka

	var part_type_drain_magicka_main=part_type_create();
	part_type_shape(part_type_drain_magicka_main, pt_shape_spark);
	part_type_life(part_type_drain_magicka_main, second/4, second/2);
	part_type_direction(part_type_drain_magicka_main, 0, 360, 0, 0);
	part_type_orientation(part_type_drain_magicka_main, 0, 360, 0, 0, false);
	part_type_speed(part_type_drain_magicka_main, 0, 0, 0, 0);
	part_type_alpha2(part_type_drain_magicka_main, 1, 0);
	part_type_color2(part_type_drain_magicka_main, c_aqua, c_aqua);
	part_type_scale(part_type_drain_magicka_main, 0.25, 0.35);

	all_effect_systems[Effects.drain_magicka_main]=system_drain;
	all_effect_types[Effects.drain_magicka_main]=part_type_drain_magicka_main;

	var part_type_drain_magicka_trail=part_type_create();
	part_type_shape(part_type_drain_magicka_trail, pt_shape_spark);
	part_type_life(part_type_drain_magicka_trail, second/2, second/2);
	part_type_direction(part_type_drain_magicka_trail, 0, 0, 0, 0);
	part_type_orientation(part_type_drain_magicka_trail, 0, 360, 0, 0, false);
	part_type_speed(part_type_drain_magicka_trail, 1, 1.25, 0, 0);
	part_type_alpha2(part_type_drain_magicka_trail, 1, 0);
	part_type_color2(part_type_drain_magicka_trail, c_aqua, c_aqua);
	part_type_scale(part_type_drain_magicka_trail, 0.05, 0.1);

	all_effect_systems[Effects.drain_magicka_trail]=system_drain;
	all_effect_types[Effects.drain_magicka_trail]=part_type_drain_magicka_trail;


}
