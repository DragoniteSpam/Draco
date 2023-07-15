function death_banished() {
	animation_explode(x+GRID_CELL_WIDTH/2, y+GRID_CELL_HEIGHT/2, 30);

	(GetMyActor()).alive=false;
	removeSelfFromGrid();


}
