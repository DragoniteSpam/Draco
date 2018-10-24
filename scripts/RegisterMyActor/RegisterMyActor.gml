///	@description	Returns the ActorData for the specified Solid.
///	@param	[index]

if (argument_count==0){
	var index=actor_index;
} else {
	var index=argument[0];
}

World.game_actors[index].alias=id;