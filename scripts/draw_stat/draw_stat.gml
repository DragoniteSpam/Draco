///	@description	Draws a stat bar for the Player.
///	@param	Skill
///	@param	x
///	@param	y
///	@param	[center?]

if (argument_count==4){
	var center=argument[3];
} else {
	var center=false;
}

if (center){
	var x1=argument[1]-64;
	var x2=argument[1]+64;
} else {
	var x1=argument[1];
	var x2=argument[1]+128;
}

var y1=argument[2];
var y2=argument[2]+16;

var player=GetMyActor(Actors.playable);
var value=player.skill_exp[argument[0]];
var v1=floor(player.skill_level[argument[0]]);
var v2=v1+1;
var e1=get_skill_level_experience(argument[0], v1);
var e2=get_skill_level_experience(argument[0], v2);
var visible_exp=value-e1;
var needed_exp=e2-e1;
var f=visible_exp/needed_exp;

draw_set_alpha(0.5);
draw_rectangle_colour(x1, y1, x2, y2, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, false);
draw_set_alpha(1);
draw_rectangle_colour(x1, y1, x1+f*128, y2, COLOR_EXP, COLOR_EXP, COLOR_EXP, COLOR_EXP, false);
draw_rectangle_colour(x1, y1, x2, y2, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, COLOR_STAT_BORDER, true);
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text((x1+x2)/2, y1-12, World.all_skills[argument[0]].name);
draw_text(x1-32, y1+8, v1);
draw_text(x2+32, y1+8, v2);