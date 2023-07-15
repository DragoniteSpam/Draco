function _cc_Battle() {
	enum BattleOptions {
		no,
		attack,
		powerattack,
		punch,
		bash,
		defend,
		magic,
		ult,
		daily,
		bite,
		swipe,
		flee,
	}

	battle_option_names=array_create(BattleOptions.flee, "");
	battle_option_names[BattleOptions.attack]="Attack";
	battle_option_names[BattleOptions.powerattack]="Power Attack";
	battle_option_names[BattleOptions.punch]="Punch";
	battle_option_names[BattleOptions.bash]="Bash";
	battle_option_names[BattleOptions.defend]="Defend";
	battle_option_names[BattleOptions.magic]="Magic";
	battle_option_names[BattleOptions.ult]="Shout";
	battle_option_names[BattleOptions.daily]="Power";

	battle_option_names[BattleOptions.bite]="Bite";
	battle_option_names[BattleOptions.swipe]="Swipe";

	battle_option_names[BattleOptions.flee]="Flee";

	enum CombatStyles {
		no,
		physical,
		magical,
		shout,
	}


}
