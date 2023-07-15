///	@description	Creates a burst of flames at cell x, cell y
///	@param	cellX
///	@param	cellY
function mo_magelight(argument0, argument1) {

	var xxa=argument0*GRID_CELL_WIDTH;
	var yya=argument1*GRID_CELL_HEIGHT;
	var xx=xxa+GRID_CELL_WIDTH/2;
	var yy=yya+GRID_CELL_HEIGHT/2;
	var second=game_get_speed(gamespeed_fps);
	var fire_time=second*60;

	if (World.lights[# argument0, argument1]==noone){
		with (instance_create_depth(xxa, yya, DEPTH_PARTICLES, NonSolidLightExpire)){
			alarm[0]=fire_time;
			alpha=1;
			peak_start=second;
			peak_end=fire_time-second;
			finish=fire_time;
			// Movement things (if you spawn the light in free space)
			if (is_free(argument0, argument1)){
				moving=true;
				direction=Player.direction;
			}
			addSelfToLight();
			return id;
		}
	}

	return noone;


}
