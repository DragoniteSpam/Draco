///	@description	Uses the AI to select a move for the chosen battler.
///	@param	battler

var array=[];
if (argument0.side==Misc.side_opponent){
	var side=Misc.side_player;
} else {
	var side=Misc.side_opponent;
}

for (var i=0; i<array_length_1d(battlers); i++){
	if (battlers[i]==Actors.no){
		break;
	}
	if (battlers[i].side==side){
		array[array_length_1d(array)]=battlers[i];
	}
}

// @todo if attack can KO a battler, choose that one
var result=irandom(array_length_1d(array)-1);

return array[result];