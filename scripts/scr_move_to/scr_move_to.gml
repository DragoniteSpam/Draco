/// @description  Moves you to a new map, totally not named after the function in Skyrim.
/// @param	ArgSet
function scr_move_to(argument0) {
	//	scr_move_to, ActorIndex, x, y

	var arg_set=argument0;
	var actor=GetMyActor(arg_set[1]);
	MoveTo(arg_set[1], arg_set[2], arg_set[3]);

	if (arg_set[1]==Actors.playable&&actor.alias.follower!=Actors.no){
		switch (actor.alias.direction){
			case Directions.north:
				var xx=arg_set[2];
				var yy=arg_set[3]+1;
				break;
			case Directions.south:
				var xx=arg_set[2];
				var yy=arg_set[3]-1;
				break;
			case Directions.east:
				var xx=arg_set[2]-1;
				var yy=arg_set[3];
				break;
			case Directions.west:
				var xx=arg_set[2]+1;
				var yy=arg_set[3];
				break;
		}
		MoveTo(actor.alias.follower, xx, yy);
	}

	scr_continue();


}
