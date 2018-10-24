/// @description  ItemStack HasItem(Solid, index);
/// @function  ItemStack HasItem
/// @param ActorIndex
/// @param  index

var actor=GetMyActor(argument0);

for (var i=0; i<ds_list_size(actor.inventory); i++){
    if (actor.inventory[| i].index==argument1)
        return actor.inventory[| i];
}

return noone;
