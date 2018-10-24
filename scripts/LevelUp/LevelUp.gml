///	@description	Levels up a character.
///	@param	ActorIndex

// If you were to somehow get multiple levels at once, you would only get
// one perk point. 

// In actual Skyrim you wouldn't get this until you actually hit "level up"
// but i don't feel like doing that.

var actor=GetMyActor(argument0);

if (argument0==Actors.playable){
	// @todo animate some level up graphic here
} else {
	actor.character_perk_points++;
	actor.character_level++;
	// @todo Use AI to select an attribute to increase, and select a perk
}