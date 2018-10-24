/// @description Anything that absolutely needs to be drawn over everything else

// Day tint
var light_surface=surface_create(W/2/LIGHT_SURFACE_SCALE, H/2/LIGHT_SURFACE_SCALE);
surface_set_target(light_surface);

if (location_type==Misc.cave){
	day_alpha=CAVE_ALPHA;
} else {
	day_alpha=lerp(day_alpha, day_time_alpha[getDayEra()], 0.01);
}

draw_clear_alpha(c_black, day_alpha);
gpu_set_blendmode(bm_subtract);
gpu_set_alphatestenable(true);
gpu_set_alphatestref(0.1);

for (var i=view_xcell-4; i<view_xcell+view_wcell+4; i++){
    for (var j=view_ycell-4; j<(view_ycell+view_hcell+5); j++){
		if (inbounds(i, j)){
	        if (lights[# i, j]!=noone){
				var lt=lights[# i, j];
				var scale=random_range(0.9, 1.1)/LIGHT_SURFACE_SCALE;
	            draw_sprite_ext(spr_light, 0, (lt.x+16-view_xcell*GRID_CELL_WIDTH)/2/LIGHT_SURFACE_SCALE,
					(lt.y+16-view_ycell*GRID_CELL_HEIGHT)/2/LIGHT_SURFACE_SCALE, scale, scale, 0, c_white, lt.alpha);
	        }
		}
    }
}

draw_set_alpha(1);
gpu_set_blendmode(bm_normal);
surface_reset_target();
draw_surface_ext(light_surface, view_xcell*GRID_CELL_WIDTH, view_ycell*GRID_CELL_HEIGHT, 2*LIGHT_SURFACE_SCALE, 2*LIGHT_SURFACE_SCALE, 0, c_white, 1);
surface_free(light_surface);