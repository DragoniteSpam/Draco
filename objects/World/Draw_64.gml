// Drawing GUI stuff.

shader_set(shd_sepia);
shader_set_uniform_f(shader_get_uniform(shd_sepia, "strength"), state_sepia);
state_sepia=lerp(state_sepia, state_sepia_target, 0.05);
draw_surface(application_surface, 0, 0);
shader_reset();

// Fade in/fade out

draw_set_alpha(shade_alpha);
draw_rectangle_colour(0, 0, W, H, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);

if (shade_alpha>shade_target){
	shade_alpha-=0.025;
	if (shade_alpha==shade_target){	// 0
		//scr_continue();
	}
} else if (shade_alpha<shade_target){
	shade_alpha+=0.025;
	if (shade_alpha==shade_target){	// 1
		scr_continue();
	}
}

// Notifications

with (Notification){
	event_perform(ev_draw, 0);
}

// Dialogue

var drawn_overlay=false;
if (state==Misc.battle){
	draw_battle();
	drawn_overlay=true;
} else {
	if (speaking){
		draw_speaking();
		drawn_overlay=true;
	} else if (pausing!=noone){
	    drawPauseMenu();
		drawn_overlay=true;
	}

	if (show_skill_trainer>-1){
		draw_skill_trainer();
	}
}

// HP, MP and ST overlays

if (!drawn_overlay){
	var x_mp=1280/4;
	var x_hp=1280/2;
	var x_sp=1280*3/4;
	var frame_bottom=640;
	var frame_top=80;
	var text_y=frame_bottom+(720-frame_bottom)/2;
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(FontPauseRegular);
	draw_magic(x_mp, text_y, true, true);
	draw_health(x_hp, text_y, true, true);
	draw_stamina(x_sp, text_y, true, true);
}

// Finish up the frame
if (pausing==noone){
	game_clock_update_second(time_scale/game_get_speed(gamespeed_fps));
}