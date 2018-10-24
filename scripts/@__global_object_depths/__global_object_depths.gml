// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // Player
global.__objectDepths[1] = 0; // Arguments
global.__objectDepths[2] = 0; // Solid
global.__objectDepths[3] = 0; // Character
global.__objectDepths[4] = 0; // Controller
global.__objectDepths[5] = 0; // World
global.__objectDepths[6] = 0; // ItemStack
global.__objectDepths[7] = 0; // ItemData


global.__objectNames[0] = "Player";
global.__objectNames[1] = "Arguments";
global.__objectNames[2] = "Solid";
global.__objectNames[3] = "Character";
global.__objectNames[4] = "Controller";
global.__objectNames[5] = "World";
global.__objectNames[6] = "ItemStack";
global.__objectNames[7] = "ItemData";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for