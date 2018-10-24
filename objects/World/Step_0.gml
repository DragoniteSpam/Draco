// Control the pause menu from here.

__view_set( e__VW.XView, 0, clamp(Player.x-__view_get( e__VW.WView, 0 )/2, 0, room_width-__view_get( e__VW.WView, 0 ) ));
__view_set( e__VW.YView, 0, clamp(Player.y-__view_get( e__VW.HView, 0 )/2, 0, room_height-__view_get( e__VW.HView, 0 ) ));

view_xcell=__view_get( e__VW.XView, 0 ) div 32;
view_ycell=__view_get( e__VW.YView, 0 ) div 32;
view_wcell=__view_get( e__VW.WView, 0 ) div 32;
view_hcell=__view_get( e__VW.HView, 0 ) div 32;

var star_layer=layer_get_id("TilesStars");
if (layer_exists(star_layer)){
	layer_set_visible(star_layer, getDayEra()==Misc.night);
}