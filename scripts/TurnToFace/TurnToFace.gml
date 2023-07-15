///	@param	actor
///	@param	target
function TurnToFace(argument0, argument1) {

	var actor=GetMyActor(argument0).alias;
	var target=GetMyActor(argument1).alias;

	var dx=target.xx-actor.xx;
	var dy=target.yy-actor.yy;

	if (dx==0&&dy==1){
		actor.direction=Directions.south;
	} else if (dx==1&&dy==0){
		actor.direction=Directions.east;
	} else if (dx==0&&dy==-1){
		actor.direction=Directions.north;
	} else if (dx==-1&&dy==0){
		actor.direction=Directions.west;
	}


}
