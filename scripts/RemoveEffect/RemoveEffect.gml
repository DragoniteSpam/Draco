/// @description	Removes an active effect.
///	@param	Actor
///	@param	Index
function RemoveEffect(argument0, argument1) {

	ds_list_delete(GetMyActor(argument0).effects, argument1);


}
