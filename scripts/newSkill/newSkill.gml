/// @description  Creates a new item class.
/// @param name
/// @param  description
/// @param  use_multiplier
/// @param  use_offset
/// @param  improve_multiplier
/// @param  improve_offset
///	@param	sprite
function newSkill() {

	with (instantiate(SkillData)){
		name=argument[0];
		description=argument[1];
		skill_use_multiplier=argument[2];
		skill_use_offset=argument[3];
		skill_improve_multiplier=argument[4];
		skill_improve_offset=argument[5];
		sprite=argument[6];
		return id;
	}


}
