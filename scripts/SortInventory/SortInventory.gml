///	@description	Sorts the inventory of the specified Solid.
///	@param	Solid

var actor=GetMyActor(argument0);
var array=array_create(ItemClasses.misc);
for (var i=ItemClasses.weapon; i<=ItemClasses.misc; i++){
	array[i]=ds_priority_create();
}
while (!ds_list_empty(actor.inventory)){
	var stack=actor.inventory[| 0];
	var base_item=World.all_items[stack.index];
	ds_priority_add(array[base_item.class], stack, base_item.name);
	ds_list_delete(actor.inventory, 0);
}
for (var i=ItemClasses.weapon; i<=ItemClasses.misc; i++){
	while (!ds_priority_empty(array[i])){
		var stack=ds_priority_find_min(array[i]);
		ds_priority_delete_min(array[i]);
		ds_list_add(actor.inventory, stack);
	}
	ds_priority_destroy(array[i]);
}