///	@description	Teaches the specified Character a power.
///	@param	ActorIndex
///	@param	Power

var p=HasPower(argument0, argument1);

if (p==noone){
	with (instantiate(PlayerPower)){
		index=argument1;
		ds_list_add(GetMyActor(argument0).powers, id);
	}
}