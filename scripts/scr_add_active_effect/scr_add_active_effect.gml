/// @description  void scr_add_active_effect();
/// @param	ArgSet
// Adds an active effect.
// scr_add_active_effect EffectIndex magnitude duration

var arg_set=argument0;

AddActiveEffect(arg_set[1], arg_set[2], arg_set[3], arg_set[4], true);

scr_continue();