/// @description  boolean getController();
/// @function  boolean getController
function getController() {
	return gamepad_is_connected(GAMEPAD_INDEX)&&World.use_controller;



}
