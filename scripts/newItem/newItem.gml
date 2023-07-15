/// @description  Creates a new item class.
/// @param name
/// @param  description
/// @param  price
/// @param  weight
/// @param  class
/// @param  required_status
/// @param	basepower
/// @param	use_script
/// @param	sprite_index
///	@param	variable
/// @param  [equip]
/// @param  [hardware]
function newItem() {
	// creates one, rather than giving you one; use at the beginning of the game

	with (instantiate(ItemData)){
		name=argument[0];
		description=argument[1];
		price=argument[2];
		weight=argument[3];
		class=argument[4];
		required=argument[5];
		base_power=argument[6];
		use_script=argument[7];
		sprite_index=argument[8];
		variable=argument[9];
	
		if (argument_count==12){
		    equip=argument[10];
		    hardware=argument[11];
		}

		return id;
	}


}
