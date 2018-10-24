///	@description	What happens when you cast magic on a bush.
///	@param	baseSpell
///	@param	gridX
///	@param	gridY

var base_spell=World.all_magic[argument0];
var xx=argument1*GRID_CELL_WIDTH+GRID_CELL_WIDTH/2;
var yy=argument2*GRID_CELL_HEIGHT+GRID_CELL_HEIGHT/2;

if (base_spell.flag==MagicFlags.fire){
	var emitter=instance_create_depth(xx, yy, DEPTH_PARTICLES, ParticleEmitterFire);
	emitter.alarm[0]=-1;
}