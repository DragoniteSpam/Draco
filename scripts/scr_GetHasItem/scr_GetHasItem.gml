/// boolean scr_GetHasItem(ArgSet);
/*  In variable register:
    0. Item index
*/

var catch=argument0;

return (HasItem(Player, World.variable[0])!=noone);