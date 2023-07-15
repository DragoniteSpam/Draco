///	@description	Adds experience to the specified skill
///	@param	ActorIndex
///	@param	skill
///	@param	amount
function AddExperience() {

	var actor=GetMyActor(argument[0]);
	var current_exp=actor.skill_exp[argument[1]];
	var current_level=GetSkillLevel(argument[0], argument[1]);

	SetSkillExperience(argument[0], argument[1], current_exp+argument[2]);

	var target=current_level;
	var n=0;
	while (true){
		++n;
		if (current_exp+argument[2]>get_skill_level_experience(argument[1], current_level+n)){
			target=current_level+n;
		} else {
			break;
		}
	}
	if (target>current_level){
		SetSkillLevel(argument[0], argument[1], target);
		AdvanceExperience(argument[0], target-current_level);
		// @todo Some kind of graphic for this
		// AdvanceExperience already contains the level up code
	}

	return GetSkillLevel(argument[0], argument[1]);


}
