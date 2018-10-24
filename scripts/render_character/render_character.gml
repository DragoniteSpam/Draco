/// @description  void render_character();
/// @function  void render_character
// draw the character properly (the pictures can be taken directly
// out of RPG Maker, and are found in the Characters folder in the
// Backgrounds tree

/*  down
 *  left
 *  right
 *  up
 */

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