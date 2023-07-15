///	@description	Adds a notification to the top of the screen.
///	@param	text
function AddNotification(argument0) {

	with (instantiate(Notification)){
		text=argument0;
		return id;
	}


}
