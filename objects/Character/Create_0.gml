/// @description  extends Solid
event_inherited();

// Movement settings
moving=false;
free=true;
target_x=xx;
target_y=yy;
to_x=xx;
to_y=yy;
origin_xx=xx;
origin_yy=yy;
last_xx=xx;
last_yy=yy;
mspd=2;             // pixels per step
movement_factor=1;  // how often the character is to walk in random directions
movement_radius=6;	// number of tiles you can stray from your origin

// drawing
sprite=chr_pirate_blue_green;
render=render_character;
control_script=process_npc_random_movement;
control_script_new_cell=null;
control_script_post=null;
actor_index=Actors.NPCTest;

alpha=1;

image_speed=0;
frame=0;
sneaking=false;

// battle

side=Misc.side_player;