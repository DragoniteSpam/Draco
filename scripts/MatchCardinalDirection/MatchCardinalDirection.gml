/// @description  double MatchCardinalDirection(angle, magnitude, dir);
/// @function  double MatchCardinalDirection
/// @param angle
/// @param  magnitude
/// @param  dir
function MatchCardinalDirection(argument0, argument1, argument2) {

	if (abs(argument1)<0.2)
	    return false;
	return ((argument0+360)>(argument2+315)&&(argument0+360)<=(argument2+405));



}
