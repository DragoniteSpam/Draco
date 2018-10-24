y=lerp(y, 32*n, 0.05);

draw_set_font(FontPauseRegular);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_alpha(alpha);
draw_set_color(c_white);

draw_text(32, y, text);

var t_vanish=game_get_speed(gamespeed_fps)*15;
var frames_to_vanish=t_vanish-(++t);
alpha=min(1, frames_to_vanish/100);

if (t>=t_vanish){
	instance_destroy();
}