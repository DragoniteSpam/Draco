///	@description	Create a Conjouration burst.
///	@param	cellX
///	@param	cellY
///	@param	[duration]
function mo_soultrap() {

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

	var emitter=animation_conjouration(xx, yy, fire_time);

	return emitter;


}
