/// @param	target	Who takes the damage.
///	@param	type	The kind of damage (fire, ice, shock, nonelemental, etc)
///	@param	power	The strength of the blow.
///	@description	Apply damage to a target.
function APPLY_FIELD_DAMAGE(argument0, argument1, argument2) {

	var defense=get_defensive_elemental_modifier(argument0, argument1);

	AddHP(argument0, -argument2/defense);


}
