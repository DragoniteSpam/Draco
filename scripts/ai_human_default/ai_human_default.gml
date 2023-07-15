/// @description	Basic AI for people.
///	@param	battler
/// @param	options
function ai_human_default() {

	var actor=GetMyActor();
	var race=all_races[actor.race];

	var skill_onehand=GetSkillLevel(actor_index, Skills.one_hand);
	var skill_twohand=GetSkillLevel(actor_index, Skills.two_hand);
	var skill_archery=GetSkillLevel(actor_index, Skills.archery);
	var skill_destruction=GetSkillLevel(actor_index, Skills.destruct);

	var max_skill=max(skill_onehand, skill_twohand, skill_archery, skill_destruction);

	if (max_skill==skill_onehand){
		// unarmed check?
		if (actor.equip_left==noone&&actor.equip_right==noone){
			var max_damage=0;
			var second_damage=0;
			var max_stack=noone;
			var second_stack=noone;
			for (var i=0; i<ds_list_size(actor.inventory); i++){
				var base_item=all_items[actor.inventory[| i].index];
				if (base_item.equip==ItemEquipClasses.onehand){
					if (base_item.base_power>max_damage){
						second_damage=max_damage;
						second_stack=max_stack;
						max_damage=base_item.base_power;
						max_stack=actor.inventory[| i];
					} else if (base_item.base_power>second_damage){
						second_damage=base_item.base_power;
						second_stack=actor.inventory[| i];
					}
				}
			}
			if (max_stack!=noone){
				EquipRightHand(actor_index, max_stack);
			}
			if (second_stack!=noone){
				EquipLeftHand(actor_index, second_stack);
			} else {
				var max_defense=0;
				var max_shield=noone;
				for (var i=0; i<ds_list_size(actor.inventory); i++){
					var base_item=all_items[actor.inventory[| i].index];
					if (base_item.equip==ItemEquipClasses.shield){
						if (base_item.base_power>max_defense){
							max_defense=base_item.base_power;
							max_shield=actor.inventory[| i];
						}
					}
				}
				if (max_shield!=noone){
					EquipLeftHand(actor_index, max_shield);
				}
			}
			if (actor.equip_left==noone){
				var attack=BattleOptions.punch;
			} else {
				var attack=BattleOptions.attack;
			}
		} else {
			var attack=BattleOptions.attack;
		}
		var combat_style=CombatStyles.physical;
	} else if (max_skill==skill_twohand){
		// unarmed check?
		if (actor.equip_left==noone&&actor.equip_right==noone){
			var max_damage=0;
			var max_stack=noone;
			for (var i=0; i<ds_list_size(actor.inventory); i++){
				var base_item=all_items[actor.inventory[| i].index];
				if (base_item.equip==ItemEquipClasses.twohand){
					if (base_item.base_power>max_damage){
						max_damage=base_item.base_power;
						max_stack=actor.inventory[| i];
					}
				}
			}
			if (max_stack!=noone){
				EquipRightHand(actor_index, max_stack);
			}
			if (actor.equip_right==noone){
				var attack=BattleOptions.punch;
			} else {
				var attack=BattleOptions.attack;
			}
		} else {
			var attack=BattleOptions.attack;
		}
		var combat_style=CombatStyles.physical;
	} else if (max_skill==skill_archery){
		// unarmed?
		if (actor.equip_left==noone&&actor.equip_right==noone){
			var max_damage=0;
			var max_stack=noone;
			for (var i=0; i<ds_list_size(actor.inventory); i++){
				var base_item=all_items[actor.inventory[| i].index];
				if (base_item.equip==ItemEquipClasses.bow){
					if (base_item.base_power>max_damage){
						max_damage=base_item.base_power;
						max_stack=actor.inventory[| i];
					}
				}
			}
			if (max_stack!=noone){
				EquipRightHand(actor_index, max_stack);
			}
			if (actor.equip_right==noone){
				var attack=BattleOptions.punch;
			} else {
				var attack=BattleOptions.attack;
			}
		} else {
			var attack=BattleOptions.attack;
		}
		var combat_style=CombatStyles.physical;
	} else {
		// unarmed?
		var max_power=0;
		var max_spell=noone;
		for (var i=0; i<actor.magic; i++){
			var base_spell=all_effects[actor.magic[| i]];
			if (base_spell.school==MagicClasses.destruction){
				if (base_spell.def_true>max_power){
					max_power=base_spell.def_true;
					max_spell=actor.magic[| i];
				}
			}
		}
		EquipSpell(actor_index, max_spell);
		if (actor.st_act_mp>=all_effects[actor.equip_spell].cost){
			var attack=BattleOptions.magic;
			var combat_style=CombatStyles.magical;
		} else if (actor.equip_right==noone){
			var max_damage=0;
			var max_stack=noone;
			for (var i=0; i<ds_list_size(actor.inventory); i++){
				var base_item=all_items[actor.inventory[| i].index];
				if (base_item.equip==ItemEquipClasses.onehand){
					if (base_item.base_power>max_damage){
						max_damage=base_item.base_power;
						max_stack=actor.inventory[| i];
					}
				}
			}
			if (max_stack!=noone){
				EquipRightHand(actor_index, max_stack);
			}
			if (actor.equip_right==noone){
				var attack=BattleOptions.punch;
				var combat_style=CombatStyles.physical;
			} else {
				var attack=BattleOptions.attack;
				var combat_style=CombatStyles.physical;
			}
		} else {
			var attack=BattleOptions.attack;
			var combat_style=CombatStyles.physical;
		}
	}

	if (can_attack){
		OVERWORLD_ATTACK(combat_style, game_get_speed(gamespeed_fps));	// always power attack if you have enough stamina
	}


}
