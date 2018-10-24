/// @description  Creates a new magic spell class.
/// @param	name
/// @param  school
/// @param  level
/// @param  cost
///	@param	useInBattle
///	@param	useOnOverworld
///	@param	target
/// @param  description
///	@param	[flag]

with (instantiate(MagicData)){
	name=argument[0];
	school=argument[1];
	level=argument[2];
	cost=argument[3];
	use_script_battle=argument[4];
	use_script_overworld=argument[5];
	target=argument[6];
	description=argument[7];
	if (argument_count==9){
		flag=argument[8];
	}
	return id;
}