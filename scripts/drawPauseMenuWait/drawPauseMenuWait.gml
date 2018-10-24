///	@description	Draws and handles the "wait" pause menu thing.

var x1=W/2-200;
var y1=H/2-96;
var x2=W/2+200;
var y2=H/2+96;
var center_x=W/2;
var center_y=H/2;

var border_width=2;

if (pause_greater==PauseWaitScreens.wait){
	draw_set_alpha(pause_wait_alpha);
	draw_rectangle_color(0, 0, W, H, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
	pause_wait_alpha=lerp(pause_wait_alpha, 1, 0.1);
}

drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);

draw_set_color(c_white);
draw_set_font(FontPauseRegular);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (pause_end_action==PauseEndActions.ReturnFromSleep){
	draw_text(center_x, center_y-48, "Sleep for how long?");
} else {
	draw_text(center_x, center_y-48, "Wait for how long?");
}

if (pause_wait_hours==1){
	var str="   "+string(floor(pause_wait_hours))+" > hours";
} else if (pause_wait_hours==24){
	var str="< "+string(floor(pause_wait_hours))+"   hours";
} else {
	var str="< "+string(floor(pause_wait_hours))+" > hours";
}
draw_text(center_x, center_y-16, str);
draw_text(center_x, center_y+16, get_date_time_string());

if (pause_greater==PauseWaitScreens.base){
	if (Controller.left){
		pause_wait_hours=max(1, pause_wait_hours-0.1);
	} else if (Controller.right){
		pause_wait_hours=min(24, pause_wait_hours+0.1);
	} else if (Controller.release_a){
		pause_wait_hours=floor(pause_wait_hours);
		pause_greater=PauseWaitScreens.wait;
	} else if (Controller.release_b){
		World.pausing=noone;
		Player.free=true;
		pause_wait_hours=1;
		if (pause_end_action==PauseEndActions.ReturnFromWait){
		} else {
			with (World){
				scr_continue();
			}
		}
	}
} else {
	var step=1/20;
	game_clock_update_minute(60*step);
	pause_wait_hours-=step;
	if (pause_wait_hours<=0){
		pause_greater=PauseWaitScreens.base;
		World.pausing=noone;
		Player.free=true;
		World.pause_wait_hours=1;
		World.pause_wait_alpha=0;
		if (pause_end_action==PauseEndActions.ReturnFromWait){
		} else {
			with (World){
				scr_continue();
			}
		}
	}
}