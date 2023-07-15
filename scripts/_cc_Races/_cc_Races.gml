function _cc_Races() {
	enum Races {
		inanimate,
		altmer,
		argonian,
		bosmer,
		breton,
		dunmer,
		imperial,
		khajiit,
		nord,
		orsimer,
		redguard,
		skeever,
		daedra_fire,
		daedra_storm,
		daedra_ice,
	}

	globalvar all_races;

	all_races=array_create(Races.redguard);

	all_races[Races.inanimate]=newRace("Inanimate", Powers.no, AllEffects.no, 100, 100, 100, 100, chr_knight_sandy, [BattleOptions.defend], 0, ai_inanimate, "Inanimate object. Doesn't do anything.");

	all_races[Races.altmer]=newRace("High Elf", Powers.Highborn, AllEffects.FortifyMagicka, 50, 100, 100, 100, chr_knight_sandy, [BattleOptions.punch], 5, ai_human_default, "Also known as \"Altmer\" in their homeland of Summerset Isle, the high elves are the most strongly gifted in the arcane arts of all the races. They can call upon their Highborn power to regenerate Magicka quickly.",
		[Items.long_bow, Items.iron_arrows, Items.steel_dagger], [Items.leather_armor, Items.leather_boots, Items.leather_bracers], [Items.gold, 10, Items.lockpick, 5], [AllEffects.FireDamage]);
	all_races[Races.argonian]=newRace("Argonian", Powers.Histskin, AllEffects.ArgonianBonus, 50, 100, 100, 100, chr_knight_sandy, [BattleOptions.punch], 5, ai_human_default, "This reptilian race, well-suited for the treacherous swamps of their Black Marsh homeland, has developed a natural resistance to diseases and the ability to breathe underwater. They can call upon the Histskin to regenerate health very quickly.",
		[Items.long_bow, Items.iron_arrows, Items.steel_dagger], [Items.leather_armor, Items.leather_boots, Items.leather_bracers], [Items.gold, 10, Items.lockpick, 5], [AllEffects.FireDamage]);
	all_races[Races.bosmer]=newRace("Bosmer", Powers.CommandAnimal, AllEffects.BosmerBonus, 50, 100, 100, 100, chr_knight_sandy, [BattleOptions.punch], 5, ai_human_default, "In addition to their quick and perceptive grasp of spellcraft, even the humblest of High Rock's Bretons can boast a resistance to magic. Bretons can call upon the Dragonskin power to absorb spells.",
		[Items.long_bow, Items.iron_arrows, Items.steel_dagger], [Items.leather_armor, Items.leather_boots, Items.leather_bracers], [Items.gold, 10, Items.lockpick, 5], [AllEffects.FireDamage]);
	all_races[Races.breton]=newRace("Breton", Powers.Dragonskin, AllEffects.ResistMagic, 25, 100, 100, 100, chr_knight_sandy, [BattleOptions.punch], 5, ai_human_default, "Also known as \"Dunmer\" in their homeland of Morrowind, dark elves are noted for their stealth and magic skills. They are naturally resistant to fire and can call upon their Ancestor's Wrath to surround themselves in fire.",
		[Items.long_bow, Items.iron_arrows, Items.steel_dagger], [Items.leather_armor, Items.leather_boots, Items.leather_bracers], [Items.gold, 10, Items.lockpick, 5], [AllEffects.FireDamage]);
	all_races[Races.dunmer]=newRace("Dark Elf", Powers.AncestorsWrath, AllEffects.ResistFire, 50, 100, 100, 100, chr_knight_sandy, [BattleOptions.punch], 5, ai_human_default, "Natives of Cyrodiil, they have proved to be shrewd diplomats and traders. They are skilled with combat and magic. Anywhere gold coins might be found, Imperials always seem to find a few more. They can call upon the Voice of the Emperor to calm an enemy.",
		[Items.long_bow, Items.iron_arrows, Items.steel_dagger], [Items.leather_armor, Items.leather_boots, Items.leather_bracers], [Items.gold, 10, Items.lockpick, 5], [AllEffects.FireDamage]);
	all_races[Races.imperial]=newRace("Imperial", Powers.VoiceOfTheEmperor, AllEffects.FortifyGoldFind, 50, 100, 100, 100, chr_knight_sandy, [BattleOptions.punch], 5, ai_human_default, "Natives of Cyrodiil, they have proved to be shrewd diplomats and traders. They are skilled with combat and magic. Anywhere gold coins might be found, Imperials always seem to find a few more. They can call upon the Voice of the Emperor to calm an enemy.",
		[Items.long_bow, Items.iron_arrows, Items.steel_dagger], [Items.leather_armor, Items.leather_boots, Items.leather_bracers], [Items.gold, 10, Items.lockpick, 5], [AllEffects.FireDamage]);
	all_races[Races.khajiit]=newRace("Khajiit", Powers.NightEye, AllEffects.FortifyUnarmed, 300, 100, 100, 100, chr_knight_sandy, [BattleOptions.punch], 5, ai_human_default, "Hailing from the province of Elsweyr, they are intelligent, quick, and agile. They make excellent thieves due to their natural stealthiness. All Khajiit can see in the dark at will and have unarmed claw attacks.",
		[Items.long_bow, Items.iron_arrows, Items.steel_dagger], [Items.leather_armor, Items.leather_boots, Items.leather_bracers], [Items.gold, 10, Items.lockpick, 5], [AllEffects.FireDamage]);
	all_races[Races.nord]=newRace("Nord", Powers.BattleCry, AllEffects.ResistFrost, 50, 100, 100, 100, chr_knight_sandy, [BattleOptions.punch], 5, ai_human_default, "Citizens of Skyrim, they are a tall and fair-haired people. Strong and hardy, Nords are famous for their resistance to cold and their talent as warriors. They can use a Battlecry to make opponents flee.",
		[Items.long_bow, Items.iron_arrows, Items.steel_dagger], [Items.leather_armor, Items.leather_boots, Items.leather_bracers], [Items.gold, 10, Items.lockpick, 5], [AllEffects.FireDamage]);
	all_races[Races.orsimer]=newRace("Orsimer", Powers.BerserkerRage, AllEffects.no, 0, 100, 100, 100, chr_knight_sandy, [BattleOptions.punch], 5, ai_human_default, "The people of the Wrothgarian and Dragontail Mountains, Orcish smiths are prized for their craftsmanship. Orc troops in Heavy Armor are among the finest in the Empire, and are fearsome when using their Berserker Rage.",
		[Items.long_bow, Items.iron_arrows, Items.steel_dagger], [Items.leather_armor, Items.leather_boots, Items.leather_bracers], [Items.gold, 10, Items.lockpick, 5], [AllEffects.FireDamage]);
	all_races[Races.redguard]=newRace("Redguard", Powers.AdrenalineRush, AllEffects.ResistPoison, 50, 100, 100, 100, chr_knight_sandy, [BattleOptions.punch], 5, ai_human_default, "The most naturally talented warriors in Tamriel, the Redguards of Hammerfell have a hardy constitution and a natural resistance to poison. They can call upon an Adrenaline Rush in combat.",
		[Items.long_bow, Items.iron_arrows, Items.steel_dagger], [Items.leather_armor, Items.leather_boots, Items.leather_bracers], [Items.gold, 10, Items.lockpick, 5], [AllEffects.FireDamage]);

	newRaceSetStats(Races.altmer, Skills.illusion, 10, Skills.alter, 5, Skills.conjour, 5, Skills.destruct, 5, Skills.enchant, 5, Skills.restore, 5);
	newRaceSetStats(Races.argonian, Skills.lock, 10, Skills.light, 5, Skills.pick, 5, Skills.restore, 5, Skills.sneak, 5);
	newRaceSetStats(Races.bosmer, Skills.archery, 10, Skills.alchemy, 5, Skills.light, 5, Skills.lock, 5, Skills.pick, 5, Skills.sneak, 5);
	newRaceSetStats(Races.breton, Skills.conjour, 10, Skills.alter, 5, Skills.illusion, 5, Skills.restore, 5, Skills.speech, 5);

	newRaceSetStats(Races.dunmer, Skills.destruct, 10, Skills.alchemy, 5, Skills.alter, 5, Skills.illusion, 5, Skills.light, 5, Skills.sneak, 5);
	newRaceSetStats(Races.imperial, Skills.restore, 10, Skills.block, 5, Skills.destruct, 5, Skills.enchant, 5, Skills.heavy, 5, Skills.one_hand, 5);
	newRaceSetStats(Races.khajiit, Skills.sneak, 10, Skills.alchemy, 5, Skills.archery, 5, Skills.lock, 5, Skills.one_hand, 5, Skills.pick, 5);

	newRaceSetStats(Races.nord, Skills.two_hand, 10, Skills.block, 5, Skills.light, 5, Skills.one_hand, 5, Skills.smith, 5, Skills.speech, 5);
	newRaceSetStats(Races.orsimer, Skills.heavy, 10, Skills.block, 5, Skills.enchant, 5, Skills.one_hand, 5, Skills.smith, 5, Skills.two_hand, 5);
	newRaceSetStats(Races.redguard, Skills.one_hand, 10, Skills.alter, 5, Skills.archery, 5, Skills.block, 5, Skills.destruct, 5, Skills.smith, 5);

	all_races[Races.skeever]=newRace("Skeever", Powers.no, AllEffects.no, 0, 15, 0, 15, chr_pirate_blue_green, [BattleOptions.bite, BattleOptions.swipe], 5, ai_beast_default, "Skeever. Gross.", [], [], [Items.gold, 1], []);
	newRaceSetStats(Races.skeever, Skills.sneak, 5, Skills.one_hand, 10);
	all_races[Races.skeever].animal=true;

	all_races[Races.daedra_fire]=newRace("Daedra: Fire", Powers.no, AllEffects.no, 0, 15, 0, 15, chr_daedra_fire, [BattleOptions.punch], 5, ai_human_default, "It's from one of the planes of Oblivion. Which one specifically, I'm not entirely sure.",
		[], [], [Items.aDaedraHeart, 1], [AllEffects.FireDamage]);
	all_races[Races.daedra_fire].can_be_banished=true;

	all_races[Races.daedra_storm]=newRace("Daedra: Storm", Powers.no, AllEffects.no, 0, 15, 0, 15, chr_daedra_storm, [BattleOptions.punch], 5, ai_human_default, "It's from one of the planes of Oblivion. Which one specifically, I'm not entirely sure.",
		[], [], [Items.aDaedraHeart, 1], [AllEffects.ShockDamage]);
	all_races[Races.daedra_storm].can_be_banished=true;

	all_races[Races.daedra_ice]=newRace("Daedra: Ice", Powers.no, AllEffects.no, 0, 15, 0, 15, chr_daedra_ice, [BattleOptions.punch], 5, ai_human_default, "It's from one of the planes of Oblivion. Which one specifically, I'm not entirely sure.",
		[], [], [Items.aDaedraHeart, 1], [AllEffects.FrostDamage]);
	all_races[Races.daedra_ice].can_be_banished=true;

	newRaceSetStats(Races.daedra_fire, Skills.illusion, 10, Skills.alter, 10, Skills.destruct, 10, Skills.conjour, 10, Skills.restore, 5);
	newRaceSetStats(Races.daedra_storm, Skills.illusion, 10, Skills.alter, 10, Skills.destruct, 10, Skills.conjour, 10, Skills.restore, 5);
	newRaceSetStats(Races.daedra_ice, Skills.illusion, 10, Skills.alter, 10, Skills.destruct, 10, Skills.conjour, 10, Skills.restore, 5);


}
