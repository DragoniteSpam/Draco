///	@description	Gets the cost of a training session from a skill trainer.
///	@param	ActorIndex
///	@param	SkillIndex

var actor=GetMyActor(argument0);
var skill=actor.skill_level[argument1];

if (skill<=50){
	return 10*skill+50;	// n(10b+5n+45) where n=1
} else if (skill<=75){
	return 30*skill+50;	// n(30b+15n+35) where n=1
} else {
	return 50*skill+50;	// n(50b+25n+25) where n=1
}