/// @description Insert description here
// You can write your code in this editor

part_emitter_destroy(all_effect_systems[Effects.glow_white], emitter);

if (light!=noone){
	with (light){
		instance_destroy();
	}
}