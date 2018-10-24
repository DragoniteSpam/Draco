///	@description	Process the turn of the battle (attacks, defends, etc.) Just acts on World's variables because there's too much to pass as a parameter.

// @todo Get the actual damage calculations.

var race_active=all_races[battle_active.race];
var race_target=all_races[battle_target.race];

battle_active.blocking=false;

switch (battle_active_move){
	case BattleOptions.attack:
		if (battle_active.equip_left!=noone){
			var hand_left=all_items[battle_active.equip_left.index];
			battle_target.st_act_hp-=hand_left.base_power;
		}
		if (battle_active.equip_right!=noone){
			var hand_right=all_items[battle_active.equip_right.index];
			battle_target.st_act_hp-=hand_right.base_power;
		}
		break;
	case BattleOptions.powerattack:
		if (battle_active.equip_left!=noone){
			var hand_left=all_items[battle_active.equip_left.index];
			battle_target.st_act_hp-=hand_left.base_power*1.5;
			battle_active.st_act_sp-=(40+hand_left.weight*2);
		}
		if (battle_active.equip_right!=noone){
			var hand_right=all_items[battle_active.equip_right.index];
			battle_target.st_act_hp-=hand_right.base_power*1.5;
			battle_active.st_act_sp-=(40+hand_right.weight*2);
		}
		// @todo I think there's a perk that decreases power attack cost
		break;
	case BattleOptions.punch:
		battle_target.st_act_hp-=race_active.unarmed_damage;
		break;
	case BattleOptions.bash:
		break;
	case BattleOptions.defend:
		battle_active.blocking=true;
		break;
	case BattleOptions.magic:
		break;
	case BattleOptions.ult:
		break;
	case BattleOptions.daily:
		break;
	// Racial unarmed
	case BattleOptions.bite:
	case BattleOptions.swipe:
		battle_target.st_act_hp-=race_active.unarmed_damage;
		break;
}

// @todo Check for perks or bonuses such as "unarmed damage"