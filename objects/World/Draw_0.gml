/// @description Render every non-tile entity in the game.

// Do the Event tiles first.
for (var i=view_xcell; i<view_xcell+view_wcell+1; i++){
    for (var j=view_ycell; j<(view_ycell+view_hcell+1); j++){
		if (inbounds(i, j)){
			// Draw Troddable stuff first
			if (instanceof(event[# i, j], TerrainThing)){
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
		                script_execute(render);
					}
				}
	        }
		}
    }
}

if (state==Misc.title){
	
}