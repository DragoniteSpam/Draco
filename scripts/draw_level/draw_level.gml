///	@description	Draws the player's level bar
///	@param	x
///	@param	y
///	@param	[center?]

var center=false;
switch (argument_count){
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
var value=actor.character_exp;
var y1=argument[1];
var y2=argument[1]+16;
var level=floor(actor.character_level);
var level_next=level+1;
var experience=get_character_level_experience(level);
var experience_next=get_character_level_experience(level_next);
var visible_exp=value-experience;
var needed_exp=experience_next-experience;
var f=min(visible_exp/needed_exp, 1);

draw_set_alpha(0.5);
draw_rectangle_colour(x1, y1, x2, y2, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, false);
draw_set_alpha(1);
draw_rectangle_colour(x1, y1, x1+f*128, y2, COLOR_EXP, COLOR_EXP, COLOR_EXP, COLOR_EXP, false);
draw_rectangle_colour(x1, y1, x2, y2, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, true);
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text((x1+x2)/2, y1-12, "Level "+string(actor.character_level));