function effect_water_splish(argument0, argument1) {
	var xxa=argument0*GRID_CELL_WIDTH;
	var yya=argument1*GRID_CELL_HEIGHT;
	var xx=xxa+GRID_CELL_WIDTH/2;
	var yy=yya+GRID_CELL_HEIGHT/2;
	var time=2;

	var emitter=instance_create_depth(xx, yy, DEPTH_PARTICLES_SUB, ParticleEmitterGeneric);
	emitter.type=Effects.water_ring;

	with (emitter){
		event_perform(ev_other, ev_user0);
		alarm[0]=time;
	}

	var emitter=instance_create_depth(xx, yy, DEPTH_PARTICLES, ParticleEmitterGeneric);
	emitter.type=Effects.water_splish;

	with (emitter){
		event_perform(ev_other, ev_user0);
		alarm[0]=time;
	}


}
