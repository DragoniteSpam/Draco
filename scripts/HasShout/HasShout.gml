///	@description	Returns whether the specified Character knkows a shout.
///	@param	ActorIndex
///	@param	power

var actor=GetMyActor(argument0);
for (var i=0; i<ds_list_size(actor.shouts); i++){
    if (actor.shouts[| i].index==argument1)
        return actor.shouts[| i];
}

return noone;
