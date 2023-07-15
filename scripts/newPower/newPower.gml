///	@description	Instantiates a Power.
///	@param	name
///	@param	expiration
///	@param	limited
///	@param	description
function newPower(argument0, argument1, argument2, argument3) {

	with (instantiate(ShoutData)){
		name=argument0;
		expiration=argument1;
		day_limit=argument2;
		description=argument3;
		return id;
	}


}
