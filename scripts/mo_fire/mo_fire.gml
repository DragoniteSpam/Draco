///	@description	Creates a burst of flames at cell x, cell y
///	@param	cellX
///	@param	cellY
///	@param	[duration]
function mo_fire() {

	var xxa=argument[0]*GRID_CELL_WIDTH;
	var yya=argument[1]*GRID_CELL_HEIGHT;
	var xx=xxa+GRID_CELL_WIDTH/2;
	var yy=yya+GRID_CELL_HEIGHT/2;
	var effect_time=15;
	switch (argument_count){
		case 3:
			effect_time=argument[2];
		case 2:
			break;
	}

	var emitter=instance_create_depth(xx, yy, DEPTH_PARTICLES, ParticleEmitterFire);
	emitter.alarm[0]=effect_time;

	return emitter;


}
