/// @description	Cutscene scripting for comparisons.
/// @param	value1
/// @param	comparison
/// @param	value2

switch (argument1){
    case Misc.equals:
        return (argument0==argument2);
        break;
    case Misc.less:
        return (argument0<argument2);
        break;
    case Misc.less_equal:
        return (argument0<=argument2);
        break;
    case Misc.greater:
        return (argument0>argument2);
        break;
    case Misc.greater_equal:
        return (argument0>=argument2);
        break;
}

return false;