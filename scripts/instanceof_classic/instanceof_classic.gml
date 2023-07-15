/// @param	instance	The instance to check.
///	@param	object	The object to check
///	@description	Checks to see if an instance is an . . . uh, instance of an object class.
function instanceof_classic() {

	if (argument[0]==noone){
		return false;
	}

	if (argument[0].object_index==argument[1]){
		return true;
	}

	return object_is_ancestor(argument[0].object_index, argument[1]);


}
