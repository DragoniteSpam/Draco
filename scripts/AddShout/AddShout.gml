/// @description  Adds a Shout.
/// @param ActorIndex
/// @param  Shout
function AddShout(argument0, argument1) {

	var shout=HasShout(argument0, argument1);

	if (shout==noone){
		with (instantiate(DragonShout)){
			index=argument1;
			ds_list_add(GetMyActor(argument0).shouts, id);
		}
	} else {
		shout.words=min(3, ++shout.words);
	}


}
