// define all the NPCs and other things that cause things
// to happen when you cross them
enum Actors {
    no,
	playable,
	title,
	new,
	load,
	// Containers
	Container,
	ContainerBeer,
	ContainerWaterWalking,
	ContainerCandlelight,
	ContainerSparks,
	ContainerSTWeapons,
	// Signs
    Sign,
	Tombstone,
	// Teleporters
    Teleport,
	// Stuff
	bedroll,
	// NPCs
	NPCTest,
	NPCTestShop,
	NPCTestMagic,
	NPCTestSkillTrainer,
	NPCGrantWaterWalking,
	NPCResistFire,
	// Battlers
	BattlerTest,
	last
}

var l=ds_list_create();
ds_list_add(l, args(scr_lock_unset, Actors.playable));
null_cutscene=l;

game_actors=array_create(Actors.last);

game_actors[Actors.no]=newActor("No Actor", "Nothing to see here.", null_cutscene, Actors.no, true, false);
game_actors[Actors.playable]=newActor("Player", "That's you!", null_cutscene, Races.nord, true, false);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_talk, "Left: New Game\nRight: Continue Game"));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.title]=newActor("Helpful Signpost", "Helps you start the game.", l, Races.nord, true, false);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_fade_to_black));
ds_list_add(l, args(scr_move_to, Actors.playable, 20, 20));
ds_list_add(l, args(scr_coc, MapTownA));
game_actors[Actors.new]=newActor("New Game", "Starts a new game.", l, Races.nord, true, false);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.load]=newActor("Continue Game", "Continues your saved game.", l, Races.nord, true, false);

// Containers

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_show_inventory, Actors.Container));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.Container]=newActor("Container", "A container with things in it.", l, Races.nord, true, false);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_show_inventory, Actors.ContainerBeer));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.ContainerBeer]=newActor("Container", "A container that's for holding large quantities of beer.", l, Races.nord, true, false);

AddItem(Actors.ContainerBeer, Items.fBeer, 30);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_show_inventory, Actors.ContainerWaterWalking));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.ContainerWaterWalking]=newActor("Container", "A container with things in it.", l, Races.nord, true, false);

AddItem(Actors.ContainerWaterWalking, Items.stWaterWalking, 1);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_show_inventory, Actors.ContainerCandlelight));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.ContainerCandlelight]=newActor("Container", "A container with things in it.", l, Races.nord, true, false);

AddItem(Actors.ContainerCandlelight, Items.stCandlelight, 1);
AddItem(Actors.ContainerCandlelight, Items.stMagelight, 1);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_show_inventory, Actors.ContainerSparks));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.ContainerSparks]=newActor("Container", "A container with things in it.", l, Races.nord, true, false);

AddItem(Actors.ContainerSparks, Items.stFlames, 1);
AddItem(Actors.ContainerSparks, Items.stFrostbite, 1);
AddItem(Actors.ContainerSparks, Items.stSparks, 1);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_show_inventory, Actors.ContainerSTWeapons));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.ContainerSTWeapons]=newActor("Container", "A container with things in it.", l, Races.nord, true, false);

AddItem(Actors.ContainerSTWeapons, Items.iron_sword, 1);
AddItem(Actors.ContainerSTWeapons, Items.dwarven_sword, 1);

// Signs

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_talk_var, Actors.Sign));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.Sign]=newActor("Signpost", "A sign to lead you towards the Flower Fields.", l, Races.nord, true, false);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_talk_var, Actors.Tombstone));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.Tombstone]=newActor("Tombstone", "Dead people are buried under these things.", l, Races.nord, true, false);

// Teleport

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_fade_to_black));
ds_list_add(l, args(scr_move_to_var, Actors.playable));
ds_list_add(l, args(scr_coc_var));
game_actors[Actors.Teleport]=newActor("Teleporter", "Teleports to various places.", l, Races.nord, true, false);

// Stuff

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_sleep));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.bedroll]=newActor("Bedroll", "You can sleep if you want to.", l, Races.nord, true, false);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_lock_set, Actors.NPCTest));
ds_list_add(l, args(scr_turn_to_face, Actors.NPCTest, Actors.playable));
ds_list_add(l, args(scr_push_raw, 0, EventFlags.testitem));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equals, true, scr_talk, "I already gave you the stuff. Check your inventory.", Actors.NPCTest, Actors.NPCTest));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equals, false, scr_talk, "These are words.", Actors.NPCTest, Actors.NPCTest));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equals, false, scr_talk, "Also, have an eraser.", Actors.NPCTest, Actors.NPCTest));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equals, false, scr_add_item, Player, Items.eraser, 1));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equals, false, scr_add_item, Player, Items.iron_sword, 1));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equals, false, scr_add_item, Player, Items.dwarven_sword, 1));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equals, false, scr_add_item, Player, Items.steel_sword, 1));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equals, false, scr_add_item, Player, Items.orcish_sword, 1));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equals, false, scr_talk, "Check your inventory.", Actors.NPCTest, Actors.NPCTest));
ds_list_add(l, args(scr_do_if, scr_GetBooleanFlag, Misc.equals, false, scr_set_flag, EventFlags.testitem, true));
ds_list_add(l, args(scr_lock_unset, Actors.NPCTest));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
game_actors[Actors.NPCTest]=newActor("NPC: Test", "A bloke to test giving you items and stuff.", l, Races.nord, true, false);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_lock_set, Actors.NPCTestShop));
ds_list_add(l, args(scr_turn_to_face, Actors.NPCTestShop, Actors.playable));
ds_list_add(l, args(scr_talk, "A little of this, a little of that."), Actors.NPCTestShop, Actors.NPCTestShop);
ds_list_add(l, args(scr_show_shop, Actors.NPCTestShop));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
ds_list_add(l, args(scr_lock_unset, Actors.NPCTestShop));
game_actors[Actors.NPCTestShop]=newActor("NPC: Test Shop", "A bloke to test buying and selling stuff.", l, Races.nord, true, false);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_lock_set, Actors.NPCTestMagic));
ds_list_add(l, args(scr_turn_to_face, Actors.NPCTestMagic, Actors.playable));
ds_list_add(l, args(scr_talk, "Have a Battle Cry Power.", Actors.NPCTestMagic, Actors.NPCTestMagic));
ds_list_add(l, args(scr_add_power, Actors.playable, Powers.BattleCry));
ds_list_add(l, args(scr_talk, "Also, have a Dragonrend Shout.", true, Actors.NPCTestMagic, Actors.NPCTestMagic));
ds_list_add(l, args(scr_add_shout, Actors.playable, Shouts.Dragonrend));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
ds_list_add(l, args(scr_lock_unset, Actors.NPCTestMagic));
game_actors[Actors.NPCTestMagic]=newActor("Rigmal Cloud-Fist", "A bloke to give you some test spells and stuff.", l, Races.nord, true, false);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_lock_set, Actors.NPCTestSkillTrainer));
ds_list_add(l, args(scr_turn_to_face, Actors.NPCTestSkillTrainer, Actors.playable));
ds_list_add(l, args(scr_show_multi_option, "Can you train me to be better in Light Armor?", 0, "Follow me for adventure!", 1, "Please stop following me", 2, "Never mind.", 3));
ds_list_add(l, args(scr_talk, "Hello.", Actors.NPCTestSkillTrainer, Actors.NPCTestSkillTrainer));
ds_list_add(l, args(scr_do_if, scr_GetMultiChoiceAnswer, Misc.equals, 0, scr_talk, "I'll see what I can do."));
ds_list_add(l, args(scr_do_if, scr_GetMultiChoiceAnswer, Misc.equals, 0, scr_show_skill_trainer, Skills.light));
ds_list_add(l, args(scr_do_if, scr_GetMultiChoiceAnswer, Misc.equals, 1, scr_talk, "Lead the way."));
ds_list_add(l, args(scr_do_if, scr_GetMultiChoiceAnswer, Misc.equals, 1, scr_follow_me, Actors.NPCTestSkillTrainer));
ds_list_add(l, args(scr_do_if, scr_GetMultiChoiceAnswer, Misc.equals, 2, scr_talk, "All right, all right."));
ds_list_add(l, args(scr_do_if, scr_GetMultiChoiceAnswer, Misc.equals, 2, scr_stop_following_me, Actors.NPCTestSkillTrainer));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
ds_list_add(l, args(scr_lock_unset, Actors.NPCTestSkillTrainer));
game_actors[Actors.NPCTestSkillTrainer]=newActor("Skill Trainer", "A bloke to give you some test spells and stuff.", l, Races.nord, true, false);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_lock_set, Actors.NPCGrantWaterWalking));
ds_list_add(l, args(scr_turn_to_face, Actors.NPCGrantWaterWalking, Actors.playable));
ds_list_add(l, args(scr_talk, "Hey you! Ever feel burning desire to skitter across surface of water without worry about falling in?", Actors.NPCGrantWaterWalking, Actors.NPCGrantWaterWalking));
ds_list_add(l, args(scr_show_multi_option, "You bet!", 0, "That sounds super sketchy . . .", 1));
ds_list_add(l, args(scr_talk, "Basil know how to walk across water. In fact, Basil can grant you the ability yourself for a whole minute. How about it?", Actors.NPCGrantWaterWalking, Actors.NPCGrantWaterWalking));
ds_list_add(l, args(scr_do_if, scr_GetMultiChoiceAnswer, Misc.equals, 0, scr_talk, "Good, good! Now hold still . . . just a moment . . . there!", Actors.NPCGrantWaterWalking, Actors.NPCGrantWaterWalking));
ds_list_add(l, args(scr_do_if, scr_GetMultiChoiceAnswer, Misc.equals, 0, scr_add_active_effect, AllEffects.Waterwalking, true, 60));
ds_list_add(l, args(scr_do_if, scr_GetMultiChoiceAnswer, Misc.equals, 0, scr_talk, "Enjoy walk on water! Maybe find something useful!", Actors.NPCGrantWaterWalking, Actors.NPCGrantWaterWalking));
ds_list_add(l, args(scr_do_if, scr_GetMultiChoiceAnswer, Misc.equals, 1, scr_talk, "Nobody trust Basil . . .", Actors.NPCGrantWaterWalking, Actors.NPCGrantWaterWalking));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
ds_list_add(l, args(scr_lock_unset, Actors.NPCGrantWaterWalking));
game_actors[Actors.NPCGrantWaterWalking]=newActor("Basil", "He can let you walk across water.", l, Races.argonian, true, false);

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_lock_set, Actors.NPCResistFire));
ds_list_add(l, args(scr_turn_to_face, Actors.NPCResistFire, Actors.playable));
ds_list_add(l, args(scr_show_multi_option, "Yes!", 0, "Spot on!", 1));
ds_list_add(l, args(scr_talk, "Fire sucks. Big time. Am I right or am I right?", Actors.NPCResistFire, Actors.NPCResistFire));
ds_list_add(l, args(scr_show_multi_option, "Yes!", 0, "Ohhhhhhhhhh, yes!", 1));
ds_list_add(l, args(scr_talk, "Well, you know what? Between you and me, I know a spell that can make people resist fire. You want some?", Actors.NPCResistFire, Actors.NPCResistFire));
ds_list_add(l, args(scr_talk, "Good, good! Now hold still . . . just a moment . . . there!", Actors.NPCResistFire, Actors.NPCResistFire));
ds_list_add(l, args(scr_add_active_effect, Actors.playable, AllEffects.ResistFire, 1.5, 60));
ds_list_add(l, args(scr_talk, "Enjoy your newly minted fire resistance!", Actors.NPCResistFire, Actors.NPCResistFire));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
ds_list_add(l, args(scr_lock_unset, Actors.NPCResistFire));
game_actors[Actors.NPCResistFire]=newActor("Styrbiorn the Fire Resister", "He can let you walk across water.", l, Races.nord, true, false);

// Battlers

var l=ds_list_create();
ds_list_add(l, args(scr_lock_set, Actors.playable));
ds_list_add(l, args(scr_lock_set, Actors.BattlerTest));
ds_list_add(l, args(scr_turn_to_face, Actors.BattlerTest, Actors.playable));
ds_list_add(l, args(scr_talk, "Feel like a practice battle? Let's do this!", Actors.BattlerTest, Actors.BattlerTest));
ds_list_add(l, args(scr_battle));
ds_list_add(l, args(scr_talk, "How did you find the battle?", Actors.BattlerTest, Actors.BattlerTest));
ds_list_add(l, args(scr_lock_unset, Actors.playable));
ds_list_add(l, args(scr_lock_unset, Actors.BattlerTest));
game_actors[Actors.BattlerTest]=newActor("Billy the Battle Test", "The default battler for the RPG side of things.", l, Races.nord, true, false);
