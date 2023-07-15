/// @description  distance3D(x1, y1, z1, x2, y2, z2);
/// @function  distance3D
/// @param x1
/// @param  y1
/// @param  z1
/// @param  x2
/// @param  y2
/// @param  z2
function distance3D(argument0, argument1, argument2, argument3, argument4, argument5) {

	return sqrt((argument3-argument0)*(argument3-argument0)+
	    (argument4-argument1)*(argument4-argument1)+
	    (argument5-argument2)*(argument5-argument2));



}
