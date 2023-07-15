function _gcfr(argument0, argument1) {
	if (argument0==0)
	    return argument1;
	return _gcfr(argument1%argument0, argument0);



}
