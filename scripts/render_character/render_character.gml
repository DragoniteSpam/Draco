/// @description  void render_character();
/// @function  void render_character
function render_character() {
	// draw the character properly (the pictures can be taken directly
	// out of RPG Maker, and are found in the Characters folder in the
	// Backgrounds tree

	/*  down
	 *  left
	 *  right
	 *  up
	 */

	var render_after=false;

	if (swinging!=DIR_NULL){
		switch (direction){
			case Directions.north:
				var sprite_swing=spr_swing_north;
				var offsetx=0;
				var offsety=0;
				var render_after=false;
				break;
			case Directions.south:
				var sprite_swing=spr_swing_south;
				var offsetx=32;
				var offsety=0;
				var render_after=false;
				break;
			case Directions.east:
				var sprite_swing=spr_swing_east;
				var offsetx=0;
				var offsety=0;
				var render_after=false;
				break;
			case Directions.west:
				var sprite_swing=spr_swing_west;
				var offsetx=32;
				var offsety=0;
				var render_after=false;
				break;
		}
		if (!render_after){
			draw_sprite(sprite_swing, swing_index, x+offsetx, y+offsety);
		}
	}

	switch (direction){
	    case Directions.south:
	    default:
	        var yoff=0;
	        break;
	    case Directions.west:
	        var yoff=1;
	        break;
	    case Directions.east:
	        var yoff=2;
	        break;
	    case Directions.north:
	        var yoff=3;
	        break;
	}

	var a=draw_get_alpha();
	if (alpha!=a){
		draw_set_alpha(alpha);
	}

	var sw=sprite_get_width(sprite)/3;
	var sh=sprite_get_height(sprite)/4;

	draw_sprite_part(sprite, 0, (floor(frame+1)%2)*sw, yoff*sh, sw, sh, x, y-(sh-32));

	if (alpha!=a){
		draw_set_alpha(a);
	}

	var actor=GetMyActor();
	draw_set_alpha(actor.health_bar_alpha);
	draw_rectangle_colour(x, y-16, x+32*actor.st_act_hp/get_max_hp(actor_index), y-15, c_red, c_red, c_red, c_red, false);
	draw_rectangle_colour(x, y-16, x+32, y-15, c_black, c_black, c_black, c_black, true);
	draw_set_alpha(1);

	if (render_after){
		// This is bad code but it won't ever crash because render_after can only be true if
		// sprite has been declared, too.
		draw_sprite(sprite_swing, swing_index, x+offsetx, y+offsety);
	}

	if (swinging!=DIR_NULL){
		if (swing_index++==sprite_get_number(sprite_swing)){
			swing_index=0;
			swinging=DIR_NULL;
		}
	}


}
