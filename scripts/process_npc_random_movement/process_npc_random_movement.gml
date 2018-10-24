// random movement, for NPCs
switch (irandom_range(1, 300/movement_factor)){
    case 1:
        target_x++;
        break;
    case 2:
        target_x--;
        break;
    case 3:
        target_y++;
        break;
    case 4: 
        target_y--;
        break;
}

if (point_distance(origin_xx, origin_yy, target_x, target_y)>movement_radius){
	target_x=xx;
	target_y=yy;
}