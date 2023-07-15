/// @description Draw the inventory for one or more Characters.
/// @param [secondary] (Optional) The second Solid to draw the inventory of
function drawPauseMenuInventory() {

	// Some placement variables
	var frame_width=320;
	var border_width=2;
	var frame_bottom=640;
	var text_y=frame_bottom+(720-frame_bottom)/3;
	var text_y_b=frame_bottom+(720-frame_bottom)*2/3;

	var player=GetMyActor(Actors.playable);

	// Create the required lists
	var list=ds_list_create();
	var list_int=ds_list_create();
	var list_owner=ds_list_create();
	var list_quantity=ds_list_create();
	if (argument_count==1&&argument[0]!=noone){
		var char=GetMyActor(argument[0]);
		ds_list_add(list, char.name);
		ds_list_add(list_int, ItemClasses.no);
		ds_list_add(list_owner, char);
		ds_list_add(list_quantity, ds_list_size(char.inventory));
		var category=ItemClasses.no;
		for (var i=0; i<ds_list_size(char.inventory); i++){
			var stack=char.inventory[| i];
			var new_category=all_items[char.inventory[| i].index].class;
			if (category!=new_category){
				if (new_category==ItemClasses.misc){
					var add=" - "+string(GetGold(argument[0]))+" gold";
				} else {
					var add="";
				}
				ds_list_add(list, TAB+World.item_class_names[new_category]+add);
				ds_list_add(list_int, new_category);
				ds_list_add(list_owner, char);
				ds_list_add(list_quantity, 1);
				category=new_category;
			} else {
				list_quantity[| ds_list_size(list_quantity)-1]++;
			}
		}
	} else {
		var char=noone;
	}

	ds_list_add(list, player.name);
	ds_list_add(list_int, ItemClasses.no);
	ds_list_add(list_owner, player);
	ds_list_add(list_quantity, ds_list_size(player.inventory));
	var category=ItemClasses.no;
	for (var i=0; i<ds_list_size(player.inventory); i++){
		var new_category=all_items[player.inventory[| i].index].class;
		if (category!=new_category){
			if (new_category==ItemClasses.misc){
				var add=" - "+string(GetGold(Actors.playable))+" gold";
			} else {
				var add="";
			}
			ds_list_add(list, TAB+World.item_class_names[new_category]+add);
			ds_list_add(list_int, new_category);
			ds_list_add(list_owner, player);
			ds_list_add(list_quantity, 1);
			category=new_category;
		} else {
			list_quantity[| ds_list_size(list_quantity)-1]++;
		}
	}

	for (var i=0; i<ds_list_size(list); i++){
		if (list_owner[| i]==pause_inventory_temp_owner&&list[| i]==pause_inventory_temp_category){
			pause_greater_position=i;
			pause_inventory_temp_owner=noone;
			pause_inventory_temp_category=-1;
			break;
		}
	}

	pause_greater_position=min(pause_greater_position, ds_list_size(list)-1);

	// Draw the category frame
	draw_set_alpha(pause_base_alpha);
	draw_set_color(c_black);
	draw_rectangle(0+pause_menu_offset, 0, frame_width+pause_menu_offset, 720, false);
	draw_rectangle(0, frame_bottom, 1280, 720, false);
	draw_set_alpha(1);
	draw_line_width(frame_width+pause_menu_offset, 0, frame_width+pause_menu_offset, 720, border_width);
	draw_line_width(0, frame_bottom, 1280, frame_bottom, border_width);

	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	draw_set_font(FontPauseRegular);
	draw_set_color(c_white);

	var x_hp=640+32;
	var x_mp=640+640/3+32;
	var x_sp=640+640*2/3+32;
	draw_health(x_hp, text_y);
	draw_magic(x_mp, text_y);
	draw_stamina(x_sp, text_y);
	draw_text(x_hp, text_y_b, "Weight: "+string(get_carry_weight(Actors.playable))+"/"+string(get_max_carry_weight(Actors.playable)));
	draw_text(x_mp, text_y_b, "Damage: "+string(get_damage_rating(Actors.playable)));
	draw_text(x_sp, text_y_b, "Armor: "+string(get_armor_rating(Actors.playable)));

	for (var i=0; i<ds_list_size(list); i++){
		draw_text(96+pause_menu_offset, 64+32*i, list[| i]);
	}

	draw_sprite(spr_menu_arrow, 0, 32+pause_menu_offset, 64+32*pause_greater_position);

	if (pause_greater==PauseInventoryScreens.base){
		// Scroll through the category list
		if (Controller.release_up){
			pause_greater_position=max(--pause_greater_position, 0);
		} else if (Controller.release_down){
			pause_greater_position=min(++pause_greater_position, ds_list_size(list)-1);
		} else if (Controller.release_a||Controller.release_right){
			if (list_quantity[| pause_greater_position]>0){
				pause_greater=PauseInventoryScreens.contents;
				pause_lesser_position=0;
			}
		} else if (Controller.release_b||Controller.release_left){
			drawPauseMenuQuit();
		} else if (Controller.release_y){	// Take all - use Y instead of X because you may be mashing the Attack (X) button
			if (!pause_exchange_money&&list_owner[| pause_greater_position]==char){
				drawPauseMenuTakeAll(argument[0]);
				drawPauseMenuQuit();
			}
		}
	} else {
		// Draw the outer frame
		draw_set_color(c_black);
		draw_set_alpha(pause_base_alpha);
		draw_rectangle(frame_width+pause_menu_offset, 0, 2*frame_width+pause_menu_offset, 720, false);
		draw_set_alpha(1);
		draw_line_width(2*frame_width+pause_menu_offset, 0, 2*frame_width+pause_menu_offset, 720,  border_width);
		draw_set_color(c_white);
		// Fill the item list
		var list_item=ds_list_create();
		var owner=list_owner[| pause_greater_position];
		for (var i=0; i<ds_list_size(owner.inventory); i++){
			var stack=owner.inventory[| i];
			var base_item=all_items[stack.index];
			if (list_int[| pause_greater_position]==ItemClasses.no||base_item.class==list_int[| pause_greater_position]){
				ds_list_add(list_item, stack);
			}
		}
		// Draw the item list
		for (var i=0; i<ds_list_size(list_item); i++){
			var stack=list_item[| i];
			var base_item=all_items[stack.index];
			if (getItemIsEquipped(stack, list_owner[| pause_greater_position])){
				draw_sprite(spr_menu_equip, getItemIsEquippedIcon(stack, list_owner[| pause_greater_position]), frame_width+96+pause_menu_offset, 64+32*i);
				var spacing=TAB;
			} else {
				var spacing="";
			}
			if (stack.quantity>1){
				var suffix=" ("+string(stack.quantity)+")";
			} else {
				var suffix="";
			}
			draw_text(frame_width+96+pause_menu_offset, 64+32*i, spacing+base_item.name+suffix);
		}
		pause_lesser_position=min(ds_list_size(list_item)-1, pause_lesser_position);
	
		draw_sprite(spr_menu_arrow, 0, frame_width+32+pause_menu_offset, 64+32*pause_lesser_position);
	
		pause_inventory_temp_category=list[| pause_greater_position];
		pause_inventory_temp_owner=list_owner[| pause_greater_position];
		switch (pause_greater){
			case PauseInventoryScreens.contents:
				// Draw the item summary
				var x1=640+80;
				var y1=360-160-128;
				var x2=1280-80;
				var y2=360+160-128;
				var center_x=(x1+x2)/2;
				var center_y=(y1+y2)/2;
				var text_width=(x2-x1)-64;
				var stack=list_item[| pause_lesser_position];
				var base_item=all_items[stack.index];
				var owner=list_owner[| pause_greater_position];
				drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
				draw_set_color(c_white);
				draw_set_halign(fa_center);
				draw_set_font(FontPauseRose);
				draw_text(center_x, center_y, base_item.name);
				draw_sprite_ext(base_item.sprite_index, pause_menu_image_index, center_x, (center_y+y1)/2, 2, 2, 0, c_white, 1);
				draw_set_font(FontPauseRegular);
				draw_line_width(x1+32, center_y+32, x2-32, center_y+32, border_width);
				var str="";
				if (base_item.base_power>0){
					str="Power: "+string(base_item.base_power)+" | ";
				}
				str=str+"Weight: "+string(base_item.weight)+" | Value: "
				if (owner==Player){
					str=str+string(get_sell_price(base_item));
				} else {
					str=str+string(get_buy_price(base_item));
				}
				draw_text(center_x, center_y+64, str);
				var y1=360+160-96;
				var y2=360+160;
				var center_y=(y1+y2)/2;
				drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
				draw_set_color(c_white);
				draw_text_ext(center_x, center_y, base_item.description, -1, text_width);
				// Controls
				if (Controller.release_up){
					pause_lesser_position=max(--pause_lesser_position, 0);
				} else if (Controller.release_down){
					pause_lesser_position=min(++pause_lesser_position, ds_list_size(list_item)-1);
				} else if (Controller.release_a||Controller.release_l||Controller.release_r){
					if (owner==player){
						script_execute(base_item.use_script, stack, Controller.release_l);
					} else {
						// If you must pay
						if (pause_exchange_money){
							if (stack.quantity>5){
								pause_greater=PauseInventoryScreens.quantity_transaction;
								pause_inventory_transaction_quantity=1;
							} else {
								var amt=get_buy_price(base_item);
								if (GetGold(Actors.playable)>=amt){
									RemoveGold(Actors.playable, amt);
									AddGold(argument[0], amt);
									AddItem(Actors.playable, stack.index, 1);
									if (stack.quantity==1&&ds_list_size(list_item)==1){
										pause_greater=PauseInventoryScreens.base;
									}
									RemoveItem(stack, 1, argument[0]);
								}
							}
						// If you may take freely
						} else {
							if (stack.quantity>5&&stack.index!=Items.gold){
								pause_greater=PauseInventoryScreens.quantity_transaction;
								pause_inventory_transaction_quantity=1;
							} else {
								if (stack.index==Items.gold){
									var n=stack.quantity;
								} else {
									var n=1;
								}
								if (owner!=noone){
									// @todo Stealing
								}
								AddItem(Actors.playable, stack.index, n);
								if (stack.quantity==n&&ds_list_size(list_item)==1){
									pause_greater=PauseInventoryScreens.base;
								}
								RemoveItem(stack, n, argument[0]);
							}
						}
					}
				} else if (Controller.release_b||Controller.release_left){
					pause_greater=PauseInventoryScreens.base;
				} else if (Controller.release_x){
					// If you are giving to someone else
					if (char!=noone){
						// If this is your inventory
						if (owner==player){
							// If you must be paid
							if (pause_exchange_money){
								if (stack.quantity>5){
									pause_greater=PauseInventoryScreens.quantity_transaction;
								} else {
									var amt=get_sell_price(base_item);
									if (GetGold(argument[0])>=amt){
										AddGold(Actors.playable, amt);
										RemoveGold(argument[0], amt);
										AddItem(argument[0], stack.index, 1);
										if (stack.quantity==1&&ds_list_size(list_item)==1){
											pause_greater=PauseInventoryScreens.base;
										}
										RemoveItem(stack, 1, Actors.playable);
									}
								}
							// If you may give freely
							} else {
								if (stack.quantity>5){
									pause_greater=PauseInventoryScreens.quantity_transaction;
									pause_inventory_transaction_quantity=1;
								} else {
									AddItem(argument[0], stack.index, 1);
									if (stack.quantity==1&&ds_list_size(list_item)==1){
										pause_greater=PauseInventoryScreens.base;
									}
									RemoveItem(stack, 1, Actors.playable);
								}
							}
						// If this is a container inventory
						} else if (!pause_exchange_money){
							drawPauseMenuTakeAll(argument[0]);
							drawPauseMenuQuit();
						}
					// If you are just chucking the items
					} else {
						if (stack.quantity>5){
							pause_greater=PauseInventoryScreens.quantity_toss;
							pause_inventory_transaction_quantity=1;
						} else {
							if (stack.quantity==1&&ds_list_size(list_item)==1){
								pause_greater=PauseInventoryScreens.base;
							}
							RemoveItem(stack, 1, Actors.playable);
						}
					}
				}
				break;
			case PauseInventoryScreens.quantity_transaction:
				var x1=640+80;
				var y1=360-160;
				var x2=1280-80;
				var y2=360+160;
				var center_x=(x1+x2)/2;
				var center_y=(y1+y2)/2;
				var text_width=(x2-x1)-64;
				var stack=list_item[| pause_lesser_position];
				var base_item=all_items[stack.index];
				var owner=list_owner[| pause_greater_position];
				drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
				draw_set_halign(fa_center);
				draw_set_color(c_white);
				draw_text(center_x, center_y, "How many?");
				draw_text(center_x, center_y+32, string(floor(pause_inventory_transaction_quantity))+"/"+string(stack.quantity));
				var rate=stack.quantity/120;
				if (Controller.left){
					pause_inventory_transaction_quantity=max(pause_inventory_transaction_quantity-rate, 0);
				} else if (Controller.right){
					pause_inventory_transaction_quantity=min(pause_inventory_transaction_quantity+rate, stack.quantity);
				} else if (Controller.release_a){
					var qty=floor(pause_inventory_transaction_quantity);
					pause_greater=PauseInventoryScreens.contents;	// this may be overwritten later if there's nothing left in "contents"
					if (owner==player){
						// If you will be paid
						if (pause_exchange_money){
							var cost=qty*get_sell_price(base_item);
							if (GetGold(argument[0])>=cost){
								AddGold(Actors.playable, cost);
								RemoveGold(argument[0], cost);
								AddItem(argument[0], stack.index, qty);
								if (stack.quantity==qty&&ds_list_size(list_item)==1){
									pause_greater=PauseInventoryScreens.base;
								}
								RemoveItem(stack, qty, Actors.playable);
							} else {
								var safe_qty=GetGold(argument[0]) div get_sell_price(base_item);
								var safe_cost=safe_qty*get_sell_price(base_item);
								RemoveGold(argument[0], safe_cost);
								AddGold(Actors.playable, safe_cost);
								AddItem(argument[0], stack.index, safe_qty);
								if (stack.quantity==qty&&ds_list_size(list_item)==1){
									pause_greater=PauseInventoryScreens.base;
								}
								RemoveItem(stack, safe_qty, Actors.playable);
							}
						// If you are giving freely
						} else {
							AddItem(argument[0], stack.index, qty);
							if (stack.quantity==qty&&ds_list_size(list_item)==1){
								pause_greater=PauseInventoryScreens.base;
							}
							RemoveItem(stack, qty, Actors.playable);
						}
					} else {
						// If you must pay
						if (pause_exchange_money){
							var cost=qty*get_buy_price(base_item);
							if (GetGold(Actors.playable)>=cost){
								RemoveGold(Actors.playable, cost);
								AddGold(argument[0], cost);
								AddItem(Actors.playable, stack.index, qty);
								if (stack.quantity==qty&&ds_list_size(list_item)==1){
									pause_greater=PauseInventoryScreens.base;
								}
								RemoveItem(stack, qty, argument[0]);
							} else {
								var safe_qty=GetGold(Actors.playable) div get_buy_price(base_item);
								var safe_cost=safe_qty*get_buy_price(base_item);
								RemoveGold(Actors.playable, safe_cost);
								AddGold(argument[0], safe_cost);
								AddItem(Actors.playable, stack.index, safe_qty);
								if (stack.quantity==qty&&ds_list_size(list_item)==1){
									pause_greater=PauseInventoryScreens.base;
								}
								RemoveItem(stack, safe_qty, argument[0]);
							}
						// If you may take freely
						} else {
							if (owner!=noone){
								// @todo Stealing
							}
							AddItem(Actors.playable, stack.index, qty);
							if (stack.quantity==qty&&ds_list_size(list_item)==1){
								pause_greater=PauseInventoryScreens.base;
							}
							RemoveItem(stack, qty, argument[0]);
						}
					}
				} else if (Controller.release_b){
					pause_greater=PauseInventoryScreens.contents;
				}
				// After the value(s) are updated draw potential price text.
				if (pause_exchange_money){
					var qty=floor(pause_inventory_transaction_quantity);
					if (owner==Player){
						var cost=qty*get_sell_price(base_item);
						draw_text(center_x, center_y+64, "You will recieve "+string(cost)+" gold.");
						if (cost>GetGold(argument[0])){
							draw_text(center_x, center_y+96, "("+argument[0].name+" does not have this much gold.)");
						}
					} else {
						var cost=qty*get_buy_price(base_item);
						draw_text(center_x, center_y+64, "You must pay "+string(cost)+" gold.");
						if (cost>GetGold(Player)){
							draw_text(center_x, center_y+96, "(You do not have this much gold.)");
						}
					}
				}
				break;
			case PauseInventoryScreens.quantity_toss:
				var x1=640+80;
				var y1=360-160;
				var x2=1280-80;
				var y2=360+160;
				var center_x=(x1+x2)/2;
				var center_y=(y1+y2)/2;
				var text_width=(x2-x1)-64;
				var stack=list_item[| pause_lesser_position];
				var base_item=all_items[stack.index];
				drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
				draw_set_halign(fa_center);
				draw_set_color(c_white);
				draw_text(center_x, center_y, "How many?");
				draw_text(center_x, center_y+32, string(floor(pause_inventory_transaction_quantity))+"/"+string(stack.quantity));
				var rate=stack.quantity/120;
				if (Controller.left){
					pause_inventory_transaction_quantity=max(pause_inventory_transaction_quantity-rate, 0);
				} else if (Controller.right){
					pause_inventory_transaction_quantity=min(pause_inventory_transaction_quantity+rate, stack.quantity);
				} else if (Controller.release_a){
					pause_greater=PauseInventoryScreens.contents;	// this may be overwritten later if there's nothing left in "contents"
					var qty=floor(pause_inventory_transaction_quantity);
					if (stack.quantity==qty&&ds_list_size(list_item)==1){
						pause_greater=PauseInventoryScreens.base;
					}
					RemoveItem(stack, qty, Actors.playable);
				} else if (Controller.release_b){
					pause_greater=PauseInventoryScreens.contents;
				}
				break;
			case PauseInventoryScreens.poison:
				var x1=640+80;
				var y1=360-160;
				var x2=1280-80;
				var y2=360+160;
				var center_x=(x1+x2)/2;
				var center_y=(y1+y2)/2;
				var text_width=(x2-x1)-64;
				var stack=list_item[| pause_lesser_position];
				var base_item=all_items[stack.index];
				var stack_weapon=player.equip_right;
				var base_weapon=all_items[stack_weapon.index];
				draw_text_ext(center_x, center_y, "Would you like to poison your "+base_weapon.name+" with the "+base_item.name+"?", -1, text_width);
				// @todo Finish this
				break;
		}
	
		ds_list_destroy(list_item);
	}

	// Clean up

	pause_menu_offset=lerp(pause_menu_offset, 0, 0.1);
	pause_menu_image_index=pause_menu_image_index+ANIMATION_ITEM_PER_SECOND/game_get_speed(gamespeed_fps);

	ds_list_destroy(list);
	ds_list_destroy(list_int);
	ds_list_destroy(list_owner);


}
