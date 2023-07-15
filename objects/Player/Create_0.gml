/// @description  extends Character
event_inherited();

// Extra variables for animations and stuff
follower=Actors.no;

// mainly just a wrapper to give player controls to a Character,
// no new functionality is added
sprite=chr_knight_sandy;
control_script=process_player_controls;
control_script_new_cell=process_player_controls_new_cell;
control_script_post=process_player_controls_post;
render=render_character_player;
death_script=death_player;
actor_index=Actors.playable;
World.game_actors[Actors.playable].alias=id;

side=Misc.side_player;

var player=GetMyActor();
player.name="Player";
player.race=get_random_race();
set_default_skills(player);

AddGold(Actors.playable, 2000);

TeachSpell(Actors.playable, AllEffects.ChaosDamage, false);
TeachSpell(Actors.playable, AllEffects.Conjour, false);
TeachSpell(Actors.playable, AllEffects.Banish, false);
TeachSpell(Actors.playable, AllEffects.SoulTrap, false);
TeachSpell(Actors.playable, AllEffects.FrostDamage, false);
TeachSpell(Actors.playable, AllEffects.Oakflesh, false);
TeachSpell(Actors.playable, AllEffects.Command, false);
TeachSpell(Actors.playable, AllEffects.AbsorbHealth, false);

AddSoul(Actors.playable);
AddSoul(Actors.playable);