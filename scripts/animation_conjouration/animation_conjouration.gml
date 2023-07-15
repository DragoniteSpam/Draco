///	@description	Creates an explosion animation (particle emitter).
///	@param	x
///	@param	y
///	@param	fire_time
///	@return	The particle emitter
function animation_conjouration(argument0, argument1, argument2) {

	var emitter=instance_create_depth(argument0, argument1, DEPTH_PARTICLES, ParticleEmitterGeneric);
	emitter.alarm[0]=argument2;
	emitter.type=Effects.conjouration;

	with (emitter){
		event_perform(ev_other, ev_user0);
	}

	return emitter;


}
