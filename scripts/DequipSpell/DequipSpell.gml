/// @description	Dequips the specified spell, if it's equipped. There's probably a better way to do this.
///	@param	ActorIndex
///	@param	Spell

var actor=GetMyActor(argument0);
if (actor.equip_spell==argument1){
	actor.equip_spell=noone;
}