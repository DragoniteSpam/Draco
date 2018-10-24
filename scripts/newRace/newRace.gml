///	@description	Instantiates a Race.
///	@param	name
///	@param	power
///	@param	ability
///	@param	abilityMagnitude
///	@param	health
///	@param	magicka
///	@param	stamina
///	@param	sprite
///	@param	unarmedAttacks
///	@param	unarmedDamage
///	@param	aiScript
///	@param	description

with (instantiate(RaceData)){
	name=argument[0];
	racial_power=argument[1];
	racial_ability=argument[2];
	racial_magnitude=argument[3];
	hp=argument[4];
	magicka=argument[5];
	stamina=argument[6];
	sprite=argument[7];
	unarmed_attacks=argument[8];
	unarmed_damage=argument[9];
	ai=argument[10];
	description=argument[11];
	
	return id;
}