///	@description	Creates an explosion animation (particle emitter).
///	@param	x
///	@param	y
///	@param	fire_time
///	@return	The particle emitter
function animation_alteration() {

	var emitter=instance_create_depth(argument[0], argument[1], DEPTH_PARTICLES, ParticleEmitterGeneric);
	emitter.alarm[0]=argument[2];
	emitter.type=Effects.glow_blue;

	with (emitter){
		event_perform(ev_other, ev_user0);
	}

	return emitter;


}
