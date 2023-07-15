/// @description  Creates a new item class.
/// @param name
///	@param	reflexive
///	@param	bonusArray
/// @param  skillRequirementArray
///	@param	prerequisiteArray
/// @param  description
function newPerk() {

	with (instantiate(PerkData)){
		name=argument[0];
		reflexive=argument[1];

		bonus=argument[2];
		require=argument[3];
		prereq=argument[4];
	
		description=argument[5];

		return id;
	}


}
