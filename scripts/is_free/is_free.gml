/// @description  boolean is_free(xx, yy);
/// @function  boolean is_free
/// @param xx
/// @param  yy

if (!inbounds(argument0, argument1)){
	return false;
}
return World.grid[# argument0, argument1]==noone;
