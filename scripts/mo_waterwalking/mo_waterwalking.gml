if (!HasEffect(Actors.playable, AllEffects.Waterwalking)){
	AddActiveEffect(Actors.playable, AllEffects.Waterwalking, true, 60);
} else {
	AddNotification("You already have the ability to walk on water.");
}

var xxa=argument0*GRID_CELL_WIDTH;
var yya=argument1*GRID_CELL_HEIGHT;
var xx=xxa+GRID_CELL_WIDTH/2;
var yy=yya+GRID_CELL_HEIGHT/2;
var fire_time=30;

var emitter=instance_create_depth(xx, yy, DEPTH_PARTICLES, ParticleEmitterGeneric);
emitter.alarm[0]=fire_time;
emitter.type=Effects.glow_blue;

with (emitter){
	event_perform(ev_other, ev_user0);
}

return emitter;