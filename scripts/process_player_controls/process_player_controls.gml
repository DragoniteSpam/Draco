/// @description  void process_controls();
/// @function  void process_controls

if (free){
	// If you enter direction input, set the movement target
	// AND NOTHING ELSE
	if (Controller.left){
		target_x--;
	}
	if (Controller.right){
		target_x++;
	}
	if (Controller.up){
		target_y--;
	}
	if (Controller.down){
		target_y++;
	}
	if (Controller.l2){
		mspd=4;
	} else {
		mspd=2;
	}
	if (Controller.release_rs){
		sneaking=!sneaking;
	}
	if (sneaking){
		mspd=1;
		// @todo perk for "run while sneaking"
	}
	if (follower!=Actors.no){
		var f=GetMyActor(follower).alias;
		f.mspd=mspd;
		f.sneaking=sneaking;
	}
}
