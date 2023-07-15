function drawPauseMenuSkills() {
	// Some placement variables
	var frame_width=320;
	var border_width=2;
	var frame_bottom=640;
	var frame_top=80;
	var center_x=1280/2;
	var top_y=80/2;
	var text_y=frame_bottom+(720-frame_bottom)/2;
	var text_description_y=frame_bottom*3/4;
	var text_width=1280/2;

	var player=GetMyActor(Actors.playable);
	var sl=array_length_1d(all_skills);

	// Draw the category frame
	draw_set_alpha(pause_base_alpha);
	draw_set_color(c_black);
	draw_rectangle(0, frame_bottom-pause_menu_offset, 1280, 720, false);
	draw_rectangle(0, 0, 1280, frame_top+pause_menu_offset, false);
	draw_set_alpha(1);
	draw_line_width(0, frame_bottom-pause_menu_offset, 1280, frame_bottom-pause_menu_offset, border_width);
	draw_line_width(0, frame_top+pause_menu_offset, 1280, frame_top+pause_menu_offset, border_width);

	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(FontPauseRegular);
	draw_set_color(c_white);

	// Draw the three main stats
	var x_mp=1280/4;
	var x_hp=1280/2;
	var x_sp=1280*3/4;
	draw_magic(x_mp, text_y-pause_menu_offset, true, true);
	draw_health(x_hp, text_y-pause_menu_offset, true, true);
	draw_stamina(x_sp, text_y-pause_menu_offset, true, true);

	// Draw the bio stats

	draw_set_halign(fa_center);
	draw_text(x_mp, top_y+pause_menu_offset, player.name);
	draw_level(x_hp, top_y+pause_menu_offset, true);
	draw_text(x_sp, top_y+pause_menu_offset, all_races[player.race].name);

	if (player.character_perk_points>0){
		var x1=1280/2-128;
		var y1=frame_top+pause_menu_offset+32;
		var x2=1280/2+128;
		var y2=y1+32;
		drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
		draw_set_color(c_white);
		draw_text(1280/2, (y1+y2)/2, "Perks to increase: "+string(player.character_perk_points));
	}

	// Draw the rotation

	for (var i=-2; i<=2; i++){
		var n=(pause_greater_position+i+sl)%sl;
		var position=1+2*(i+2);
		draw_stat(n, position*W/10, 720/2, true);
		draw_sprite(all_skills[n].sprite, 0, position*W/10, 720/3);
	}

	draw_text_ext(center_x, text_description_y, all_skills[pause_greater_position].description, -1, text_width);

	// Do you need to level up?

	if (get_character_level_experience(player.character_level+1)<player.character_exp){
		pause_greater=PauseSkillScreens.levelup;
	}

	switch (pause_greater){
		case PauseSkillScreens.base:
			if (Controller.release_left){
				pause_greater_position=(--pause_greater_position+sl)%sl;
			} else if (Controller.release_right){
				pause_greater_position=(++pause_greater_position+sl)%sl;
			} else if (Controller.release_down){
				pause_stage=PauseMenu.rose;
			} else if (Controller.release_up||Controller.release_a){
				pause_greater=PauseSkillScreens.perk;
				pause_lesser_position=0;
			}
			break;
		case PauseSkillScreens.levelup:
			var x1=1280/2-256;
			var y1=720/2-64;
			var x2=1280/2+256;
			var y2=720/2+64;
			drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			var xa=x1+(x2-x1)/4;
			var xb=x1+(x2-x1)/2;
			var xc=x1+(x2-x1)*3/4;
			var text_y=y1+(y2-y1)/3;
			var line_y=(y1+y2)/2;
			var subtext_y=y1+(y2-y1)*2/3;
			draw_set_color(c_white);
			draw_text(xb, text_y, "You leveled up! Choose an attribute to advance:");
			draw_line_width(x1+32, line_y, x2-32, line_y, border_width);
			draw_text(xa, subtext_y, "Magicka");
			draw_text(xb, subtext_y, "Health");
			draw_text(xc, subtext_y, "Stamina");
			var xwidth=(xb-xa);
			draw_sprite(spr_menu_arrow, 0, xa-80+pause_lesser_position*xwidth, subtext_y);
			if (Controller.release_left){
				pause_lesser_position=(--pause_lesser_position+3)%3;
			} else if (Controller.release_right){
				pause_lesser_position=(++pause_lesser_position+3)%3;
			} else if (Controller.release_a){
				switch (pause_lesser_position){
					case 0:
						player.st_mod_mp+=10;
						break;
					case 1:
						player.st_mod_hp+=10;
						break;
					case 2:
						player.st_mod_sp+=10;
						break;
				}
				/*
				 * LEVEL UP
				 */
				player.st_act_mp=get_max_mp(Actors.playable);
				player.st_act_hp=get_max_hp(Actors.playable);
				player.st_act_sp=get_max_sp(Actors.playable);
				player.character_level++;
				player.character_perk_points++;
				for (var i=0; i<array_length_1d(player.skills_trained_this_level); i++){
					player.skills_trained_this_level[i]=0;
				}
				pause_greater=PauseSkillScreens.base;
			}
			break;
		case PauseSkillScreens.perk:
			var skill=all_skills[pause_greater_position];
			var n=ds_list_size(skill.perks);
			var x1=1280/2-320;
			var y1=720/2-32*(n/2);
			var x2=1280/2+320;
			var y2=720/2+32*(n/2);
			// Draw it twice to increase the alpha
			drawPauseMenuInventoryBox(x1, y1-32, x2, y2, border_width);
			drawPauseMenuInventoryBox(x1, y1-32, x2, y2, border_width);
			draw_line_width(x1+64, y1, x1+64, y2, border_width);
			draw_line_width(W/2, y1, W/2, y2, border_width);
			draw_line_width(W/2+64, y1, W/2+64, y2, border_width);
			for (var i=1; i<n; i++){
				draw_line_width(x1, y1+32*i, x2, y1+32*i, border_width);
			}
			draw_set_color(c_white);
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			draw_text(x1+16, y1-16, "Lv.");
			draw_text(x1+16+64, y1-16, "Name");
			draw_text(W/2+16, y1-16, "Req.");
			draw_text(W/2+16+64, y1-16, "Prerequisites");
			// For each Perk, draw the important stuff
			for (var i=0; i<n; i++){
				var perk=skill.perks[| i];
				if (pause_lesser_position==i){
					var spacing=TAB+TAB;
					draw_sprite(spr_menu_arrow, 0, x1+64, y1+16+32*i);
				} else {
					var spacing="";
				}
				var pl=player.perk_levels[perk.reflexive];
				if (pl==array_length_1d(perk.require)){
					draw_set_color(COLOR_PERK_MAX);
				} else if (drawPauseMenuSkillsCanLearnPerk(Actors.playable, perk.reflexive)){
					draw_set_color(COLOR_PERK_AVAILABLE);
				} else {
					draw_set_color(COLOR_PERK_UNAVAILABLE);
				}
				draw_text(x1+16, y1+16+32*i, string(pl)+"/"+string(array_length_1d(perk.require)));
				draw_text(x1+16+64, y1+16+32*i, spacing+perk.name);
				if (pl<array_length_1d(perk.require)&&perk.require[pl]>0){
					draw_text(W/2+16, y1+16+32*i, perk.require[pl]);
				} else {
					draw_text(W/2+16, y1+16+32*i, "-");
				}
			}
			// Draw the prerequisites
			perk=skill.perks[| pause_lesser_position];
			var prerequisites=array_length_1d(perk.prereq);
			if (prerequisites>0){
				for (var i=0; i<prerequisites; i++){
					if (ActorHasPerk(Actors.playable, perk.prereq[i])){
						draw_set_color(COLOR_PERK_AVAILABLE);
					} else {
						draw_set_color(COLOR_PERK_UNAVAILABLE);
					}
					draw_text(W/2+16+64, y1+16+32*i, all_perks[perk.prereq[i]].name);
				}
			} else {
				draw_set_color(COLOR_PERK_AVAILABLE);
				draw_text(W/2+16+64, y1+16, "None");
			}
			// Draw the description
			var y1=y2+32;
			var y2=y1+128;
			drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
			drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text_ext(center_x, (y1+y2)/2, string_replace_all(perk.description, "&", string(perk.bonus[min(player.perk_levels[perk.reflexive]+1, array_length_1d(perk.bonus)-1)])), -1, (x2-x1)-32);
			// Controls
			if (Controller.release_b){
				pause_greater=PauseSkillScreens.base;
			} else if (Controller.release_down){
				pause_lesser_position=min(++pause_lesser_position, n-1);
			} else if (Controller.release_up){
				pause_lesser_position=max(--pause_lesser_position, 0);
			} else if (Controller.release_a){
				if (drawPauseMenuSkillsCanLearnPerk(Actors.playable, perk.reflexive)&&player.character_perk_points>=0){
					AdvancePerk(Actors.playable, perk.reflexive);
					player.character_perk_points--;
				}
			}
			break;
	}

	pause_menu_offset=lerp(pause_menu_offset, 0, 0.1);
	pause_menu_image_index=pause_menu_image_index+ANIMATION_ITEM_PER_SECOND/game_get_speed(gamespeed_fps);


}
