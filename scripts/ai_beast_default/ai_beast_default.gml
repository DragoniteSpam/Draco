/// @description	Basic AI for animals.
///	@param	battler
/// @param	options (unused)
function ai_beast_default() {

	var actor=GetMyActor();
	var race=all_races[actor.race];

	var option=race.unarmed_attacks[irandom(array_length_1d(race.unarmed_attacks)-1)];
	if (can_attack){
		OVERWORLD_ATTACK(CombatStyles.physical, game_get_speed(gamespeed_fps));
	}


}
