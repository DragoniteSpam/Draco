draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(FontPauseRose);

var hoffset=320;
var voffset=240;
var draw_north=true;
var draw_south=true;
var draw_east=true;
var draw_west=true;
var lerp_amt=0.025;

switch (pause_rose_direction){
	case Directions.east:
		draw_east=false;
		draw_text(640+hoffset, 360, "STUFF");
		draw_sprite_ext(spr_menu_rose, 0, 640, 360, 2, 2, 0, c_white, pause_rose_alpha);
		pause_rose_alpha=lerp(pause_rose_alpha, 1, lerp_amt);
		break;
	case Directions.north:
		draw_north=false;
		draw_text(640, 360-voffset, "SKILLS");
		draw_sprite_ext(spr_menu_rose, 0, 640, 360, 2, 2, 90, c_white, pause_rose_alpha);
		pause_rose_alpha=lerp(pause_rose_alpha, 1, lerp_amt);
		break;
	case Directions.south:
		draw_south=false;
		draw_text(640, 360+voffset, "MAP");
		draw_sprite_ext(spr_menu_rose, 0, 640, 360, 2, 2, 270, c_white, pause_rose_alpha);
		pause_rose_alpha=lerp(pause_rose_alpha, 1, lerp_amt);
		break;
	case Directions.west:
		draw_west=false;
		draw_text(640-hoffset, 360, "MAGIC");
		draw_sprite_ext(spr_menu_rose, 0, 640, 360, 2, 2, 180, c_white, pause_rose_alpha);
		pause_rose_alpha=lerp(pause_rose_alpha, 1, lerp_amt);
		break;
}

if (draw_west){
	draw_text(640-hoffset, 360, "Magic");
	draw_sprite_ext(spr_menu_rose, 0, 640, 360, 2, 2, 180, c_white, pause_base_alpha);
}
if (draw_north){
	draw_text(640, 360-voffset, "Skills");
	draw_sprite_ext(spr_menu_rose, 0, 640, 360, 2, 2, 90, c_white, pause_base_alpha);
}
if (draw_east){
	draw_text(640+hoffset, 360, "Stuff");
	draw_sprite_ext(spr_menu_rose, 0, 640, 360, 2, 2, 0, c_white, pause_base_alpha);
}
if (draw_south){
	draw_text(640, 360+voffset, "Map");
	draw_sprite_ext(spr_menu_rose, 0, 640, 360, 2, 2, 270, c_white, pause_base_alpha);
}

if (Controller.release_left){
	pause_rose_alpha=pause_base_alpha;
	if (pause_rose_direction==Directions.west){
		pause_stage=PauseMenu.magic;
		pause_menu_offset=-256;
	} else {
	    pause_rose_direction=Directions.west;
	}
}
if (Controller.release_right){
	pause_rose_alpha=pause_base_alpha;
	if (pause_rose_direction==Directions.east){
		pause_stage=PauseMenu.inventory;
		pause_menu_offset=-256;
	} else {
	    pause_rose_direction=Directions.east;
	}
}
if (Controller.release_up){
	pause_rose_alpha=pause_base_alpha;
	if (pause_rose_direction==Directions.north){
		pause_stage=PauseMenu.skills;
		pause_menu_offset=-256;
	} else {
	    pause_rose_direction=Directions.north;
	}
}
if (Controller.release_down){
	pause_rose_alpha=pause_base_alpha;
	if (pause_rose_direction==Directions.south){
		pause_stage=PauseMenu.map;
		//pause_menu_offset=-256;
	} else {
		pause_rose_direction=Directions.south;
	}
}
if (Controller.release_b){
	pause_game(noone);
}