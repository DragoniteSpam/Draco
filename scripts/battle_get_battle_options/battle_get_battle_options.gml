///	@description	Gets a list of BattleOptions which can be executed in battle.
///	@param	battler

var list=ds_list_create();

// Armed attacks
if (argument0.equip_right!=noone){
	ds_list_add(list, BattleOptions.attack);
	if (argument0.st_act_sp>0){
		ds_list_add(list, BattleOptions.powerattack);
	}
} else {
	// Unarmed attack(s)
	var race=all_races[argument0.race];
	for (var i=0; i<array_length_1d(race.unarmed_attacks); i++){
		ds_list_add(list, race.unarmed_attacks[i]);
	}
}

// Left handed attacks
if (argument0.equip_left!=noone){
	ds_list_add(list, BattleOptions.defend);
	if (argument0.st_act_sp>0){
		ds_list_add(list, BattleOptions.bash);
	}
}

// Spells
if (argument0.equip_spell!=noone&&argument0.st_act_mp>argument0.equip_spell.cost){
	ds_list_add(list, BattleOptions.magic);
}

// Shouts and Powers
if (argument0.shout_timer<=0&&argument0.equip_shout!=noone){
	ds_list_add(list, BattleOptions.ult);
}
// @todo implement the power cooldown
if (argument0.equip_power!=noone){
	ds_list_add(list, BattleOptions.daily);
}

// Fleeing is always an option?
if (battle_fleeable){
	ds_list_add(list, BattleOptions.flee);
}

ds_list_sort(list, true);

return list;