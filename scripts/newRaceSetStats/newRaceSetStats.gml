///	@description	Sets bonus stats of the specified races.
///	@param	RaceIndex
///	@param	SkillIndex1
///	@param	SkillBonus1...

var race=World.all_races[argument[0]];

for (var i=1; i<argument_count; i+=2){
	race.skill[@ argument[i]]=DEFAULT_SKILL_LEVEL+argument[i+1];
}