///	@description	Creates a burst of sparks at cell x, cell y
///	@param	cellX
///	@param	cellY
///	@param	[duration]

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

var emitter=instance_create_depth(xx, yy, DEPTH_PARTICLES, ParticleEmitterSparks);
emitter.alarm[0]=effect_time;

if (World.lights[# argument[0], argument[1]]==noone){
	with (instance_create_depth(xxa, yya, DEPTH_PARTICLES, NonSolidLightExpire)){
		alarm[0]=effect_time;
		alpha=1;
		peak_start=effect_time div 2;
		peak_end=peak_start;
		finish=effect_time;
		addSelfToLight();
	}
}

return emitter;