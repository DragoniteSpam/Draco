/// @description  int GCF(a, b);
/// @function  int GCF
/// @param a
/// @param  b
function GCF(argument0, argument1) {
	// automatically rounds to int

	if (argument0==0)
	    return argument1;
	return _gcfr (argument1%argument0, argument0);




}
