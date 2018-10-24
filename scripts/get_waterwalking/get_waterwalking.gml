///	@description	Gets whether or not the specified solid can water walk.
///	@param	Solid

// @todo Attributes such as equipment and "being Argonian."
var actor=GetMyActor(argument0);

for (var i=0; i<ds_list_size(actor.effects); i++){
	if (actor.effects[| i].index==AllEffects.Waterwalking){
		return true;
	}
}

return get_active_effect_modifier(argument0, AllEffects.Waterwalking);

return false;