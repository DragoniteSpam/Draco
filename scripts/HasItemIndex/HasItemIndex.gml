///	@description	Returns whether the specified solid owns at least one of the specified item.
///	@param	item
///	@param	ActorIndex
function HasItemIndex(argument0, argument1) {

	var actor=GetMyActor(argument1);

	for (var i=0; i<ds_list_size(actor.inventory); i++){
	    if (actor.inventory[| i].index==argument0)
	        return i;
	}

	return noone;



}
