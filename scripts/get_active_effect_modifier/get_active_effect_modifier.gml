///	@param	actor
///	@param	ActiveEffect
function get_active_effect_modifier(argument0, argument1) {

	var m=all_effects[argument1].def_false;

	var character=GetMyActor(argument0);

	for (var i=0; i<ds_list_size(character.effects); i++){
		var base_effect=character.effects[| i];
		if (all_effects[base_effect.index].compounding==Misc.additive){
			m+=base_effect.effect[argument1];
		} else {
			m*=base_effect.effect[argument1];
		}
	}

	return m;


}
