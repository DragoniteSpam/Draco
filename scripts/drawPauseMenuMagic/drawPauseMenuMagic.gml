function drawPauseMenuMagic() {
	// Some placement variables
	var frame_width=320;
	var border_width=2;
	var frame_bottom=640;
	var text_y=frame_bottom+(720-frame_bottom)/2;

	var player=GetMyActor(Actors.playable);

	// Create the required lists
	var list=ds_list_create();
	var list_category=ds_list_create();

	ds_list_add(list, player.name);
	ds_list_add(list_category, MagicClasses.no);
	var category=MagicClasses.no;
	for (var i=0; i<ds_list_size(player.magic); i++){
		var new_category=all_effects[player.magic[| i]].school;
		if (category!=new_category){
			ds_list_add(list, TAB+World.magic_class_names[new_category]);
			ds_list_add(list_category, new_category);
			category=new_category;
		}
	}
	if (ds_list_size(player.shouts)>0){
		ds_list_add(list, World.magic_class_names[MagicClasses.shout]);
		ds_list_add(list_category, MagicClasses.shout);
	}
	if (ds_list_size(player.effects)>0){
		ds_list_add(list, World.magic_class_names[MagicClasses.effects]);
		ds_list_add(list_category, MagicClasses.effects);
	}
	if (ds_list_size(player.powers)>0){
		ds_list_add(list, World.magic_class_names[MagicClasses.powers]);
		ds_list_add(list_category, MagicClasses.powers);
	}

	pause_greater_position=min(pause_greater_position, ds_list_size(list)-1);

	// Draw the category frame
	draw_set_alpha(pause_base_alpha);
	draw_set_color(c_black);
	draw_rectangle(1280-pause_menu_offset, 0, 1280-frame_width-pause_menu_offset, 720, false);
	draw_rectangle(0, frame_bottom, 1280, 720, false);
	draw_set_alpha(1);
	draw_line_width(1280-frame_width-pause_menu_offset, 0, 1280-frame_width-pause_menu_offset, 720, border_width);
	draw_line_width(0, frame_bottom, 1280, frame_bottom, border_width);

	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(FontPauseRegular);
	draw_set_color(c_white);

	for (var i=0; i<ds_list_size(list); i++){
		draw_text(1280-frame_width+96-pause_menu_offset, 64+32*i, list[| i]);
	}

	draw_sprite(spr_menu_arrow, 0, 1280-frame_width+32-pause_menu_offset, 64+32*pause_greater_position);

	var x_level=640+64;
	var x_mp=1280*3/4+64;
	draw_magic(x_mp, text_y);

	if (pause_greater==PauseMagicScreens.base){
		if (Controller.release_up){
			pause_greater_position=max(--pause_greater_position, 0);
		} else if (Controller.release_down){
			pause_greater_position=min(++pause_greater_position, ds_list_size(list)-1);
		} else if (Controller.release_a||Controller.release_left){
			pause_greater=PauseMagicScreens.contents;
		} else if (Controller.release_b||Controller.release_right){
			pause_stage=PauseMenu.rose;
		}
	} else {
		// Draw the outer frame
		draw_set_color(c_black);
		draw_set_alpha(pause_base_alpha);
		draw_rectangle(1280-frame_width-pause_menu_offset, 0, 1280-2*frame_width-pause_menu_offset, 720, false);
		draw_set_alpha(1);
		draw_line_width(1280-2*frame_width-pause_menu_offset, 0, 1280-2*frame_width-pause_menu_offset, 720,  border_width);
		draw_set_color(c_white);
		// Fill the magic/shout/etc list
		var list_magic=ds_list_create();
		if (list_category[| pause_greater_position]==MagicClasses.shout){
			for (var i=0; i<ds_list_size(player.shouts); i++){
				var magic=player.shouts[| i];
				ds_list_add(list_magic, magic);
			}
		} else if (list_category[| pause_greater_position]==MagicClasses.powers){
			for (var i=0; i<ds_list_size(player.powers); i++){
				var magic=player.powers[| i];
				ds_list_add(list_magic, magic);
			}
		} else if (list_category[| pause_greater_position]==MagicClasses.effects){
			for (var i=0; i<ds_list_size(player.effects); i++){
				var magic=player.effects[| i];
				ds_list_add(list_magic, magic);
			}
		} else {	// Regular magic
			for (var i=0; i<ds_list_size(player.magic); i++){
				var magic=player.magic[| i];
				var base_magic=all_effects[magic];
				if (base_magic.school==list_category[| pause_greater_position]||list_category[| pause_greater_position]==MagicClasses.no){
					ds_list_add(list_magic, magic);
				}
			}
		}
		// Draw the skill level
		pause_lesser_position=min(ds_list_size(list_magic)-1, pause_lesser_position);
		if (is_regular_magic(list_category[| pause_greater_position])){
			switch (all_effects[list_magic[| pause_lesser_position]].school){
				case MagicClasses.alteration:
					draw_stat(Skills.alter, x_level+32, text_y);
					break;
				case MagicClasses.conjouration:
					draw_stat(Skills.conjour, x_level+32, text_y);
					break;
				case MagicClasses.destruction:
					draw_stat(Skills.destruct, x_level+32, text_y);
					break;
				case MagicClasses.illusion:
					draw_stat(Skills.illusion, x_level+32, text_y);
					break;
				case MagicClasses.restoration:
					draw_stat(Skills.restore, x_level+32, text_y);
					break;
			}
		}
		// Draw the list
		for (var i=0; i<ds_list_size(list_magic); i++){
			var spacing="";
			var name="";
			switch (list_category[| pause_greater_position]){
				case MagicClasses.effects:
					name=all_effects[list_magic[| i].index].name;
					break;
				case MagicClasses.powers:
					name=all_powers[list_magic[| i].index].name;
					break;
				case MagicClasses.shout:
					name=all_shouts[list_magic[| i].index].name;
					break;
				default:
					if (player.equip_spell==list_magic[| i]){
						spacing=TAB;
						draw_sprite(spr_menu_equip, 4, 1280-2*frame_width+96-pause_menu_offset, 64+32*i);
					}
					var name=all_effects[list_magic[| i]].name;
					break;
			}
			draw_set_halign(fa_left);
			draw_text(1280-2*frame_width+96-pause_menu_offset, 64+32*i, spacing+name);
		}
	
		draw_sprite(spr_menu_arrow, 0, 1280-2*frame_width+32-pause_menu_offset, 64+32*pause_lesser_position);
	
		// General variables for drawing stuff
		var x1=80;
		var y1=360-160-128;
		var x2=640-80;
		var y2=360+160-128;
		var center_x=(x1+x2)/2;
		var center_y=(y1+y2)/2;
		var text_width=(x2-x1)-64;
		var text_desc_y=(center_y+y2)/2;
		var thing=list_magic[| pause_lesser_position];
		// Context sensitive things
		switch (pause_greater){
			case PauseMagicScreens.contents:
				drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
				draw_set_color(c_white);
				draw_line_width(x1+32, center_y+32, x2-32, center_y+32, border_width);
				var y1=360+160-96;
				var y2=360+160;
				var center_y_b=(y1+y2)/2;
				drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
				draw_set_font(FontPauseRose);
				draw_set_color(c_white);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				switch (list_category[| pause_greater_position]){
					case MagicClasses.effects:
						draw_text(center_x, center_y, all_effects[thing.index].name);
						draw_set_font(FontPauseRegular);
						draw_text_ext(center_x, center_y_b, string_replace(all_effects[thing.index].description, "&", string(thing.effect[thing.index])), -1, text_width);
						if (thing.time==-1){
							draw_text_ext(center_x, center_y+64, "Effect duration: Permenant", -1, text_width);
						} else {
							draw_text_ext(center_x, center_y+64, "Effect duration: "+string(thing.time)+" seconds", -1, text_width);
						}
						break;
					case MagicClasses.powers:
						draw_text(center_x, center_y, all_powers[thing.index].name);
						draw_set_font(FontPauseRegular);
						draw_text_ext(center_x, center_y_b, all_powers[thing.index].description, -1, text_width);
						break;
					case MagicClasses.shout:
						var base_shout=all_shouts[thing.index];
						draw_text(center_x, center_y, base_shout.name);
						draw_set_font(FontPauseRegular);
						// Words text
						var str="Words:";
						for (var i=0; i<thing.words; i++){
							if (string_length(str)>0){
								str=str+TAB;
							}
							if (i>=thing.unlocked){
								var a="(";
								var b=")";
							} else {
								var a="";
								var b="";
							}
							str=str+a+base_shout.word[i]+b;
						}
						draw_text(center_x, center_y+64, str);
						// Cooldown text
						var str="Cooldown:";
						for (var i=0; i<thing.words; i++){
							str=str+" "+string(base_shout.cooldown[i]);
							if (i<(thing.words-1)){
								str=str+",";
							}
						}
						draw_text(center_x, center_y+96, str);
						draw_text_ext(center_x, center_y_b, base_shout.description, -1, text_width);
						draw_set_halign(fa_left);
						draw_text(x_level, text_y, "Dragon Souls: "+string(player.souls));
						break;
					default:
						draw_text(center_x, center_y, all_effects[thing].name);
						draw_set_font(FontPauseRegular);
						draw_text_ext(center_x, center_y_b, all_effects[thing].description, -1, text_width);
						break;
				}
				if (Controller.release_up){
					pause_lesser_position=max(--pause_lesser_position, 0);
				} else if (Controller.release_down){
					pause_lesser_position=min(++pause_lesser_position, ds_list_size(list_magic)-1);
				} else if (Controller.release_b||Controller.release_right){
					pause_greater=PauseMagicScreens.base;
				} else if (Controller.release_a||Controller.release_l||Controller.release_r){
					switch (list_category[| pause_greater_position]){
						case MagicClasses.effects:
							// nothing
							break;
						case MagicClasses.powers:
							// nothing? maybe?
							break;
						case MagicClasses.shout:
							var shout=list_magic[| pause_lesser_position];
						
							break;
						default:
							EquipSpell(Actors.playable, list_magic[| pause_lesser_position]);
							break;
					}
				} else if (Controller.release_x){
					switch (list_category[| pause_greater_position]){
						case MagicClasses.shout:
							if (thing.unlocked<thing.words){
								if (player.souls>0){	// More words to unlock, have enough souls
									pause_greater=PauseMagicScreens.unlock;
								} else {				// More words to unlock, not enough souls
									pause_greater=PauseMagicScreens.cantunlock;
								}
							} else {					// No more words to unlock
								pause_greater=PauseMagicScreens.cantuse;
							}
							break;
					}
				}
				break;
			case PauseMagicScreens.unlock:
				drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
				var x_no=(x1+x2)/3;
				var x_yes=(x1+x2)*2/3;
				var y_response=(center_y+y2)/2;
				var response_width=(x_yes-x_no);
				draw_set_font(FontPauseRegular);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_color(c_white);
				draw_text_ext(center_x, center_y, "Would you like to spend one Dragon Soul to unlock the next word of "+all_shouts[thing.index].name+"?", -1, text_width);
				draw_text(x_no, y_response, "No");
				draw_text(x_yes, y_response, "Yes");
				draw_sprite(spr_menu_arrow, 0, x_no+response_width*pause_boolean_position-64, y_response);
				if (Controller.release_left||Controller.release_right){
					pause_boolean_position=!pause_boolean_position;
				} else if (Controller.release_a){
					if (pause_boolean_position){
						thing.unlocked++;
						player.souls--;
					}
					pause_greater=PauseMagicScreens.contents;
				} else if (Controller.release_b){
					pause_greater=PauseMagicScreens.contents;
				}
				break;
			case PauseMagicScreens.cantunlock:
				drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
				var y_response=(center_y+y2)/2;
				draw_set_font(FontPauseRegular);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_color(c_white);
				draw_text_ext(center_x, center_y, "You do not have any Dragon Souls to unlock the next word of "+all_shouts[thing.index].name+" with.", -1, text_width);
				draw_text(center_x, y_response, "Okay");
				draw_sprite(spr_menu_arrow, 0, center_x-64, y_response);
				if (Controller.release_a||Controller.release_b){
					pause_greater=PauseMagicScreens.contents;
				}
				break;
			case PauseMagicScreens.cantuse:
				drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
				var y_response=(center_y+y2)/2;
				draw_set_font(FontPauseRegular);
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
				draw_set_color(c_white);
				draw_text_ext(center_x, center_y, "There are no words available to unlock for "+all_shouts[thing.index].name+".", -1, text_width);
				draw_text(center_x, y_response, "Okay");
				draw_sprite(spr_menu_arrow, 0, center_x-64, y_response);
				if (Controller.release_a||Controller.release_b){
					pause_greater=PauseMagicScreens.contents;
				}
				break;
		}
		ds_list_destroy(list_magic);
	}

	pause_menu_offset=lerp(pause_menu_offset, 0, 0.1);
	pause_menu_image_index=pause_menu_image_index+ANIMATION_ITEM_PER_SECOND/game_get_speed(gamespeed_fps);

	ds_list_destroy(list);
	ds_list_destroy(list_category);


}
