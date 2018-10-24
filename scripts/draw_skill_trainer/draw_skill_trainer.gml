var border_width=2;
var x1=W/2-200;
var y1=H/2-128;
var x2=W/2+200;
var y2=H/2+128;
var player=GetMyActor(Actors.playable);
var gold=GetGold(Actors.playable);
var cost=get_skill_training_cost(Actors.playable, show_skill_trainer);
draw_set_font(FontPauseRegular);
drawPauseMenuInventoryBox(x1, y1, x2, y2, border_width);
draw_stat(show_skill_trainer, W/2, y1+64, true);
draw_set_halign(fa_left);
draw_text(x1+32, y1+128, "Times Trained This Level:");
draw_text(x1+32, y1+192, "Cost: "+string(cost));
draw_set_halign(fa_right);
draw_text(x2-32, y1+128, string(player.skills_trained_this_level[show_skill_trainer])+"/5");
draw_text(x2-32, y1+192, "Gold: "+string(gold));
draw_line_width(x1+32, y1+160, x2-32, y1+160, border_width);
if (Controller.release_a){
	if (player.skills_trained_this_level[show_skill_trainer]>=5){
		AddNotification("You must level up to train more.");
	} else if (gold>=cost){
		RemoveGold(Actors.playable, cost);
		AdvanceSkill(Actors.playable, show_skill_trainer);
		player.skills_trained_this_level[show_skill_trainer]++;
	} else {
		AddNotification("You don't have enough gold for that");
	}
} else if (Controller.release_b){
	show_skill_trainer=-1;
	scr_continue();
}