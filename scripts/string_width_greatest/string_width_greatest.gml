/// @description	Returns the greatest string width from a ds_list.
///	@param	list
function string_width_greatest(argument0) {

	var m=0;
	for (var i=0; i<ds_list_size(argument0); i++){
		m=max(m, string_width(ds_list_find_value(argument0, i)));
	}

	return m;


}
