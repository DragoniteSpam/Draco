///	@description	Create a Conjouration burst. If the target is an Animal, it goes under your command.
///	@param	cellX
///	@param	cellY
///	@param	[duration]
function mo_command() {

	var xxa=argument[0]*GRID_CELL_WIDTH;
	var yya=argument[1]*GRID_CELL_HEIGHT;
	var xx=xxa+GRID_CELL_WIDTH/2;
	var yy=yya+GRID_CELL_HEIGHT/2;
	var fire_time=30;
	switch (argument_count){
		case 3:
			fire_time=argument[2];
			break;
	}

	var emitter=instance_create_depth(xx, yy, DEPTH_PARTICLES, ParticleEmitterGeneric);
	emitter.alarm[0]=fire_time;
	emitter.type=Effects.conjouration;

	with (emitter){
		event_perform(ev_other, ev_user0);
	}

	return emitter;


}
