/* Everything in here is designed to make it easy(er) to
 * create reconfigure-able controls. Pay no attention to
 * any of this unless you want to change which buttons do what.
 */

gamepad_set_button_threshold(0, 0.5);

// Joystick information
rs_angle=0;
ls_angle=0;
dpad_angle=0;
rs_magnitude=0;
ls_magnitude=0;
rs_x=0;
rs_y=0;
ls_x=0;
ls_y=0;

// Change in joystick information
d_rs_angle=0;
d_ls_angle=0;
d_dpad_angle=0;
d_rs_magnitude=0;
d_ls_magnitude=0;
d_ls_x=0;
d_ls_y=0;
d_rs_x=0;
d_rs_y=0;

// General
hasInput=false;
pressInput=false;
releaseInput=false;

up=false;
down=false;
left=false;
right=false;
a=false;
b=false;
x=false;
y=false;
l=false;
r=false;
l2=false;
r2=false;
ls=false;
rs=false;
rup=false;
rdown=false;
rleft=false;
rright=false;
pup=false;
pdown=false;
pleft=false;
pright=false;
start=false;
select=false;

// Previous input
last_up=false;
last_down=false;
last_left=false;
last_right=false;
last_a=false;
last_b=false;
last_x=false;
last_y=false;
last_l=false;
last_r=false;
last_l2=false;
last_r2=false;
last_ls=false;
last_rs=false;
last_rup=false;
last_rdown=false;
last_rleft=false;
last_rright=false;
last_pup=false;
last_pdown=false;
last_pleft=false;
last_pright=false;
last_start=false;
last_select=false;

// Change input
press_up=false;
press_down=false;
press_left=false;
press_right=false;
press_a=false;
press_b=false;
press_x=false;
press_y=false;
press_l=false;
press_r=false;
press_l2=false;
press_r2=false;
press_ls=false;
press_rs=false;
press_rup=false;
press_rdown=false;
press_rleft=false;
press_rright=false;
press_pup=false;
press_pdown=false;
press_pleft=false;
press_pright=false;
press_start=false;
press_select=false;

release_up=false;
release_down=false;
release_left=false;
release_right=false;
release_a=false;
release_b=false;
release_x=false;
release_y=false;
release_l=false;
release_r=false;
release_l2=false;
release_r2=false;
release_ls=false;
release_rs=false;
release_rup=false;
release_rdown=false;
release_rleft=false;
release_rright=false;
release_pup=false;
release_pdown=false;
release_pleft=false;
release_pright=false;
release_start=false;
release_select=false;

// Common terms
interact=a;
back=b||select;
pause=x||start;
run=l2;
jump=y;
sneak=r2;

last_interact=false;
last_back=false;
last_pause=false;
last_run=false;
last_jump=false;
last_sneak=false;

press_interact=false;
press_back=false;
press_pause=false;
press_run=false;
press_jump=false;
press_sneak=false;

release_interact=false;
release_back=false;
release_pause=false;
release_run=false;
release_jump=false;
release_sneak=false;

// Labels
cn[JS.LEFT]="Left Stick Left";
cn[JS.RIGHT]="Left Stick Right";
cn[JS.UP]="Left Stick Up";
cn[JS.DOWN]="Left Stick Down";
cn[JS.A]="A";
cn[JS.B]="B";
cn[JS.X]="X";
cn[JS.Y]="Y";
cn[JS.START]="Start";
cn[JS.SELECT]="Select";
cn[JS.L]="L";
cn[JS.R]="R";
cn[JS.L2]="L2";
cn[JS.R2]="R2";
cn[JS.LS]="Left Stick";
cn[JS.RS]="Right Stick";
cn[JS.RUP]="Right Stick Up";
cn[JS.RDOWN]="Right Stick Down";
cn[JS.RLEFT]="Right Stick Left";
cn[JS.RRIGHT]="Right Stick Right";
cn[JS.PUP]="D-Pad Up";
cn[JS.PDOWN]="D-Pad Down";
cn[JS.PLEFT]="D-Pad Left";
cn[JS.PDOWN]="D-Pad Down";

/* */
/*  */
