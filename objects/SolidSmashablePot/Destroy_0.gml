/// @description Insert description here
// You can write your code in this editor

var l=GetMyActor(Actors.playable).character_level;
var gold=irandom_range(-l, 2*l+1);

if (gold>0){
	AddGold(Actors.playable, gold);
	AddNotification("Found "+string(gold)+" gold through killing pottery.");
}