/// @description	General method for attacking the square in front of you
/// @param	combatstyle
///	@param	attack_time
function OVERWORLD_ATTACK(argument0, argument1) {

	var player=GetMyActor();
	can_attack=false;
	alarm[ALARM_ATTACK]=game_get_speed(gamespeed_fps)/2;	// @todo This needs to be replaced with code instead of a constant-ish value

	if (argument0==CombatStyles.physical){
		swinging=player.alias.direction;
		if (player.equip_right==noone){
			var eright=BattleOptions.punch;
			var right_item_weight=0;
		} else {
			var eright=player.equip_right;
			var right_item_weight=all_items[eright.index].weight;
		}
		if (player.equip_left==noone){
			var eleft=BattleOptions.no;
			var left_item_weight=0;
		} else {
			var eleft=player.equip_left;
			var left_item_weight=all_items[eleft.index].weight;
		}
		// Single weapon: one-handed
		if ((player.equip_right!=noone&&all_items[eright.index].equip==ItemEquipClasses.onehand)&&player.equip_left==noone||
			((player.equip_left!=noone&&all_items[eleft.index].equip==ItemEquipClasses.onehand)&&player.equip_right==noone)){
			var damage=2;
			var stamina_use=1;
			var style=ItemEquipClasses.onehand;
		// Single weapon: two-handed
		} else if (player.equip_right!=noone&&all_items[eright.index].equip==ItemEquipClasses.twohand){
			var damage=2;
			var stamina_use=1;
			var style=ItemEquipClasses.twohand;
		// Dual-weilding
		} else if ((player.equip_right!=noone&&all_items[eright.index].equip==ItemEquipClasses.onehand)&&
			(player.equip_left!=noone&&all_items[eleft.index].equip==ItemEquipClasses.onehand)){
			var damage=1.5;
			var stamina_use=0.5;
			var style=ItemEquipClasses.onehand;
		// Unarmed
		} else if (player.equip_right==noone&&player.equip_left==noone){
			var damage=2;
			var stamina_use=1;
			var style=ItemEquipClasses.onehand;
		}
		if (style==ItemEquipClasses.onehand){
			var perk_effect=GetPerkBonus(actor_index, Perks.FightingStance)/100;
		} else {
			var perk_effect=GetPerkBonus(actor_index, Perks.ChampionsStance)/100;
		}
		var pa_cost=40+((right_item_weight+left_item_weight)*2)*stamina_use*(1-perk_effect);
		var powerattack=(argument1>game_get_speed(gamespeed_fps)/2)&&(player.st_act_sp>=pa_cost);
		if (powerattack){
			player.st_act_sp=max(0, player.st_act_sp-pa_cost);
		}
		if (!is_free(player.alias.to_x, player.alias.to_y)){
			var s=World.grid[# player.alias.to_x, player.alias.to_y];
			if ((eright==BattleOptions.attack||eright==BattleOptions.powerattack)&&player.equip_right.enchantment_charge>0){
				var ench_right=player.equip_right.enchantment;
			} else {
				var ench_right=noone;
			}
			if ((eleft==BattleOptions.attack||eleft==BattleOptions.powerattack)&&player.equip_right.enchantment_charge>0){
				var ench_left=player.equip_left.enchantment;
			} else {
				var ench_left=noone;
			}
			var skill=Skills.one_hand;
			if (player.equip_right!=noone){
				if (all_items[player.equip_right.index].equip==ItemEquipClasses.bow){		// archery
					var skill_level=GetSkillLevel(actor_index, Skills.archery);
					var perk_effects=player.perk_levels[Perks.Overdraw];
					var active_effect=get_active_effect_modifier(actor_index, AllEffects.FortifyArchery);
					skill=Skills.archery;
				} else if (player.equip_right==player.equip_left){							// two-handed
					var skill_level=GetSkillLevel(actor_index, Skills.two_hand);
					var perk_effects=player.perk_levels[Perks.Barbarian];
					var active_effect=get_active_effect_modifier(actor_index, AllEffects.FortifyTwoHanded);
					if (powerattack){
						skill_level*=2;
					}
					skill=Skills.two_hand;
				} else {																	// one-handed
					var skill_level=GetSkillLevel(actor_index, Skills.one_hand);
					var perk_effects=player.perk_levels[Perks.Armsman];
					var active_effects=get_active_effect_modifier(actor_index, AllEffects.FortifyOneHanded);
					if (powerattack){
						skill_level*=2;
					}
					skill=Skills.one_hand;
				}
			} else {
				var skill_level=15;
				if (player.equip_hands!=noone&&all_items[player.equip_hands.index].armor==ItemArmorTypes.heavy&&HasPerk(actor_index, Perks.FistsOfSteel)){
					var perk_effects=all_items[player.equip_hands.index].base_power;
				} else {
					var perk_effects=0;
				}
				var active_effects=get_active_effect_modifier(actor_index, AllEffects.FortifyUnarmed);
			}
			var input_damage=get_damage_rating(actor_index)*(1+skill_level/200)+(1+perk_effects)*(1+active_effects);	// *(1+other effects)
			with (s){
				script_execute(react_to_attack, player.alias.actor_index, argument0, input_damage, array_combine(ench_left, ench_right), skill);
			}
		}
	} else if (argument0==CombatStyles.magical){
		if (player.equip_spell!=noone){
			var base_effect=all_effects[player.equip_spell];
			if (player.st_act_mp>=base_effect.cost){
				var powercast=(argument1>game_get_speed(gamespeed_fps)/2&&player.st_act_sp>=base_effect.cost);
				if (!is_free(player.alias.to_x, player.alias.to_y)){
					var s=World.grid[# player.alias.to_x, player.alias.to_y];
					var spell=instantiate(ItemEnchantment);
					spell.index=player.equip_spell;
					spell.enchantment_power=base_effect.def_true*(1+GetSkillLevel(actor_index, base_effect.school)/200)*(powercast?2.5:1);
					var skill;
					switch (base_effect.school){
						case MagicClasses.alteration:
							skill=Skills.alter;
							break;
						case MagicClasses.conjouration:
							skill=Skills.conjour;
							break;
						case MagicClasses.destruction:
							skill=Skills.destruct;
							break;
						case MagicClasses.illusion:
							skill=Skills.illusion;
							break;
						case MagicClasses.restoration:
							skill=Skills.restore;
							break;
					}
					var magical_effects=script_execute(base_effect.on_valid_target, player, GetMyActor(s.actor_index), spell, powercast);
					with (s){
						script_execute(react_to_attack, player.alias.actor_index, argument0, magical_effects, skill);
					}
					with (spell){
						instance_destroy();
					}
				}
				// This is probably for animation purposes but it can be for other things, too
				script_execute(all_effects[player.equip_spell].on_cast, to_x, to_y);
				player.st_act_mp-=base_effect.cost;
				if (powercast){
					player.st_act_sp-=base_effect.cost;
				}
			} else {
				AddNotification("You don't have enough magicka for that!");
			}
		}
	}


}
