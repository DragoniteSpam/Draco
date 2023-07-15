///	@description	Draws a magic bar for the Player.
///	@param	x
///	@param	y
///	@param	[center?]
///	@param	[numbers?]
function draw_stamina() {

	var center=false;
	var numbers=false;
	switch (argument_count){
		case 4:
			numbers=argument[3];
		case 3:
			center=argument[2];
			break;
	}

	if (center){
		var x1=argument[0]-64;
		var x2=argument[0]+64;
	} else {
		var x1=argument[0];
		var x2=argument[0]+128;
	}

	var y2=argument[1]+8;
	var y1=argument[1]-8;
	var actor=GetMyActor(Actors.playable);
	actor.st_vis_sp=lerp(actor.st_vis_sp, actor.st_act_sp, 0.1);
	var m=get_max_sp(Actors.playable);
	var f=max(actor.st_vis_sp/m, 0);

	draw_set_alpha(0.5);
	draw_rectangle_colour(x1, y1, x2, y2, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, false);
	draw_set_alpha(1);
	draw_rectangle_colour(x1, y1, x1+f*128, y2, COLOR_STAMINA, COLOR_STAMINA, COLOR_STAMINA, COLOR_STAMINA, false);
	draw_rectangle_colour(x1, y1, x2, y2, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, true);

	if (numbers){
		draw_set_halign(fa_center);
		draw_text((x1+x2)/2, y2-32, "Stamina");
		draw_text((x1+x2)/2, y2+16, string(floor(actor.st_vis_sp))+"/"+string(floor(m)));
	}


}
