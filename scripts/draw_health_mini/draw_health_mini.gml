///	@description	Draws a mini healthbar for the Actor. Automatically centered.
///	@param	x
///	@param	y
///	@param	Actor
function draw_health_mini() {

	var x1=argument[0]-64;
	var x2=argument[0]+64;

	var y2=argument[1]+2;
	var y1=argument[1]-2;

	var actor=argument[2];
	var m=get_max_hp(argument[2], true);
	var f=max(actor.st_vis_hp/m, 0);

	draw_set_alpha(0.5);
	draw_rectangle_colour(x1, y1, x2, y2, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, false);
	draw_set_alpha(1);
	draw_rectangle_colour(x1, y1, x1+f*128, y2, COLOR_HEALTH, COLOR_HEALTH, COLOR_HEALTH, COLOR_HEALTH, false);
	draw_rectangle_colour(x1, y1, x2, y2, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, true);


}
