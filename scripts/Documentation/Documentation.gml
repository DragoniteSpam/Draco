/*
Outline Shader
	--by matharoo
	
How To Use
----------

To add an outline to an object:

1) You need to put "outline_init()" in the Create event of the object.

2) Put "outline_start(thickness, color)" in the Draw event.

	Arguments:
	----------
	
	thickness: The thickness of the outline, in pixels.
	
	color: The color of the outline. Has to be a color variable, like c_white, c_red, c_black, etc. To create your own color, use make_color_rgb().
	
	OPTIONAL_sprite: Set this to the sprite you are drawing. Not needed if you're using draw_self(), but if you're trying to draw some other sprite, specify it here first.
						Default: sprite_index
	
	OPTIONAL_accuracy: This is an optional argument. The default value is 16. If you think the outline or a part of it appears weird, try increasing it (maximum value is 360).
						You can optimize the shader by reducing it (minimum value is 4). 4 works best for a pixel outline.
						
	OPTIONAL_tolerance: This is another optional argument. Default value is 0, maximum is 1. Increase this if parts in your sprite with less alpha have an outline when they shouldn't.
	
3) Draw anything you want after "outline_start()" and it will have the outline.

4) Then use "outline_end()" when you're done drawing the outlined stuff.

NOTE: Currently does not support surfaces.

-----------
!IMPORTANT!
-----------
The sprite needs to have empty space around the image for the outline to be drawn.
Open Tools > Texture Groups, select your sprite, and make sure "Automatically Crop" is disabled.
*/