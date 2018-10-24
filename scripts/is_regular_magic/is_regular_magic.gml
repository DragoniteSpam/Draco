/// @description	Returns whether or not a magic class counts as "regular magic."
///	@param	MagicClass

switch (argument0){
	// MagicClasses.no is a placeholder for "all magic"
	case MagicClasses.effects:
	case MagicClasses.powers:
	case MagicClasses.shout:
		return false;
}

return true;