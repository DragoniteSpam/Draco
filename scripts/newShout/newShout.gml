///	@description	Instantiates a Shout.
///	@param	name
///	@param	word1
///	@param	word2
///	@param	word3
///	@param	cooldown1
///	@param	cooldown2
///	@param	cooldown3
///	@param	description
///	@param	[daily?]
function newShout() {

	with (instantiate(ShoutData)){
		name=argument[0];
		word[0]=argument[1];
		word[1]=argument[2];
		word[2]=argument[3];
		cooldown[0]=argument[4];
		cooldown[1]=argument[5];
		cooldown[2]=argument[6];
		description=argument[7];
		if (argument_count==9){
			daily=argument[8];
		}
		return id;
	}


}
