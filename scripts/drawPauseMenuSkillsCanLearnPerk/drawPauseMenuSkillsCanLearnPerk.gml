///	@description	Returns whether the specified Actor can learn the next level of the specified perk. Returns false if the perk is at its max level.
///	@param	ActorIndex
///	@param	PerkIndex
function drawPauseMenuSkillsCanLearnPerk(argument0, argument1) {

	var actor=World.game_actors[argument0];
	var perk=all_perks[argument1];

	if (actor.perk_levels[argument1]==array_length_1d(perk.require)){
		return false;
	}

	var has_prereq=false;
	for (var i=0; i<array_length_1d(perk.prereq); i++){
		if (ActorHasPerk(argument0, perk.prereq[i])){
			has_prereq=true;
			break;
		}
	}

	if (!has_prereq&&array_length_1d(perk.prereq)>0){
		return false;
	}

	for (var i=0; i<=Skills.restore; i++){
		var skill=all_skills[i];
		for (var j=0; j<ds_list_size(skill.perks); j++){
			if (skill.perks[| j]==perk){
				var perk_skill=i;
				break;
			}
		}
	}

	return GetSkillLevel(argument0, perk_skill)>=perk.require[actor.perk_levels[argument1]];


}
