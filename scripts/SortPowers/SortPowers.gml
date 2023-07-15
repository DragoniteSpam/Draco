///	@description	Sorts the powers menu of the specified Character.
///	@param	Character
function SortPowers(argument0) {

	var q=ds_priority_create();
	var actor=GetMyActor(argument0);

	while (!ds_list_empty(actor.powers)){
		var magic=actor.powers[| 0];
		var base_magic=all_powers[magic];
		ds_priority_add(q, magic, base_magic.name);
		ds_list_delete(actor.powers, 0);
	}
	while (!ds_priority_empty(q)){
		var stack=ds_priority_find_min(q);
		ds_priority_delete_min(q);
		ds_list_add(actor.powers, stack);
	}
	ds_priority_destroy(q);


}
