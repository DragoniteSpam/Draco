/// @description Checks to see if a coordinate is within the grid.
/// @param x The x coordinate to check
/// @param y The y coordinate to check
function inbounds(argument0, argument1) {

	return IsClamped(argument0, 0, ds_grid_width(World.grid)-1)&&IsClamped(argument1, 0, ds_grid_height(World.grid)-1);


}
