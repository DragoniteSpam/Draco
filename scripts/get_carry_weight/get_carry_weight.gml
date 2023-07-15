///	@description	Gets the carry weight for the specified solid.
///	@param	Solid
function get_carry_weight(argument0) {

	var t=0;
	var actor=GetMyActor(argument0);

	for (var i=0; i<ds_list_size(actor.inventory); i++){
		var stack=actor.inventory[| i];
		var base_item=all_items[stack.index];
		t+=stack.quantity*base_item.weight;
	}

	return t;


}
