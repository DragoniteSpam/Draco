/// @description  double GetStickMagnitude(r, u);
/// @function  double GetStickMagnitude
/// @param r
/// @param  u
function GetStickMagnitude(argument0, argument1) {

	if (abs(argument0)<0.1&&abs(argument1)<0.1)
	    return 0;

	return sqrt(argument0*argument0+argument1*argument1);



}
