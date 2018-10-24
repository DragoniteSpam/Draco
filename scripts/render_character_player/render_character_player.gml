/// @description  Draws the player. Wrapper for render_character() with a few extra bells and whistles.

var render_after=false;

if (swinging!=DIR_NULL){
	switch (direction){
		case Directions.north:
			var sprite=spr_swing_north;
			var offsetx=0;
			var offsety=0;
			var render_after=false;
			break;
		case Directions.south:
			var sprite=spr_swing_south;
			var offsetx=32;
			var offsety=0;
			var render_after=false;
			break;
		case Directions.east:
			var sprite=spr_swing_east;
			var offsetx=0;
			var offsety=0;
			var render_after=false;
			break;
		case Directions.west:
			var sprite=spr_swing_west;
			var offsetx=32;
			var offsety=0;
			var render_after=false;
			break;
	}
	if (!render_after){
		draw_sprite(sprite, swing_index, x+offsetx, y+offsety);
	}
}

render_character();

if (render_after){
	// This is bad code but it won't ever crash because render_after can only be true if
	// sprite has been declared, too.
	draw_sprite(sprite, swing_index, x+offsetx, y+offsety);
}

if (swinging!=DIR_NULL){
	if (swing_index++==sprite_get_number(sprite)){
		swing_index=0;
		swinging=DIR_NULL;
	}
}