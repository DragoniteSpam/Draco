///	@description	Returns the ActorData for the specified Solid.
///	@param	[index]
function GetMyActor() {

	if (argument_count==0){
		var index=actor_index;
	} else {
		var index=argument[0];
	}
	return World.game_actors[index];


}
