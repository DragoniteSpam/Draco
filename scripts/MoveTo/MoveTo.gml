var actor=GetMyActor(argument0).alias;

if (actor!=noone){
	with (actor){
		removeSelfFromGrid();
        xx=argument1;
        yy=argument2;
		x=xx*GRID_CELL_WIDTH;
		y=yy*GRID_CELL_HEIGHT;
		to_x=xx;
		to_y=yy;
		target_x=xx;
		target_y=yy;
		addSelfToGrid();
	}
}