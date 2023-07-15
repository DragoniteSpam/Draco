///	@description	What happens when you attack an ignitable thing.
///	@param	attacking_actor
///	@param	combat_style
///	@param	magical
///	@param	skill
function react_ignite_dish(argument0, argument1, argument2, argument3) {

	var attacker=GetMyActor(argument0);
	var me=GetMyActor();

	var magical=argument2;
	var skill=argument3;

	if (argument1==CombatStyles.magical){
		//var base_spell=all_effects[argument0];
		for (var i=0; i<array_length_1d(magical); i++){
			var base_spell=all_effects[magical[i].index];
			if (base_spell.flag==MagicFlags.fire){
				var emitter=instance_create_depth(xx*GRID_CELL_WIDTH+GRID_CELL_WIDTH/2, yy*GRID_CELL_HEIGHT+GRID_CELL_HEIGHT/2, DEPTH_PARTICLES, ParticleEmitterFire);
				emitter.alarm[0]=-1;
				break;
			}
		}
	}


}
