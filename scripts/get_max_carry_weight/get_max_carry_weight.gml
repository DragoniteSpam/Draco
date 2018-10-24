///	@description	Gets the max carry weight for the specified solid.
///	@param	Solid

var actor=GetMyActor(argument0);
var base_weight=300+(actor.st_mod_sp div 2);
// @todo Calculate bonuses for Active Effects and Perks and stuff here

return base_weight;