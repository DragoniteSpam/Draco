/// @description  double GetCardinalDirection(angle);
/// @function  double GetCardinalDirection
/// @param angle

if (argument0<0)
    return DIR_NULL;
if (argument0<45||argument0>=315)
    return DIR_EAST;
if (argument0<135)
    return DIR_NORTH;
if (argument0<225)
    return DIR_WEST;
return DIR_SOUTH;
