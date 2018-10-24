///	@description	Draws a box.
///	@param	x1
///	@param	y1
///	@param	x2
///	@param	y2
///	@param	border_width
draw_set_alpha(pause_base_alpha);
draw_set_color(c_black);
draw_rectangle(argument0, argument1, argument2, argument3, false);
draw_set_alpha(1);
draw_line_width(argument0, argument1, argument2, argument1, argument4);
draw_line_width(argument2, argument1, argument2, argument3, argument4);
draw_line_width(argument2, argument3, argument0, argument3, argument4);
draw_line_width(argument0, argument3, argument0, argument1, argument4);