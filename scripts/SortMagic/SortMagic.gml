///	@description	Sorts the magic menu of the specified Character.
///	@param	ActorIndex

var array=array_create(MagicClasses.restoration);
var actor=GetMyActor(argument0);
for (var i=MagicClasses.alteration; i<=MagicClasses.restoration; i++){
	array[i]=ds_priority_create();
}
while (!ds_list_empty(actor.magic)){
	var magic=actor.magic[| 0];
	var base_magic=World.all_magic[magic];
	ds_priority_add(array[base_magic.school], magic, base_magic.name);
	ds_list_delete(actor.magic, 0);
}
for (var i=MagicClasses.alteration; i<=MagicClasses.restoration; i++){
	while (!ds_priority_empty(array[i])){
		var stack=ds_priority_find_min(array[i]);
		ds_priority_delete_min(array[i]);
		ds_list_add(actor.magic, stack);
	}
	ds_priority_destroy(array[i]);
}