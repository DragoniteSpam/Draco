/// @description  void removeSelfFromGrid();
/// @function  void removeSelfFromGrid
function removeSelfFromGrid() {

	World.grid[# xx, yy]=noone;
	mp_grid_clear_cell(World.ai_grid, xx, yy);


}
