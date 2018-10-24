/// @description  Turn to face the specified target
/// @param	ArgSet
///	scr_turn_to_face, active, target

var arg_set=argument0;
var actor=GetMyActor(arg_set[1]).alias;

switch (GetMyActor(arg_set[2]).alias.direction){
    case Directions.north:
        actor.direction=Directions.south;
        break;
    case Directions.south:
    default:
        actor.direction=Directions.north;
        break;
    case Directions.east:
        actor.direction=Directions.west;
        break;
    case Directions.west:
        actor.direction=Directions.east;
        break;
}

scr_continue();
