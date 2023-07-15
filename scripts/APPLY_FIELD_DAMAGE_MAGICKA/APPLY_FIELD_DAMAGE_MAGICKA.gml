/// @param	target	Who takes the damage.
///	@param	power	The strength of the blow.
///	@description	Apply magicka damage to a target.
function APPLY_FIELD_DAMAGE_MAGICKA(argument0, argument1) {

	AddMP(argument0, -argument1);


}
