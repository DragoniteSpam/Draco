///	@description	Sorts the Shouts menu of the specified Character.
///	@param	Character

var q=ds_priority_create();
var actor=GetMyActor(argument0);

while (!ds_list_empty(actor.shouts)){
	var magic=actor.shouts[| 0];
	var base_magic=World.all_shouts[magic];
	ds_priority_add(q, magic, base_magic.name);
	ds_list_delete(actor.shouts, 0);
}
while (!ds_priority_empty(q)){
	var stack=ds_priority_find_min(q);
	ds_priority_delete_min(q);
	ds_list_add(actor.powers, stack);
}
ds_priority_destroy(q);