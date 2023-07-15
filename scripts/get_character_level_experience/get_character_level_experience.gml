///	@description	Returns the amount of experience needed to reach the current level, for the character.
///	@param	level
function get_character_level_experience(argument0) {

	return (100*power(argument0+2.5, 2)-1225)/8;


}
