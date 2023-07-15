/// @description  object addSelfToGrid();
/// @function  object addSelfToGrid
function addSelfToGrid() {
	// if there's anything already in the grid, it gets overwritten (but returned).

	var n=World.grid[# xx, yy];

	World.grid[# xx, yy]=id;
	mp_grid_add_cell(World.ai_grid, xx, yy);

	return n;



}
