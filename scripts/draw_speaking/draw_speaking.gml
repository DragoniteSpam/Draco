var border_width=2;
draw_set_font(FontPauseRegular);
draw_set_halign(fa_left);
drawPauseMenuInventoryBox(0, H*3/4, W, H, border_width)
if (show_text_name!=noone){
	drawPauseMenuInventoryBox(32, H*3/4-96, W/4+32, H*3/4-32, border_width);
}
if (show_text_option){
	var s=ds_list_size(show_text_option_list);
	var x1=(W-144)-string_width_greatest(show_text_option_list);
	var x2=W-32;
	var y1=H*3/4-64-s*32;
	var y2=H*3/4-32;
	drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
	draw_set_color(c_white);
	draw_set_valign(fa_center);
	for (var i=0; i<s; i++){
		draw_text(x1+80, y1+32+32*i, show_text_option_list[| i]);
	}
	draw_sprite(spr_menu_arrow, 0, x1+32, y1+32+32*show_text_option_index);
	if (Controller.release_up){
		show_text_option_index=max(--show_text_option_index, 0);
	} else if (Controller.release_down){
		show_text_option_index=min(++show_text_option_index, s-1);
	}
}
draw_set_valign(fa_top);
draw_set_color(c_white);
if (show_text_name!=noone){
	draw_set_valign(fa_middle);
	draw_text(64, H*3/4-64, show_text_name.name);
	draw_set_valign(fa_top);
}
if (show_text_arrow!=noone){
	var camera=view_camera[0];
	var ax=(show_text_arrow.alias.x+GRID_CELL_WIDTH/2-camera_get_view_x(camera))*2;
	var ay=(show_text_arrow.alias.y+GRID_CELL_WIDTH/2-camera_get_view_y(camera))*2;
	var base_x=W*3/4;
	var base_y=H*3/4;
	var bx=(ax+base_x)/2;
	var by=(ay+base_y)/2;
	draw_set_alpha(pause_base_alpha);
	draw_set_color(c_black);
	draw_triangle(base_x-48, H*3/4, bx, by, base_x+48, H*3/4, false);
	draw_set_alpha(1);
	draw_line_width(base_x-48, H*3/4, bx, by, border_width);
	draw_line_width(bx, by, base_x+48, H*3/4, border_width);
}
draw_set_color(c_white);
draw_text_ext(32, H*3/4+32, string(string_copy(show_text_message, 1, show_text_t)), -1, W-64);
if (show_text_t>=string_length(show_text_message)){
	if (Controller.release_a){
		Controller.release_a=false;
		speaking=false;
		show_text_option=false;
		scr_continue();
	}
} else {
	show_text_t+=World.text_speed;
}