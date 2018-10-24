/* Everything in here is designed to make it easy(er) to
 * create reconfigure-able controls. Pay no attention to
 * any of this unless you want to change which buttons do what.
 */

// Shift input to previous input
var lastL=ls_angle;
var lastR=rs_angle;
var lastP=dpad_angle;
var lastInput=hasInput;
var lastLM=ls_magnitude;
var lastRM=rs_magnitude;
var lastRSX=rs_x;
var lastRSY=rs_y;
var lastLSX=ls_x;
var lastLSY=ls_y;

last_up=up;
last_down=down;
last_left=left;
last_right=right;
last_a=a;
last_b=b;
last_x=x;
last_y=y;
last_l=l;
last_r=r;
last_l2=l2;
last_r2=r2;
last_ls=ls;
last_rs=rs;
last_rup=rup;
last_rdown=rdown;
last_rleft=rleft;
last_rright=rright;
last_pup=pup;
last_pdown=pdown;
last_pleft=pleft;
last_pright=pright;
last_start=start;
last_select=select;

last_interact=interact;
last_back=back;
last_pause=pause;
last_run=run;
last_jump=jump;
last_sneak=sneak;

if (getController()){
    // If controller, gather raw input first. Can't be done all in one call because different buttons have
    // different functions to check them.
    ls_x=gamepad_axis_value(0, gp_axislh);
    ls_y=gamepad_axis_value(0, gp_axislv);
    ls_angle=GetStickAngle(ls_x, ls_y);
    ls_magnitude=GetStickMagnitude(ls_x, ls_y);
    up=MatchCardinalDirection(ls_angle, ls_magnitude, Directions.north);
    down=MatchCardinalDirection(ls_angle, ls_magnitude, Directions.south);
    left=MatchCardinalDirection(ls_angle, ls_magnitude, Directions.west);
    right=MatchCardinalDirection(ls_angle, ls_magnitude, Directions.east);
    a=gamepad_button_check(0, gp_face1);
    b=gamepad_button_check(0, gp_face2);
    x=gamepad_button_check(0, gp_face3);
    y=gamepad_button_check(0, gp_face4);
    start=gamepad_button_check(0, gp_start);
    select=gamepad_button_check(0, gp_select);
    l=gamepad_button_check(0, gp_shoulderlb);
    r=gamepad_button_check(0, gp_shoulderrb);
    l2=gamepad_button_check(0, gp_shoulderl);
    r2=gamepad_button_check(0, gp_shoulderr);
    ls=gamepad_button_check(0, gp_stickl);
    rs=gamepad_button_check(0, gp_stickr);
    pup=gamepad_button_check(0, gp_padu);
    pdown=gamepad_button_check(0, gp_padd);
    pleft=gamepad_button_check(0, gp_padl);
    pright=gamepad_button_check(0, gp_padr);
    rs_x=gamepad_axis_value(0, gp_axisrh);
    rs_y=gamepad_axis_value(0, gp_axisrv);
    rs_angle=GetStickAngle(rs_x, rs_y);
    rs_magnitude=GetStickMagnitude(rs_x, rs_y);
    rup=MatchCardinalDirection(rs_angle, rs_magnitude, Directions.north);
    rdown=MatchCardinalDirection(rs_angle, rs_magnitude, Directions.south);
    rleft=MatchCardinalDirection(rs_angle, rs_magnitude, Directions.west);
    rright=MatchCardinalDirection(rs_angle, rs_magnitude, Directions.east);
} else {
    // The keyboard can gather exact input directly from the keyboard, since all button checks are the same
    ls_x=-keyboard_check_direct(ord("A"))+keyboard_check_direct(ord("D"));
    ls_y=-keyboard_check_direct(ord("W"))+keyboard_check_direct(ord("S"));
    ls_x-=(keyboard_check_direct(vk_left)-keyboard_check_direct(vk_right));
    ls_y-=(keyboard_check_direct(vk_up)-keyboard_check_direct(vk_down));
    // Don't need tolerance checks here because keyboard checks are binary.
    ls_angle=GetStickAngle(ls_x, ls_y);
    up=MatchCardinalDirection(ls_angle, ls_y, Directions.north);
    down=MatchCardinalDirection(ls_angle, ls_y, Directions.south);
    left=MatchCardinalDirection(ls_angle, ls_x, Directions.west);
    right=MatchCardinalDirection(ls_angle, ls_x, Directions.east);
    a=(keyboard_check_direct(vk_enter)||mouse_check_button(mb_left));
    b=(keyboard_check_direct(ord("J"))||mouse_check_button(mb_right));
    x=keyboard_check_direct(ord("K"));
    y=keyboard_check_direct(ord("L"));
    start=keyboard_check_direct(vk_escape);
    select=keyboard_check_direct(vk_backspace);
    l=keyboard_check_direct(vk_lcontrol)||mouse_wheel_up();
    r=keyboard_check_direct(vk_rcontrol)||mouse_wheel_down();
    l2=keyboard_check_direct(vk_lshift);
    r2=keyboard_check_direct(ord("Z"));
    ls=(keyboard_check_direct(vk_lalt)||mouse_check_button(mb_middle));
    rs=keyboard_check_direct(vk_ralt);
    var _u=-keyboard_check_direct(vk_left)+keyboard_check_direct(vk_right);
    var _r=-keyboard_check_direct(vk_up)+keyboard_check_direct(vk_down);
    dpad_angle=GetStickAngle(_u, _r);
    pup=MatchCardinalDirection(dpad_angle, _r, Directions.north);
    pdown=MatchCardinalDirection(dpad_angle, _r, Directions.south);
    pleft=MatchCardinalDirection(dpad_angle, _u, Directions.west);
    pright=MatchCardinalDirection(dpad_angle, _u, Directions.east);
    // Mouse: only check these if the cursor is locked (not on a menu or something)
    rs_x=clamp((window_mouse_get_x()-window_get_width()/2)/10, -1, 1);
    rs_y=clamp((window_mouse_get_y()-window_get_height()/2)/10, -1, 1);
    if (World.invert_y)
        rs_y=-rs_y;
    if (World.invert_x)
        rs_x=-rs_x;
    rs_angle=GetStickAngle(rs_x, rs_y);
    rs_magnitude=GetStickMagnitude(rs_x, rs_y);
    rup=MatchCardinalDirection(rs_angle, rs_magnitude, Directions.north);
    rdown=MatchCardinalDirection(rs_angle, rs_magnitude, Directions.south);
    rleft=MatchCardinalDirection(rs_angle, rs_magnitude, Directions.west);
    rright=MatchCardinalDirection(rs_angle, rs_magnitude, Directions.east);
    // "stick" magnitudes are a binary 1 or 0 with keyboard controls,
    // since you can't partially press a key.
    ls_magnitude=(up||down||left||right);
}

if (abs(ls_x)<0.1)
    ls_x=0;
if (abs(ls_y)<0.1)
    ls_y=0;
if (abs(rs_x)<0.1)
    rs_x=0;
if (abs(rs_y)<0.1)
    rs_y=0;

// Change in stick angles
d_rs_angle=(rs_angle-lastR+360) mod 360;
d_ls_angle=(ls_angle-lastL+360) mod 360;
d_dpad_angle=(dpad_angle-lastP+360) mod 360;
d_ls_magnitude=ls_magnitude-lastLM;
d_rs_magnitude=rs_magnitude-lastRM;

// Update change input
hasInput=(up||down||left||right);
pressInput=((!lastInput)&&hasInput);
releaseInput=(lastInput&&(!hasInput));

press_up=(!last_up)&&up;
press_down=(!last_down)&&down;
press_left=(!last_left)&&left;
press_right=(!last_right)&&right;
press_a=(!last_a)&&a;
press_b=(!last_b)&&b;
press_x=(!last_x)&&x;
press_y=(!last_y)&&y;
press_l=(!last_l)&&l;
press_r=(!last_r)&&r;
press_l2=(!last_l2)&&l2;
press_r2=(!last_r2)&&r2;
press_ls=(!last_ls)&&ls;
press_rs=(!last_rs)&&rs;
press_rup=(!last_rup)&&rup;
press_rdown=(!last_rdown)&&rdown;
press_rleft=(!last_rleft)&&rleft;
press_rright=(!last_rright)&&rright;
press_pup=(!last_pup)&&pup;
press_pdown=(!last_rdown)&&pdown;
press_pleft=(!last_pleft)&&pleft;
press_pright=(!last_pright)&&pright;
press_start=(!last_start)&&start;
press_select=(!last_select)&&select;

release_up=last_up&&(!up);
release_down=last_down&&(!down);
release_left=last_left&&(!left);
release_right=last_right&&(!right);
release_a=last_a&&(!a);
release_b=last_b&&(!b);
release_x=last_x&&(!x);
release_y=last_y&&(!y);
release_l=last_l&&(!l);
release_r=last_r&&(!r);
release_l2=last_l2&&(!l2);
release_r2=last_r2&&(!r2);
release_ls=last_ls&&(!ls);
release_rs=last_rs&&(!rs);
release_rup=last_rup&&(!rup);
release_rdown=last_rdown&&(!rdown);
release_rleft=last_rleft&&(!rleft);
release_rright=last_rright&&(!rright);
release_pup=last_pup&&(!pup);
release_pdown=last_pdown&&(!pdown);
release_pleft=last_pleft&&(!pleft);
release_pright=last_pright&&(!pright);
release_start=last_start&&(!start);
release_select=last_select&&(!select);

// Update common terms
interact=a;
back=b||select;
pause=x||start;
run=l2;
jump=y;
sneak=r2;

press_interact=(!last_interact)&&interact;
press_back=(!last_back)&&back;
press_pause=(!last_pause)&&pause;
press_run=(!last_run)&&run;
press_jump=(!last_jump)&&jump;
press_sneak=(!last_sneak)&&sneak;

release_interact=last_interact&&(!interact);
release_back=last_back&&(!back);
release_pause=last_pause&&(!pause);
release_run=last_run&&(!run);
release_jump=last_jump&&(!jump);
release_sneak=last_sneak&&(!sneak);