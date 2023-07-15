/// @description  ItemStack HasItem(Solid, index);
/// @function  ItemStack HasItem
/// @param ActorIndex
/// @param  index
///	@param	[useStrictActor?]
function HasItem() {

	if (argument_count==3&&argument[2]){
		var actor=argument[0];
	} else {
		var actor=GetMyActor(argument[0]);
	}

	for (var i=0; i<ds_list_size(actor.inventory); i++){
	    if (actor.inventory[| i].index==argument[1])
	        return actor.inventory[| i];
	}

	return noone;



}
