/// @description Render every non-tile entity in the game.
var camera = view_get_camera(view_current);

/*camera_set_view_mat(camera, matrix_build_lookat(Player.x, Player.y, -1000, Player.x, Player.y, 1000, 0, -1, 0));
camera_set_proj_mat(camera, matrix_build_projection_ortho(640, 360, 1, 32000));
camera_apply(camera);*/

// Do the Event tiles first.
for (var i=view_xcell; i<view_xcell+view_wcell+1; i++){
    for (var j=view_ycell; j<(view_ycell+view_hcell+1); j++){
		if (inbounds(i, j)){
			// Draw Troddable stuff first
			if (instanceof_classic(event[# i, j], TerrainThing)){
				if (event[# i, j].draw){
					with (event[# i, j]){
						script_execute(render);
					}
				}
			}
		}
	}
}

// This is a tiny bit inefficient but do it again for the solid instances.
for (var i=view_xcell; i<view_xcell+view_wcell+1; i++){
    for (var j=view_ycell; j<(view_ycell+view_hcell+1); j++){
		if (inbounds(i, j)){
			// Draw Solids second
	        if (grid[# i, j]!=noone){
				if (grid[# i, j].draw){
		            with (grid[# i, j]){
						if (script_execute(get_alive)){
			                script_execute(render);
						}
					}
				}
	        }
		}
    }
}

if (state==Misc.title){
	
}