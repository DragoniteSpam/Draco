///	@description	Returns whether the specified Character knkows a power.
///	@param	ActorIndex
///	@param	power

var actor=GetMyActor(argument0);
for (var i=0; i<ds_list_size(actor.powers); i++){
    if (actor.powers[| i].index==argument1)
        return actor.powers[| i];
}

return noone;
