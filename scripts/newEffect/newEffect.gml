/// @description  Creates a new Effect class.
/// @param name
/// @param  description
/// @param  default_false
///	@param	default_true
///	@param	compounding
///	@param	[on_cast_script]
///	@param	[school]
///	@param	[level]
///	@param	[cost]
///	@param	[flag]
///	@param	[on_valid_target]
function newEffect() {
	// creates one, rather than giving you one; use at the beginning of the game

	with (instantiate(EffectData)){
		name=argument[0];
		description=argument[1];
		def_false=argument[2];
		def_true=argument[3];
		compounding=argument[4];
		switch (argument_count){
			case 11:
				on_valid_target=argument[10];
			case 10:
				on_cast=argument[5];
				school=argument[6];
				level=argument[7];
				cost=argument[8];
				flag=argument[9];
				break;
		}
		return id;
	}


}
