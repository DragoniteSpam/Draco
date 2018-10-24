/// @description  object addSelfToGrid();
/// @function  object addSelfToGrid
// if there's anything already in the grid, it gets overwritten (but returned).

var n=World.grid[# xx, yy];

World.grid[# xx, yy]=id;

return n;
