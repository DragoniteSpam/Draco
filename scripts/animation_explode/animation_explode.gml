function animation_explode() {
	var emitter=instance_create_depth(argument[0], argument[1], DEPTH_PARTICLES, ParticleEmitterExplosion);
	emitter.fire_time=argument[2];

	return emitter;


}
