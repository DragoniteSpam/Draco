/// @description	carries out ONE script if the condition is met
/// @param	ArgSet
function scr_do_if(argument0) {
	/* syntax:
	 *  scr_do_if, condition script, comparison enum, condition value
	 */

	var arg_set=argument0;

	// condition script is a[1]
	// script to execute starts at a[4]

	// pass the 1st argument (the condition script) as well as the arg_set
	if (scr_if(script_execute(arg_set[1], arg_set), arg_set[2], arg_set[3])){
	    // Have to create a temporary arg set because you're not allowed
		// to change the contents of the original, lest it need to be
	    // called again later (which it probably will be).
	    var temporary_arg_set=array_create(array_length_1d(arg_set)-3);
	    for (var i=4; i<array_length_1d(arg_set); i++){
	        temporary_arg_set[i-4]=arg_set[i];
	    }
	    script_execute(temporary_arg_set[0], temporary_arg_set);
	} else {
	    scr_continue();
	}


}
