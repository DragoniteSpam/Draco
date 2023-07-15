function scr_GetHasItem() {
	/*  In variable register:
	    0. Item index
	*/
	return (HasItem(Player, World.variable[0]) != noone);
}