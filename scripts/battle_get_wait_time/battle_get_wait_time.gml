///	@description	Gets the wait time for the specified actor and move.
///	@param	ActorData
///	@param	BattleOption

switch (argument1){
	case BattleOptions.attack:
		return all_items[argument0.equip_right.index].weight/10+all_items[argument0.equip_left.index].weight/10;
		break;
	case BattleOptions.powerattack:
		return all_items[argument0.equip_right.index].weight/5+all_items[argument0.equip_left.index].weight/5;
		break;
	case BattleOptions.punch:
		return 1;
		break;
	case BattleOptions.bash:
		return all_items[argument0.equip_left.index].weight/10;
		break;
	case BattleOptions.defend:
		return 1;
		break;
	case BattleOptions.magic:
		return 0.5;
		break;
	case BattleOptions.ult:
		return 0.25;
		break;
	case BattleOptions.daily:
		return 0.25;
		break;
	// Racial unarmed
	case BattleOptions.bite:
		return 1;
		break;
	case BattleOptions.swipe:
		return 1;
		break;
}