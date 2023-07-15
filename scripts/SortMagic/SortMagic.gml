///	@description	Sorts the magic menu of the specified Character.
///	@param	ActorIndex
///	@param	[useStrictActor?]
function SortMagic() {

	var array=array_create(MagicClasses.restoration);
	if (argument_count==2&&argument[1]){
		var actor=argument[0];
	} else {
		var actor=GetMyActor(argument[0]);
	}
	for (var i=MagicClasses.alteration; i<=MagicClasses.restoration; i++){
		array[i]=ds_priority_create();
	}
	while (!ds_list_empty(actor.magic)){
		var magic=actor.magic[| 0];
		var base_magic=all_effects[magic];
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


}
