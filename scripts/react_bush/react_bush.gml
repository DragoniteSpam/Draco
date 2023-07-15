///	@description	What happens when you attack a bush.
///	@param	attacking_actor
///	@param	combat_style
///	@param	magical
///	@param	skill
function react_bush(argument0, argument1, argument2, argument3) {

	var attacker=GetMyActor(argument0);
	var me=GetMyActor();

	var magical=argument2;
	var skill=argument3;

	if (argument1==CombatStyles.physical){
		image_speed=1;
	} else if (argument1==CombatStyles.magical){
		//var base_spell=all_effects[argument0];
		for (var i=0; i<array_length_1d(magical); i++){
			var base_spell=all_effects[magical[i].index];

			if (base_spell.flag==MagicFlags.fire){
				image_speed=1;
				break;
			}
		}
	}


}
