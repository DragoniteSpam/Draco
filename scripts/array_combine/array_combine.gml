///	@param	array0..arrayn
function array_combine() {

	var s=0;
	for (var i=0; i<argument_count; i++){
		s+=array_length_1d(argument[i]);
	}

	var array=array_create(max(0, s-1), noone);
	var n=0;
	for (var i=0; i<argument_count; i++){
		for (var j=0; i<array_length_1d(argument[i]); j++){
			var base_array=argument[i];
			array[n++]=base_array[j];
		}
	}

	return array;


}
