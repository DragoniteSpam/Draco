/// @description Insert description here

if (moving&&direction!=DIR_NULL){
	switch (direction){
		case Directions.west:
			target_x=xx-1;
			target_y=yy;
			break;
		case Directions.east:
			target_x=xx+1;
			target_y=yy;
			break;
		case Directions.north:
			target_x=xx;
			target_y=yy-1;
			break;
		case Directions.south:
			target_x=xx;
			target_y=yy+1;
			break;
	}
	var mspd=2;
	if (World.lights[# target_x, target_y]==noone&&World.grid[# target_x, target_y]==noone){
		if (World.lights[# xx, yy]==id){
			World.lights[# xx, yy]=noone;
		}
	    var tx=target_x*32;
	    var ty=target_y*32;
	    if (abs(tx-x)<mspd&&abs(ty-y)<mspd){
	        x=tx;
	        y=ty;
	    } else {
	        x=x+mspd*sign(tx-x);
	        y=y+mspd*sign(ty-y);
			xx=x div GRID_CELL_WIDTH;
			yy=y div GRID_CELL_HEIGHT;
	    }
		World.lights[# xx, yy]=id;
	} else {
		moving=false;
	}
}