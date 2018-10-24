/// @description  Creates a new Effect class.
/// @param name
/// @param  description
/// @param  default_false
///	@param	default_true
///	@param	compounding
// creates one, rather than giving you one; use at the beginning of the game

with (instantiate(EffectData)){
	name=argument[0];
	description=argument[1];
	def_false=argument[2];
	def_true=argument[3];
	compounding=argument[4];
	return id;
}