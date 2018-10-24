///	@description	Instantiates a Power.
///	@param	name
///	@param	expiration
///	@param	limited
///	@param	description

with (instantiate(ShoutData)){
	name=argument0;
	expiration=argument1;
	day_limit=argument2;
	description=argument3;
	return id;
}