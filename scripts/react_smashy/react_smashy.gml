///	@description	What happens when you attack a bush.
///	@param	attacking_actor
///	@param	combat_style
///	@param	magical
///	@param	skill
function react_smashy(argument0, argument1, argument2, argument3) {

	var attacker=GetMyActor(argument0);
	var me=GetMyActor();

	var magical=argument2;
	var skill=argument3;

	if (argument1==CombatStyles.physical){
		image_speed=1;
	}


}
