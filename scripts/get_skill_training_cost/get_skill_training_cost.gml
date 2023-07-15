///	@description	Gets the cost of a training session from a skill trainer.
///	@param	ActorIndex
///	@param	SkillIndex
function get_skill_training_cost(argument0, argument1) {

	var actor=GetMyActor(argument0);
	var skill=GetSkillLevel(argument0, argument1);

	if (skill<=50){
		return 10*skill+50;	// n(10b+5n+45) where n=1
	} else if (skill<=75){
		return 30*skill+50;	// n(30b+15n+35) where n=1
	} else {
		return 50*skill+50;	// n(50b+25n+25) where n=1
	}


}
