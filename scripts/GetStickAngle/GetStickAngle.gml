/// @description  double GetStickAngle(r, u);
/// @function  double GetStickAngle
/// @param r
/// @param  u
function GetStickAngle(argument0, argument1) {

	if (abs(argument0)<0.1&&abs(argument1)<0.1)
	    return -1;

	return point_direction(0, 0, argument0, argument1);



}
