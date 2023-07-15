/// @description  Arguments args(script, arg0, arg1..argn);
/// @function  Arguments args
/// @param script
/// @param  arg0
/// @param  arg1..argn
function args() {
	// for creating scripting things, mainly, but I guess you can
	// also use this to index other things too
	var a=array_create(argument_count);

	for (var i=argument_count-1; i>=0; i--){
	    a[i]=argument[i];
	}

	return a;



}
