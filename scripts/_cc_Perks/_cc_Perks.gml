function _cc_Perks() {
	enum Perks {
		// Alteration
		NoviceAlteration,
		AlterationDualCasting,
		ApprenticeAlteration,
		MagicResistance,
		AdeptAlteration,
		ExpertAlteration,
		Atronach,
		MasterAlteration,
		Stability,
		MageArmor,
		// Archery
		Overdraw,
		CriticalShot,
		HuntersDiscipline,
		Ranger,
		EagleEye,
		PowerShot,
		QuickShot,
		SteadyHand,
		Bullseye,
		// Alchemy
		Alchemist,
		Physician,
		Benefactor,
		Experimenter,
		Poisoner,
		ConcentratedPoison,
		GreenThumb,
		Snakeblood,
		Purity,
		// Block
		ShieldWall,
		DeflectArrows,
		ElementalProtection,
		BlockRunner,
		PowerBash,
		DeadlyBash,
		DisarmingBash,
		ShieldCharge,
		QuickReflexes,
		// Conjouration
		NoviceConjouration,
		ApprenticeConjouration,
		AdeptConjouration,
		ExpertConjouration,
		MasterConjouration,
		ConjourationDualCasting,
		MysticBinding,
		SoulStealer,
		OblivionBinding,
		Necromancy,
		DarkSouls,
		Summoner,
		Atromancy,
		ElementalPotency,
		TwinSouls,
		// Destruction
		NoviceDestruction,
		ApprenticeDestruction,
		AdeptDestruction,
		ExpertDestruction,
		MasterDestruction,
		RuneMaster,
		AugmentedFlames,
		IntenseFlames,
		AugmentedFrost,
		DeepFreeze,
		AugmentedShock,
		Disintegrate,
		DestructionDualCasting,
		Impact,
		// Light Armor
		AgileDefender,
		CustomFit,
		MatchingSetLA,
		Unhindered,
		WindWalker,
		DeftMovement,
		// Heavy Armor
		Juggernaut,
		FistsOfSteel,
		Cushioned,
		Conditioning,
		WellFitted,
		TowerOfStrength,
		MatchingSetHA,
		ReflectBlows,
		// Lockpicking
		NoviceLocks,
		ApprenticeLocks,
		QuickHands,
		WaxKey,
		AdeptLocks,
		ExpertLocks,
		GoldenTouch,
		TreasureHunter,
		Locksmith,
		Unbreakable,
		MasterLocks,
		// Enchanting
		Enchanter,
		FireEnchanter,
		FrostEnchanter,
		StormEnchanter,
		InsightfulEnchanter,
		CorpusEnchanter,
		ExtraEffect,
		SoulSqueezer,
		SoulSiphon,
		// One Handed
		Armsman,
		Bladesman,
		BoneBreaker,
		DualFlurry,
		DualSavagery,
		FightingStance,
		CriticalCharge,
		SavageStrike,
		ParalyzingStrike,
		HackAndSlash,
		// Pickpocket
		LightFingers,
		NightThief,
		Cutpurse,
		Keymaster,
		Misdirection,
		PerfectTouch,
		ExtraPockets,
		Poisoned,
		// Illusion
		NoviceIllusion,
		Animage,
		KindredMage,
		QuietCasting,
		ApprenticeIllusion,
		AdeptIllusion,
		ExpertIllusion,
		MasterIllusion,
		HypnoticGaze,
		AspectOfTerror,
		Rage,
		MasterOfTheMind,
		IllusionDualCasting,
		// Smithing
		SteelSmithing,
		ArcaneBlacksmith,
		DwarvenSmithing,
		OrcishSmithing,
		EbonySmithing,
		DaedricSmithing,
		ElvenSmithing,
		AdvanceArmors,
		GlassSmithing,
		DragonArmor,
		// Sneak
		Stealth,
		Backstab,
		DeadlyAim,
		AssassinsBlade,
		MuffledMovement,
		LightFoot,
		SilentRoll,
		Silence,
		ShadowWarrior,
		// Restoration
		NoviceRestoration,
		ApprenticeRestoration,
		AdeptRestoration,
		ExpertRestoration,
		MasterRestoration,
		Recovery,
		AvoidDeath,
		Regeneration,
		Necromage,
		Respite,
		RestorationDualCasting,
		WardAbsorb,
		// Two Handed
		Barbarian,
		ChampionsStance,
		DevastatingBlow,
		GreatCriticalCharge,
		Sweep,
		Warmaster,
		DeepWounds,
		Limbsplitter,
		Skullcrusher,
		// Speech
		Haggling,
		Allure,
		Merchant,
		Investor,
		Fence,
		MasterTrader,
		Bribery,
		Persuasion,
		Intimidation,
	}

	globalvar all_perks;

	/* Important note on bonusArray parameter -
	 *	 - "Level 0" is the default value; for example, a perk that decreases the amount of magicka a spell requires would have the
	 *		0th array index be "100," since the modifier is 100% when inactive, while a perk that increases your Light Armor rating would have the
	 *		0th array index be "0," since the multiplier is 0% when inactive.
	 */

	all_perks=array_create(Perks.Intimidation);

	// Alteration
	var sk=all_skills[Skills.alter];
	all_perks[Perks.NoviceAlteration]=newPerk("Novice Alteration", Perks.NoviceAlteration, [100, 50], [0], [], "Cast Novice level Alteration spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.NoviceAlteration]);

	all_perks[Perks.AlterationDualCasting]=newPerk("Alteration Dual Casting", Perks.AlterationDualCasting, [0, 50], [20], [Perks.NoviceAlteration], "Dual casting an Alteration spell overcharges the effects into an even more powerful version.");
	ds_list_add(sk.perks, all_perks[Perks.AlterationDualCasting]);

	all_perks[Perks.ApprenticeAlteration]=newPerk("Apprentice Alteration", Perks.ApprenticeAlteration, [100, 50], [25], [Perks.NoviceAlteration], "Cast Apprentice level Alteration spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.ApprenticeAlteration]);

	all_perks[Perks.MagicResistance]=newPerk("Magic Resistance", Perks.MagicResistance, [0, 10, 20, 30], [30, 50, 70], [Perks.ApprenticeAlteration], "Block &% of a spell's effects.");
	ds_list_add(sk.perks, all_perks[Perks.MagicResistance]);

	all_perks[Perks.AdeptAlteration]=newPerk("Adept Alteration", Perks.AdeptAlteration, [100, 50], [50], [Perks.ApprenticeAlteration], "Cast Adept level Alteration spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.AdeptAlteration]);

	all_perks[Perks.ExpertAlteration]=newPerk("Expert Alteration", Perks.ExpertAlteration, [100, 50], [75], [Perks.AdeptAlteration], "Cast Expert level Alteration spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.ExpertAlteration]);

	all_perks[Perks.Atronach]=newPerk("Atronach", Perks.Atronach, [0, 30], [100], [Perks.ExpertAlteration], "Absorb &% of the magicka of any spells that hit you.");
	ds_list_add(sk.perks, all_perks[Perks.Atronach]);

	all_perks[Perks.MasterAlteration]=newPerk("Master Alteration", Perks.MasterAlteration, [100, 50], [100], [Perks.ExpertAlteration], "Cast Master level Alteration spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.MasterAlteration]);

	all_perks[Perks.Stability]=newPerk("Stability", Perks.Stability, [0, 50], [70], [Perks.AdeptAlteration], "Alteration spells have &% greater duration.");
	ds_list_add(sk.perks, all_perks[Perks.Stability]);

	all_perks[Perks.MageArmor]=newPerk("Mage Armor", Perks.MageArmor, [0, 100, 150, 200], [30, 50, 70], [Perks.ApprenticeAlteration], "Protection spells like Stoneflesh are &% stronger if not wearing armor.");
	ds_list_add(sk.perks, all_perks[Perks.MageArmor]);

	// Archery
	sk=all_skills[Skills.archery];
	all_perks[Perks.Overdraw]=newPerk("Overdraw", Perks.Overdraw, [0, 20, 40, 60, 80, 100], [0, 20, 40, 60, 80], [], "Bows do &% more damage.");
	ds_list_add(sk.perks, all_perks[Perks.Overdraw]);

	all_perks[Perks.CriticalShot]=newPerk("Critical Shot", Perks.CriticalShot, [0, 10, 15, 20], [30, 60, 90], [Perks.Overdraw], "&% chance of a critical hit that does extra damage.");
	ds_list_add(sk.perks, all_perks[Perks.CriticalShot]);

	all_perks[Perks.HuntersDiscipline]=newPerk("Hunter's Discipline", Perks.HuntersDiscipline, [0, 100], [50], [Perks.CriticalShot], "Recover &% more arrows as loot.");
	ds_list_add(sk.perks, all_perks[Perks.HuntersDiscipline]);

	all_perks[Perks.Ranger]=newPerk("Ranger", Perks.Ranger, [0, 50], [60], [Perks.HuntersDiscipline], "Able to move &% faster with a drawn bow.");
	ds_list_add(sk.perks, all_perks[Perks.Ranger]);

	all_perks[Perks.EagleEye]=newPerk("Eagle Eye", Perks.EagleEye, [0, 50], [30], [Perks.Overdraw], "Pressing Block while aiming will zoom in your view.");	// @todo Probably change this to something like "arrows will never miss."
	ds_list_add(sk.perks, all_perks[Perks.EagleEye]);

	all_perks[Perks.PowerShot]=newPerk("Power Shot", Perks.PowerShot, [0, 50], [50], [Perks.EagleEye], "Arrows stagger all but the largest opponents &% of the time.");
	ds_list_add(sk.perks, all_perks[Perks.PowerShot]);

	all_perks[Perks.QuickShot]=newPerk("Quick Shot", Perks.QuickShot, [0, 30], [70], [Perks.PowerShot], "Can draw bows &% faster.");
	ds_list_add(sk.perks, all_perks[Perks.QuickShot]);

	all_perks[Perks.SteadyHand]=newPerk("Steady Hand", Perks.SteadyHand, [0, 25, 50], [40, 60], [Perks.EagleEye], "Zooming in with a bow slows time by &%.");
	ds_list_add(sk.perks, all_perks[Perks.SteadyHand]);

	all_perks[Perks.Bullseye]=newPerk("Bullseye", Perks.Bullseye, [0, 15], [100], [Perks.Ranger, Perks.QuickShot], "&% chance of paralyzing the target for a few seconds.");
	ds_list_add(sk.perks, all_perks[Perks.Bullseye]);

	// Alchemy
	sk=all_skills[Skills.alchemy];
	all_perks[Perks.Alchemist]=newPerk("Alchemist", Perks.Alchemist, [0, 20, 40, 60, 80, 100], [0, 20, 40, 60, 80], [], "Potions and poisons you mix are &% stronger.");
	ds_list_add(sk.perks, all_perks[Perks.Alchemist]);

	all_perks[Perks.Physician]=newPerk("Physician", Perks.Physician, [0, 25], [20], [Perks.Alchemist], "Potions you mix that restore Health, Magicka or Stamina are &% stronger.");
	ds_list_add(sk.perks, all_perks[Perks.Physician]);

	all_perks[Perks.Benefactor]=newPerk("Benefactor", Perks.Benefactor, [0, 25], [30], [Perks.Physician], "Potions you mix with beneficial effects have an additional &% greater magnitude.");
	ds_list_add(sk.perks, all_perks[Perks.Benefactor]);

	all_perks[Perks.Experimenter]=newPerk("Experimenter", Perks.Experimenter, [1, 2, 3, 4], [50, 70, 90], [Perks.Benefactor], "Eating an ingredient reveals & effects.");
	ds_list_add(sk.perks, all_perks[Perks.Experimenter]);

	all_perks[Perks.Poisoner]=newPerk("Poisoner", Perks.Poisoner, [0, 25], [30], [Perks.Physician], "Poisons you mix are &% more effective.");
	ds_list_add(sk.perks, all_perks[Perks.Poisoner]);

	all_perks[Perks.ConcentratedPoison]=newPerk("Concentrated Poison", Perks.ConcentratedPoison, [1, 2], [60], [Perks.Poisoner], "Poisons applied to weapons last for & hits.");
	ds_list_add(sk.perks, all_perks[Perks.ConcentratedPoison]);

	all_perks[Perks.GreenThumb]=newPerk("Green Thumb",  Perks.GreenThumb, [1, 2], [70], [Perks.ConcentratedPoison], "& ingredients are gathered from plants.");
	ds_list_add(sk.perks, all_perks[Perks.GreenThumb]);

	all_perks[Perks.Snakeblood]=newPerk("Snakeblood", Perks.Snakeblood, [0, 50], [80], [Perks.Experimenter, Perks.ConcentratedPoison], "&% resistance to all poisons.");
	ds_list_add(sk.perks, all_perks[Perks.Snakeblood]);

	all_perks[Perks.Purity]=newPerk("Purity", Perks.Purity, [false, true], [100], [Perks.Snakeblood], "All negative effects are removed from created potions, and all positive effects are removed from created poisons.");
	ds_list_add(sk.perks, all_perks[Perks.Purity]);

	// Block
	sk=all_skills[Skills.block];
	all_perks[Perks.ShieldWall]=newPerk("Shield Wall", Perks.ShieldWall, [0, 10, 20, 30, 40, 50], [0, 20, 40, 60, 80], [], "Blocking is &% more effective.");
	ds_list_add(sk.perks, all_perks[Perks.ShieldWall]);

	all_perks[Perks.DeflectArrows]=newPerk("Deflect Arrows", Perks.DeflectArrows, [100, 0], [30], [Perks.ShieldWall], "Arrows that hit your shield do no damage.");
	ds_list_add(sk.perks, all_perks[Perks.DeflectArrows]);

	all_perks[Perks.ElementalProtection]=newPerk("Elemental Protection", Perks.ElementalProtection, [0, 50], [50], [Perks.DeflectArrows], "Blocking with a shield reduces incoming Fire, Frost and Shock damage by &%.");
	ds_list_add(sk.perks, all_perks[Perks.ElementalProtection]);

	all_perks[Perks.BlockRunner]=newPerk("Block Runner", Perks.BlockRunner, [0, 50], [70], [Perks.ElementalProtection], "Able to move faster with a shield or weapon raised.");
	ds_list_add(sk.perks, all_perks[Perks.BlockRunner]);

	all_perks[Perks.PowerBash]=newPerk("Power Bash", Perks.PowerBash, [false, true], [30], [Perks.ShieldWall], "Able to do a power bash.");
	ds_list_add(sk.perks, all_perks[Perks.PowerBash]);

	all_perks[Perks.DeadlyBash]=newPerk("Deadly Bash", Perks.DeadlyBash, [1, 5], [50], [Perks.PowerBash], "Bashing does & times more damage.");
	ds_list_add(sk.perks, all_perks[Perks.DeadlyBash]);

	all_perks[Perks.DisarmingBash]=newPerk("Disarming Bash", Perks.DisarmingBash, [0, 10], [70], [Perks.DeadlyBash], "Chance to disarm when power bashing.");
	ds_list_add(sk.perks, all_perks[Perks.DisarmingBash]);

	all_perks[Perks.ShieldCharge]=newPerk("Shield Charge", Perks.ShieldCharge, [false, true], [100], [Perks.DisarmingBash, Perks.BlockRunner], "Sprinting wish a shield raised knocks down most target.");
	ds_list_add(sk.perks, all_perks[Perks.ShieldCharge]);

	all_perks[Perks.QuickReflexes]=newPerk("Quick Reflexes", Perks.QuickReflexes, [0, 50], [30], [Perks.ShieldWall], "Time slows down if you are blocking during an enemy's power attack.");
	ds_list_add(sk.perks, all_perks[Perks.QuickReflexes]);

	// Conjouration
	sk=all_skills[Skills.conjour];
	all_perks[Perks.NoviceConjouration]=newPerk("Novice Conjouration", Perks.NoviceConjouration, [100, 50], [0], [], "Cast Novice level Conjouration spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.NoviceConjouration]);

	all_perks[Perks.ApprenticeConjouration]=newPerk("Apprentice Conjouration", Perks.ApprenticeConjouration, [100, 50], [25], [Perks.NoviceConjouration], "Caast Apprentice level Conjouration spells for half magicka.");
	ds_list_add(sk.perks, all_perks[Perks.ApprenticeConjouration]);

	all_perks[Perks.AdeptConjouration]=newPerk("Adept Conjouration", Perks.AdeptConjouration, [100, 50], [50], [Perks.AdeptConjouration], "Cast Adept level Conjouration spells for half magicka.");
	ds_list_add(sk.perks, all_perks[Perks.AdeptConjouration]);

	all_perks[Perks.ExpertConjouration]=newPerk("Expert Conjouration", Perks.ExpertConjouration, [100, 50], [75], [Perks.AdeptConjouration], "Cast Expert level Conjouration spells for half magicka.");
	ds_list_add(sk.perks, all_perks[Perks.ExpertConjouration]);

	all_perks[Perks.MasterConjouration]=newPerk("Master Conjouration", Perks.MasterConjouration, [100, 50], [100], [Perks.ExpertConjouration], "Cast Master level Conjouration spells for half magicka.");
	ds_list_add(sk.perks, all_perks[Perks.MasterConjouration]);

	all_perks[Perks.ConjourationDualCasting]=newPerk("Conjouration Dual Casting", Perks.ConjourationDualCasting, [0, 50], [20], [Perks.NoviceConjouration], "Dual casting a Conjuration spell overcharges the spell, allowing it to last longer.");
	ds_list_add(sk.perks, all_perks[Perks.ConjourationDualCasting]);

	all_perks[Perks.MysticBinding]=newPerk("Mystic Binding", Perks.MysticBinding, [0, 50], [20], [Perks.NoviceConjouration], "Bound weapons do more damage.");
	ds_list_add(sk.perks, all_perks[Perks.MysticBinding]);

	all_perks[Perks.SoulStealer]=newPerk("Soul Stealer", Perks.SoulStealer, [false, true], [30], [Perks.MysticBinding], "Bound weapons cast Soul Trap on targets.");
	ds_list_add(sk.perks, all_perks[Perks.SoulStealer]);

	all_perks[Perks.OblivionBinding]=newPerk("Oblivion Binding", Perks.OblivionBinding, [false, true], [50], [Perks.SoulStealer], "Bound weapons will banish summoned creatures and turn raised ones.");
	ds_list_add(sk.perks, all_perks[Perks.OblivionBinding]);

	all_perks[Perks.Necromancy]=newPerk("Necromancy", Perks.Necromancy, [0, 50], [40], [Perks.NoviceConjouration], "Greater duration for reaminated undead.");
	ds_list_add(sk.perks, all_perks[Perks.Necromancy]);

	all_perks[Perks.DarkSouls]=newPerk("Dark Souls", Perks.DarkSouls, [0, 100], [70], [Perks.Necromancy], "Reanimated undead have & more points of health.");
	ds_list_add(sk.perks, all_perks[Perks.DarkSouls]);

	all_perks[Perks.Summoner]=newPerk("Summoner", Perks.Summoner, [1, 2, 3], [30, 70], [Perks.NoviceConjouration], "Can summon atronachs or raise undead from &x farther away.");
	ds_list_add(sk.perks, all_perks[Perks.Summoner]);

	all_perks[Perks.Atromancy]=newPerk("Atromancy", Perks.Atromancy, [1, 2], [40], [Perks.Summoner], "Double duration for conjoured atronachs.");
	ds_list_add(sk.perks, all_perks[Perks.Atromancy]);

	all_perks[Perks.ElementalPotency]=newPerk("Elemental Potency", Perks.ElementalPotency, [0, 50], [80], [Perks.Atromancy], "Conjoured atronachs are &% more powerful.");
	ds_list_add(sk.perks, all_perks[Perks.ElementalPotency]);

	all_perks[Perks.TwinSouls]=newPerk("Twin Souls", Perks.TwinSouls, [1, 2], [100], [Perks.DarkSouls, Perks.ElementalPotency], "You can have two atronachs or reanimaetd zombies.");
	ds_list_add(sk.perks, all_perks[Perks.TwinSouls]);

	// Destruction
	sk=all_skills[Skills.destruct];
	all_perks[Perks.NoviceDestruction]=newPerk("Novice Destruction", Perks.NoviceDestruction, [100, 50], [0], [], "Cast Novice level Destruction spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.NoviceDestruction]);

	all_perks[Perks.ApprenticeDestruction]=newPerk("Apprentice Destruction", Perks.ApprenticeDestruction, [100, 50], [25], [Perks.NoviceDestruction], "Cast Apprentice level Destruction spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.ApprenticeDestruction]);

	all_perks[Perks.AdeptDestruction]=newPerk("Adept Destruction", Perks.AdeptDestruction, [100, 50], [50], [Perks.ApprenticeDestruction], "Cast Adept level Destruction spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.AdeptDestruction]);

	all_perks[Perks.ExpertDestruction]=newPerk("Expert Destruction", Perks.ExpertDestruction, [100, 50], [75], [Perks.AdeptDestruction], "Cast Adept level Destruction spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.ExpertDestruction]);

	all_perks[Perks.MasterDestruction]=newPerk("Master Destruction", Perks.MasterDestruction, [100, 50], [100], [Perks.ExpertDestruction], "Cast Expert level Destruction spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.MasterDestruction]);

	all_perks[Perks.RuneMaster]=newPerk("Rune Master", Perks.RuneMaster, [1, 5], [40], [Perks.ApprenticeDestruction], "Can place runes up to & times farther away.");
	ds_list_add(sk.perks, all_perks[Perks.RuneMaster]);

	all_perks[Perks.AugmentedFlames]=newPerk("Augmented Flames", Perks.AugmentedFlames, [0, 25, 50], [30, 60], [Perks.NoviceDestruction], "Fire spells do &% more damage.");
	ds_list_add(sk.perks, all_perks[Perks.AugmentedFlames]);

	all_perks[Perks.IntenseFlames]=newPerk("Intense Flames", Perks.IntenseFlames, [0, 20], [50], [Perks.AugmentedFlames], "Frre damage causes targets to flee if their health is low.");
	ds_list_add(sk.perks, all_perks[Perks.IntenseFlames]);

	all_perks[Perks.AugmentedFrost]=newPerk("Augmented Frost", Perks.AugmentedFrost,  [0, 25, 50], [30, 60], [Perks.NoviceDestruction], "Frost spells do &% more damage.");
	ds_list_add(sk.perks, all_perks[Perks.AugmentedFrost]);

	all_perks[Perks.DeepFreeze]=newPerk("Deep Freeze", Perks.DeepFreeze,  [0, 20], [50], [Perks.AugmentedFlames], "Frost damage paralyzes targets if their health is low.");
	ds_list_add(sk.perks, all_perks[Perks.DeepFreeze]);

	all_perks[Perks.AugmentedShock]=newPerk("Augmented Shock", Perks.AugmentedShock,  [0, 25, 50], [30, 60], [Perks.NoviceDestruction], "Shock spells do &% more damage.");
	ds_list_add(sk.perks, all_perks[Perks.AugmentedShock]);

	all_perks[Perks.Disintegrate]=newPerk("Disintegrate", Perks.Disintegrate,  [0, 15], [50], [Perks.AugmentedFlames], "Shock spells disintegrate targets if their health is low.");
	ds_list_add(sk.perks, all_perks[Perks.Disintegrate]);

	all_perks[Perks.DestructionDualCasting]=newPerk("Destruction Dual Casting", Perks.DestructionDualCasting, [0, 50], [20], [Perks.NoviceDestruction], "Dual casting a Destruction spell overcharges the effects into an even more powerful version.");
	ds_list_add(sk.perks, all_perks[Perks.DestructionDualCasting]);

	all_perks[Perks.Impact]=newPerk("Impact", Perks.Impact, [false, true], [40], [Perks.DestructionDualCasting], "Most destruction spells will stagger an opponent when dual cast.");
	ds_list_add(sk.perks, all_perks[Perks.Impact]);

	// Light Armor
	sk=all_skills[Skills.light];
	all_perks[Perks.AgileDefender]=newPerk("Agile Defender", Perks.AgileDefender, [0, 20, 40, 60, 80, 100], [0, 20, 40, 60, 80], [], "Increases Light Armor rating by &%.");
	ds_list_add(sk.perks, all_perks[Perks.AgileDefender]);

	all_perks[Perks.CustomFit]=newPerk("Custom Fit", Perks.CustomFit, [0, 25], [30], [Perks.AgileDefender], "&% armor bonus if wearing all Light Armor: head, chest, hands and feet.");
	ds_list_add(sk.perks, all_perks[Perks.CustomFit]);

	all_perks[Perks.MatchingSetLA]=newPerk("Matching Set", Perks.MatchingSetLA, [0, 25], [70], [Perks.CustomFit], "Additional &% armor bonus if weaing a matching set of Light Armor.");
	ds_list_add(sk.perks, all_perks[Perks.MatchingSetLA]);

	all_perks[Perks.Unhindered]=newPerk("Unhindered", Perks.Unhindered, [1, 0], [50], [Perks.CustomFit], "Light Armor weighs nothing and doesn't slow you down when worn.");
	ds_list_add(sk.perks, all_perks[Perks.Unhindered]);

	all_perks[Perks.WindWalker]=newPerk("Wind Walker", Perks.WindWalker, [0, 50], [60], [Perks.Unhindered], "Stamina regenerates &% faster in all Light Armor: head, chest, hands and feet.");
	ds_list_add(sk.perks, all_perks[Perks.WindWalker]);

	all_perks[Perks.DeftMovement]=newPerk("Deft Movement", Perks.DeftMovement, [0, 10], [100], [Perks.WindWalker, Perks.MatchingSetLA], "&% chance of avoiding all damage from a melee attack while wearing all Light Armor: head, chest, hands and feet.");
	ds_list_add(sk.perks, all_perks[Perks.DeftMovement]);

	// Heavy Armor
	sk=all_skills[Skills.heavy];
	all_perks[Perks.Juggernaut]=newPerk("Juggernaut", Perks.Juggernaut, [0, 20, 40, 60, 80, 100], [0, 20, 40, 60, 80], [], "Increases Heavy Armor rating by &%.");
	ds_list_add(sk.perks, all_perks[Perks.Juggernaut]);

	all_perks[Perks.FistsOfSteel]=newPerk("Fists of Steel", Perks.FistsOfSteel, [false, true], [30], [Perks.Juggernaut], "Unarmed attacks with Heavy Armor gauntlets do their armor rating in extra damage.");
	ds_list_add(sk.perks, all_perks[Perks.FistsOfSteel]);
	// @todo Find another use for this, as there is no fall damage
	all_perks[Perks.Cushioned]=newPerk("Cushioned", Perks.Cushioned, [100, 50], [50], [Perks.FistsOfSteel], "Half damage from falling if wearing all Heavy Armor: head, chest, hands and feet.");
	ds_list_add(sk.perks, all_perks[Perks.Cushioned]);

	all_perks[Perks.Conditioning]=newPerk("Conditioning", Perks.Conditioning,  [false, true], [70], [Perks.Cushioned], "Heavy Armor weighs nothing and doesn't slow you down when worn.");
	ds_list_add(sk.perks, all_perks[Perks.Conditioning]);

	all_perks[Perks.WellFitted]=newPerk("Well Fitted", Perks.WellFitted, [0, 25], [30], [Perks.Juggernaut], "&% Armor bonus if wearing all Heavy Armor: head, chest, hands and feet.");
	ds_list_add(sk.perks, all_perks[Perks.WellFitted]);

	all_perks[Perks.TowerOfStrength]=newPerk("Tower of Strength", Perks.TowerOfStrength, [0, 50], [50], [Perks.WellFitted], "&% less stagger when wearing only Heavy Armor.");
	ds_list_add(sk.perks, all_perks[Perks.TowerOfStrength]);

	all_perks[Perks.MatchingSetHA]=newPerk("Matching Set", Perks.MatchingSetHA, [0, 25], [70], [Perks.TowerOfStrength], "Additional &% Armor bonus if weaing a matched set of Heavy Armor.");
	ds_list_add(sk.perks, all_perks[Perks.MatchingSetHA]);

	all_perks[Perks.ReflectBlows]=newPerk("Reflect Blows", Perks.ReflectBlows, [0, 10], [100], [Perks.MatchingSetHA], "&% chance to reflect melee damage back to the enemy while wearing all Heavy Armor: head, chest, hands and feet.");
	ds_list_add(sk.perks, all_perks[Perks.ReflectBlows]);

	// Lockpicking
	sk=all_skills[Skills.lock];
	all_perks[Perks.NoviceLocks]=newPerk("Novice Locks", Perks.NoviceLocks, [0, 50], [0], [], "Novice locks are &% easier to pick.");
	ds_list_add(sk.perks, all_perks[Perks.NoviceLocks]);

	all_perks[Perks.ApprenticeLocks]=newPerk("Apprentice Locks", Perks.ApprenticeLocks, [0, 100], [25], [Perks.NoviceLocks], "Apprentice locks are &% easier to pick.");
	ds_list_add(sk.perks, all_perks[Perks.ApprenticeLocks]);

	all_perks[Perks.QuickHands]=newPerk("Quick Hands", Perks.QuickHands, [false, true], [40], [Perks.ApprenticeLocks], "Able to pick locks without being noticed.");
	ds_list_add(sk.perks, all_perks[Perks.QuickHands]);

	all_perks[Perks.WaxKey]=newPerk("Wax Key", Perks.WaxKey, [false, true], [50], [Perks.QuickHands], "Automatically gives you a copy of a key of a picked lock's key, if it has one.");
	ds_list_add(sk.perks, all_perks[Perks.WaxKey]);

	all_perks[Perks.AdeptLocks]=newPerk("Adept Locks", Perks.AdeptLocks, [0, 100], [50], [Perks.ApprenticeLocks], "Adept locks are &% easier to pick.");
	ds_list_add(sk.perks, all_perks[Perks.AdeptLocks]);

	all_perks[Perks.ExpertLocks]=newPerk("Expert Locks", Perks.ExpertLocks, [0, 100], [75], [Perks.AdeptLocks], "Expert locks are &% easier to pick.");
	ds_list_add(sk.perks, all_perks[Perks.ExpertLocks]);

	all_perks[Perks.GoldenTouch]=newPerk("Golden Touch", Perks.GoldenTouch, [0, 50], [60], [Perks.AdeptLocks], "Find more gold in chests.");
	ds_list_add(sk.perks, all_perks[Perks.GoldenTouch]);

	all_perks[Perks.TreasureHunter]=newPerk("Treasure Hunter", Perks.TreasureHunter, [0, 50], [70], [Perks.GoldenTouch], "&% greater chance of finding special treasure.");
	ds_list_add(sk.perks, all_perks[Perks.TreasureHunter]);

	all_perks[Perks.Locksmith]=newPerk("Locksmith", Perks.Locksmith, [false, true], [80], [Perks.ExpertLocks], "Pick starts closer to the lock opening position.");
	ds_list_add(sk.perks, all_perks[Perks.Locksmith]);

	all_perks[Perks.Unbreakable]=newPerk("Unbreakable", Perks.Unbreakable, [false, true], [100], [Perks.Locksmith], "Lockpicks never break.");
	ds_list_add(sk.perks, all_perks[Perks.Unbreakable]);

	all_perks[Perks.MasterLocks]=newPerk("Master Locks", Perks.MasterLocks, [0, 50], [100], [Perks.ExpertLocks], "Master locks are &% easier to pick.");
	ds_list_add(sk.perks, all_perks[Perks.MasterLocks]);

	// Enchanting
	sk=all_skills[Skills.enchant];
	all_perks[Perks.Enchanter]=newPerk("Enchanter", Perks.Enchanter, [0, 20, 40, 60, 80, 100], [0, 20, 40, 60, 80], [], "New enchantments are &% stronger.");
	ds_list_add(sk.perks, all_perks[Perks.Enchanter]);

	all_perks[Perks.FireEnchanter]=newPerk("Fire Enchanter", Perks.FireEnchanter, [0, 25], [30], [Perks.Enchanter], "Fire enchantments on weapons and armor are &% stronger.");
	ds_list_add(sk.perks, all_perks[Perks.FireEnchanter]);

	all_perks[Perks.FrostEnchanter]=newPerk("Frost Enchanter", Perks.FrostEnchanter, [0, 25], [40], [Perks.FireEnchanter], "Frost enchantments on weapons and armor are &% stronger.");
	ds_list_add(sk.perks, all_perks[Perks.FrostEnchanter]);

	all_perks[Perks.StormEnchanter]=newPerk("Storm Enchanter", Perks.StormEnchanter, [0, 25], [50], [Perks.FrostEnchanter], "Shock enchantments on weapons and armor are &% stronger.");
	ds_list_add(sk.perks, all_perks[Perks.StormEnchanter]);

	all_perks[Perks.InsightfulEnchanter]=newPerk("Insightful Enchanter", Perks.InsightfulEnchanter, [0, 25], [50], [Perks.Enchanter], "Skill enchantments on weapons and armor are &% stronger.");
	ds_list_add(sk.perks, all_perks[Perks.InsightfulEnchanter]);

	all_perks[Perks.CorpusEnchanter]=newPerk("Corpus Enchanter", Perks.CorpusEnchanter, [0, 25], [70], [Perks.InsightfulEnchanter], "Health, magicka and stamina enchantments on armor are &% stronger.");
	ds_list_add(sk.perks, all_perks[Perks.CorpusEnchanter]);

	all_perks[Perks.ExtraEffect]=newPerk("Extra Effect", Perks.ExtraEffect, [1, 2], [100], [Perks.CorpusEnchanter, Perks.StormEnchanter], "Can put two enchantments on the same item.");
	ds_list_add(sk.perks, all_perks[Perks.ExtraEffect]);

	all_perks[Perks.SoulSqueezer]=newPerk("Soul Squeezer", Perks.SoulSqueezer, [false, true], [20], [Perks.Enchanter], "Soul gems provide extra magicka for recharging.");
	ds_list_add(sk.perks, all_perks[Perks.SoulSqueezer]);

	all_perks[Perks.SoulSiphon]=newPerk("Soul Siphon", Perks.SoulSiphon, [0, 5], [40], [Perks.SoulSqueezer], "Death blows to creatures (but not people) trap &% of the victim's soul, recharing the weapon.");
	ds_list_add(sk.perks, all_perks[Perks.SoulSiphon]);

	// One-handed
	sk=all_skills[Skills.one_hand];
	all_perks[Perks.Armsman]=newPerk("Arsman", Perks.Armsman, [0, 20, 40, 60, 80, 100], [0, 20, 40, 60, 80], [], "One-handed weapons do &% more damage.");
	ds_list_add(sk.perks, all_perks[Perks.Armsman]);

	all_perks[Perks.Bladesman]=newPerk("Bladesman", Perks.Bladesman, [0, 10, 15, 20], [30, 60, 90], [Perks.Armsman], "Attacks with swords have a &% chance of doing critical damage.");
	ds_list_add(sk.perks, all_perks[Perks.Bladesman]);

	all_perks[Perks.BoneBreaker]=newPerk("Bone Breaker", Perks.BoneBreaker, [0, 25, 50, 75], [30, 60, 90], [Perks.Armsman], "Attacks with maces ignore % of armor.");
	ds_list_add(sk.perks, all_perks[Perks.BoneBreaker]);

	all_perks[Perks.DualFlurry]=newPerk("Dual Flurry", Perks.DualFlurry, [0, 20, 35], [30, 50], [Perks.Armsman], "Dual wielding attacks are &% faster.");
	ds_list_add(sk.perks, all_perks[Perks.DualFlurry]);

	all_perks[Perks.DualSavagery]=newPerk("Dual Savagery", Perks.DualSavagery, [0, 50], [70], [Perks.DualFlurry], "Dual wielding power attacks do &% bonus damage.");
	ds_list_add(sk.perks, all_perks[Perks.DualSavagery]);

	all_perks[Perks.FightingStance]=newPerk("Fighting Stance", Perks.FightingStance, [0, 25], [20], [Perks.Armsman], "Power attacks with one-handed weapons cost &% less stamina.");
	ds_list_add(sk.perks, all_perks[Perks.FightingStance]);

	all_perks[Perks.CriticalCharge]=newPerk("Critical Charge", Perks.CriticalCharge, [1, 2], [50], [Perks.FightingStance], "Can do a one-handed power attack while sprinting that does double critical damage. Will need to be replaced by something else due to the turn-based nature of this game.");
	ds_list_add(sk.perks, all_perks[Perks.CriticalCharge]);

	all_perks[Perks.SavageStrike]=newPerk("Savage Strike", Perks.SavageStrike, [0, 25], [50], [Perks.FightingStance], "Standing power attacks do &% bonus damage.");
	ds_list_add(sk.perks, all_perks[Perks.SavageStrike]);

	all_perks[Perks.ParalyzingStrike]=newPerk("Paralyzing Strike", Perks.ParalyzingStrike, [0, 25], [100], [Perks.CriticalCharge, Perks.SavageStrike], "Backwards power attacks have a &% chance to paralyze the target.");
	ds_list_add(sk.perks, all_perks[Perks.ParalyzingStrike]);

	all_perks[Perks.HackAndSlash]=newPerk("Hack and Slash", Perks.HackAndSlash, [0, 20, 40, 60], [30, 60, 90], [Perks.Armsman], "Attacks with war axes cause &% extra bleeding damage.");
	ds_list_add(sk.perks, all_perks[Perks.HackAndSlash]);

	// Pickpocket
	sk=all_skills[Skills.pick];
	all_perks[Perks.LightFingers]=newPerk("Light Fingers", Perks.LightFingers, [0, 20, 40, 60, 80, 100], [0, 20, 40, 60, 80], [], "Stuff is &% easier to pickpocket. (Item weight and value reduce pickpocketing odds.)");
	ds_list_add(sk.perks, all_perks[Perks.LightFingers]);

	all_perks[Perks.NightThief]=newPerk("Night Thief", Perks.NightThief, [0, 25], [30], [Perks.LightFingers], "&% greater chance of pickpocketing success if the target is asleep.");
	ds_list_add(sk.perks, all_perks[Perks.NightThief]);

	all_perks[Perks.Cutpurse]=newPerk("Cutpurse", Perks.Cutpurse, [0, 50], [40], [Perks.NightThief], "Pickpocketing gold is &% easier.");
	ds_list_add(sk.perks, all_perks[Perks.Cutpurse]);

	all_perks[Perks.Keymaster]=newPerk("Keymaster", Perks.Keymaster, [0, 100], [60], [Perks.Cutpurse], "Pickpocketing keys almost always works.");
	ds_list_add(sk.perks, all_perks[Perks.Keymaster]);

	all_perks[Perks.Misdirection]=newPerk("Misdirection", Perks.Misdirection, [false, true], [70], [Perks.Cutpurse], "Can pickpocket equipped weapons.");
	ds_list_add(sk.perks, all_perks[Perks.Misdirection]);

	all_perks[Perks.PerfectTouch]=newPerk("Perfect Touch", Perks.PerfectTouch, [false, true], [100], [Perks.Misdirection], "Can pickpocket equipped items.");
	ds_list_add(sk.perks, all_perks[Perks.PerfectTouch]);

	all_perks[Perks.ExtraPockets]=newPerk("Extra Pockets", Perks.ExtraPockets, [0, 100], [50], [Perks.NightThief], "Carrying capacity is increased by &.");
	ds_list_add(sk.perks, all_perks[Perks.ExtraPockets]);

	all_perks[Perks.Poisoned]=newPerk("Poisoned", Perks.Poisoned, [false, true], [40], [Perks.NightThief], "Silently harm enemies by placing poisons in their pockets.");
	ds_list_add(sk.perks, all_perks[Perks.Poisoned]);

	// Illusion
	sk=all_skills[Skills.illusion];
	all_perks[Perks.NoviceIllusion]=newPerk("Novice Illusion", Perks.NoviceIllusion, [100, 50], [0], [], "Cast Novice level Illusion spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.NoviceIllusion]);

	all_perks[Perks.Animage]=newPerk("Animage", Perks.Animage, [0, 8], [20], [Perks.NoviceIllusion], "Illusion spells now work on higher level animals.");
	ds_list_add(sk.perks, all_perks[Perks.Animage]);

	all_perks[Perks.KindredMage]=newPerk("Kindred Mage", Perks.KindredMage, [0, 10], [40], [Perks.Animage], "All illusion spells work on higher level people.");
	ds_list_add(sk.perks, all_perks[Perks.KindredMage]);

	all_perks[Perks.QuietCasting]=newPerk("Quiet Casting", Perks.QuietCasting, [false, true], [50], [Perks.KindredMage], "All spells you cast are silent. Probably needs to be replaced with some other effect.");
	ds_list_add(sk.perks, all_perks[Perks.QuietCasting]);

	all_perks[Perks.ApprenticeIllusion]=newPerk("Apprenctice Illusion", Perks.ApprenticeIllusion, [100, 50], [25], [Perks.NoviceIllusion], "Cast Apprentice level Illusion spells for half magicka.");
	ds_list_add(sk.perks, all_perks[Perks.ApprenticeIllusion]);

	all_perks[Perks.AdeptIllusion]=newPerk("Adept Illusion", Perks.AdeptIllusion, [100, 50], [50], [Perks.ApprenticeIllusion], "Cast Adept level Illusion spells for half magicka.");
	ds_list_add(sk.perks, all_perks[Perks.AdeptIllusion]);

	all_perks[Perks.ExpertIllusion]=newPerk("Expert Illusion", Perks.ExpertIllusion, [100, 50], [75], [Perks.AdeptIllusion], "Cast Expert level Illusion spells for half magicka.");
	ds_list_add(sk.perks, all_perks[Perks.ExpertIllusion]);

	all_perks[Perks.MasterIllusion]=newPerk("Master Illusion", Perks.MasterIllusion, [100, 50], [100], [Perks.ExpertIllusion], "Cast Master level Illusion spells for half magicka.");
	ds_list_add(sk.perks, all_perks[Perks.MasterIllusion]);

	all_perks[Perks.HypnoticGaze]=newPerk("Hypnotic Gaze", Perks.HypnoticGaze, [0, 8], [30], [Perks.NoviceIllusion], "Calm spells now work on higher level opponents.");
	ds_list_add(sk.perks, all_perks[Perks.HypnoticGaze]);

	all_perks[Perks.AspectOfTerror]=newPerk("Aspect of Terror", Perks.AspectOfTerror, [0, 10], [50], [Perks.HypnoticGaze], "Fear spells now work on higher level opponents.");
	ds_list_add(sk.perks, all_perks[Perks.AspectOfTerror]);

	all_perks[Perks.Rage]=newPerk("Rage", Perks.Rage, [0, 12], [70], [Perks.AspectOfTerror], "Frenzy spells now work on higher level opponents.");
	ds_list_add(sk.perks, all_perks[Perks.Rage]);

	all_perks[Perks.MasterOfTheMind]=newPerk("Master of the Mind", Perks.MasterOfTheMind, [false, true], [90], [Perks.QuietCasting, Perks.Rage], "Illusion spells work on the undead, daedra and automatons.");
	ds_list_add(sk.perks, all_perks[Perks.MasterOfTheMind]);

	all_perks[Perks.IllusionDualCasting]=newPerk("Illusion Dual Casting", Perks.IllusionDualCasting, [0, 50], [20], [Perks.NoviceIllusion], "Dual casting an Illusion spell overcharges the effects into an even more powerful version.");
	ds_list_add(sk.perks, all_perks[Perks.IllusionDualCasting]);

	// Smithing
	sk=all_skills[Skills.smith];
	all_perks[Perks.SteelSmithing]=newPerk("Steel Smithing", Perks.SteelSmithing, [false, true], [0], [], "Can create Steel armor and weapons at forges, and improve them twice as much.");
	ds_list_add(sk.perks, all_perks[Perks.SteelSmithing]);

	all_perks[Perks.ArcaneBlacksmith]=newPerk("Arcane Blacksmith", Perks.ArcaneBlacksmith,  [false, true], [60], [Perks.SteelSmithing], "You can improve enchanted weapons and armor.");
	ds_list_add(sk.perks, all_perks[Perks.ArcaneBlacksmith]);

	all_perks[Perks.DwarvenSmithing]=newPerk("Dwarven Smithing", Perks.DwarvenSmithing,  [false, true], [30], [Perks.SteelSmithing], "Can create Dwarven armor and weapons at forges, and improve them twice as much.");
	ds_list_add(sk.perks, all_perks[Perks.DwarvenSmithing]);

	all_perks[Perks.OrcishSmithing]=newPerk("Orcish Smithing", Perks.OrcishSmithing,  [false, true], [50], [Perks.DwarvenSmithing], "Can create Orcish armor and weapons at forges, and improve them twice as much.");
	ds_list_add(sk.perks, all_perks[Perks.OrcishSmithing]);

	all_perks[Perks.EbonySmithing]=newPerk("Ebony Smithing", Perks.EbonySmithing,  [false, true], [80], [Perks.OrcishSmithing], "Can create Ebony armor and weapons at forges, and improve them twice as much.");
	ds_list_add(sk.perks, all_perks[Perks.EbonySmithing]);

	all_perks[Perks.DaedricSmithing]=newPerk("Daedric Smithing", Perks.DaedricSmithing,  [false, true], [90], [Perks.EbonySmithing], "Can create Daedric armor and weapons at forges, and improve them twice as much.");
	ds_list_add(sk.perks, all_perks[Perks.DaedricSmithing]);

	all_perks[Perks.ElvenSmithing]=newPerk("Elven Smithing", Perks.ElvenSmithing,  [false, true], [30], [Perks.SteelSmithing], "Can create Elven armor and weapons at forges, and improve them twice as much.");
	ds_list_add(sk.perks, all_perks[Perks.ElvenSmithing]);

	all_perks[Perks.AdvanceArmors]=newPerk("Advance Armors", Perks.AdvanceArmors, [false, true], [50], [Perks.ElvenSmithing], "Can create Scaled and Plate armor at forges, and improve them twice as much.");
	ds_list_add(sk.perks, all_perks[Perks.AdvanceArmors]);

	all_perks[Perks.GlassSmithing]=newPerk("Glass Smithing", Perks.GlassSmithing, [false, true], [70], [Perks.AdvanceArmors], "Can create Glass armor and weapons at forges, and improve them twice as much.");
	ds_list_add(sk.perks, all_perks[Perks.GlassSmithing]);

	all_perks[Perks.DragonArmor]=newPerk("Dragon Armor", Perks.DragonArmor, [false, true], [100], [Perks.DaedricSmithing, Perks.GlassSmithing], "Can create Dragon armor at forges, and improve them twice as much.");
	ds_list_add(sk.perks, all_perks[Perks.DragonArmor]);

	// Stealth
	sk=all_skills[Skills.sneak];
	all_perks[Perks.Stealth]=newPerk("Stealth", Skills.sneak, [0, 20, 25, 30, 25, 40], [0, 20, 40, 60, 80], [], "You are &% harder to detect while sneaking.");
	ds_list_add(sk.perks, all_perks[Perks.Stealth]);

	all_perks[Perks.Backstab]=newPerk("Backstab", Skills.sneak, [1, 6], [30], [Perks.Stealth], "First Strikes with one-handed weapons now do % times damage.");
	ds_list_add(sk.perks, all_perks[Perks.Backstab]);

	all_perks[Perks.DeadlyAim]=newPerk("Deadly Aim", Skills.sneak, [1, 3], [40], [Perks.Backstab], "First Strikes with bows now do % times damage.");
	ds_list_add(sk.perks, all_perks[Perks.DeadlyAim]);

	all_perks[Perks.AssassinsBlade]=newPerk("Assassin's Blade", Skills.sneak, [1, 15], [50], [Perks.DeadlyAim], "First Strikes with daggers now do a total of % times normal damage.");
	ds_list_add(sk.perks, all_perks[Perks.AssassinsBlade]);

	all_perks[Perks.MuffledMovement]=newPerk("Muffled Movements", Skills.sneak, [100, 50], [30], [Perks.Stealth], "Wearing armor makes % percent as much noise when you move.");
	ds_list_add(sk.perks, all_perks[Perks.MuffledMovement]);

	all_perks[Perks.LightFoot]=newPerk("Light Foot", Skills.sneak, [true, false], [40], [Perks.MuffledMovement], "You won't trigger pressure plates.");
	ds_list_add(sk.perks, all_perks[Perks.LightFoot]);

	all_perks[Perks.SilentRoll]=newPerk("Silent Roll", Skills.sneak, [true, false], [50], [Perks.LightFoot], "Sprinting while sneaking executes a silent roll forward.");
	ds_list_add(sk.perks, all_perks[Perks.SilentRoll]);

	all_perks[Perks.Silence]=newPerk("Silence", Skills.sneak, [false, true], [70], [Perks.SilentRoll], "Walking and running do not affect detection.");
	ds_list_add(sk.perks, all_perks[Perks.Silence]);

	all_perks[Perks.ShadowWarrior]=newPerk("Shadow Warrior", Skills.sneak, [false, true], [100], [Perks.Silence], "Crouching stops combat for a moment and forces distance opponents to search for a tagret.");
	ds_list_add(sk.perks, all_perks[Perks.ShadowWarrior]);

	// Restoration
	sk=all_skills[Skills.restore];
	all_perks[Perks.NoviceRestoration]=newPerk("Novice Restoration", Perks.NoviceRestoration, [100, 50], [0], [], "Cast Novice level Restoration spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.NoviceRestoration]);

	all_perks[Perks.ApprenticeRestoration]=newPerk("Apprentice Restoration", Perks.ApprenticeRestoration, [100, 50], [25], [Perks.NoviceRestoration], "Cast Apprentice level Restoration spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.ApprenticeRestoration]);

	all_perks[Perks.AdeptRestoration]=newPerk("Adept Restoration", Perks.AdeptRestoration, [100, 50], [50], [Perks.ApprenticeRestoration], "Cast Adept level Restoration spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.AdeptRestoration]);

	all_perks[Perks.ExpertRestoration]=newPerk("Expert Restoration", Perks.ExpertRestoration, [100, 50], [75], [Perks.AdeptRestoration], "Cast Expert level Restoration spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.ExpertRestoration]);

	all_perks[Perks.MasterRestoration]=newPerk("Master Restoration", Perks.MasterRestoration, [100, 50], [100], [Perks.ExpertRestoration], "Cast Master level Restoration spells for &% magicka.");
	ds_list_add(sk.perks, all_perks[Perks.MasterRestoration]);

	all_perks[Perks.Recovery]=newPerk("Recovery", Perks.Recovery, [0, 25, 50], [30, 60], [Perks.NoviceRestoration], "Magicka regenerates &% faster.");
	ds_list_add(sk.perks, all_perks[Perks.Recovery]);

	all_perks[Perks.AvoidDeath]=newPerk("Avoid Death", Perks.AvoidDeath, [0, 250], [60], [], "Once a day, heals & points automatically if you fall below 10% health.");
	ds_list_add(sk.perks, all_perks[Perks.AvoidDeath]);

	all_perks[Perks.Regeneration]=newPerk("Regeneration", Perks.Regeneration, [0, 50], [90], [Perks.Recovery], "Healing spells cure &% more.");
	ds_list_add(sk.perks, all_perks[Perks.Regeneration]);

	all_perks[Perks.Necromage]=newPerk("Necromage", Perks.Necromage, [0, 25], [20], [Perks.NoviceRestoration], "All spells are more effective against the undead.");
	ds_list_add(sk.perks, all_perks[Perks.Necromage]);

	all_perks[Perks.Respite]=newPerk("Respite", Perks.Respite, [false, true],  [40], [Perks.NoviceRestoration], "Healing spells also restore Stamina.");
	ds_list_add(sk.perks, all_perks[Perks.Respite]);

	all_perks[Perks.RestorationDualCasting]=newPerk("Restoration Dual Casting", Perks.RestorationDualCasting, [100, 220], [20],  [Perks.NoviceRestoration], "Dual casting a Restoration spell overcharges the effects into an even more powerful version.");
	ds_list_add(sk.perks, all_perks[Perks.RestorationDualCasting]);

	all_perks[Perks.WardAbsorb]=newPerk("Ward Absorb", Perks.WardAbsorb, [false, true], [60], [Perks.NoviceRestoration], "Wards recharge your magicka when hit by spells.");
	ds_list_add(sk.perks, all_perks[Perks.WardAbsorb]);

	// Two-handed
	sk=all_skills[Skills.two_hand];
	all_perks[Perks.Barbarian]=newPerk("Barbarian", Perks.Barbarian, [0, 20, 40, 60, 80, 100], [0, 20, 40, 60, 80], [], "Two-handed weapons do &% more damage.");
	ds_list_add(sk.perks, all_perks[Perks.Barbarian]);

	all_perks[Perks.ChampionsStance]=newPerk("Champion's Stance", Perks.ChampionsStance, [0, 25], [20], [Perks.Barbarian], "Power attacks with two-handed weapons cost &% less stamina.");
	ds_list_add(sk.perks, all_perks[Perks.ChampionsStance]);

	/*all_perks[Perks.DevastatingBlow]=newPerk("Devastating Blow", 
	ds_list_add(sk.perks, all_perks[Perks.DevastatingBlow]);

	all_perks[Perks.GreatCriticalCharge]=newPerk("Great Critical Charge", 
	ds_list_add(sk.perks, all_perks[Perks.GreatCriticalCharge]);

	all_perks[Perks.Sweep]=newPerk("Sweep", 
	ds_list_add(sk.perks, all_perks[Perks.Sweep]);

	all_perks[Perks.Warmaster]=newPerk("Warmaster", 
	ds_list_add(sk.perks, all_perks[Perks.Warmaster]);

	all_perks[Perks.DeepWounds]=newPerk("Deep Wounds", 
	ds_list_add(sk.perks, all_perks[Perks.DeepWounds]);

	all_perks[Perks.Limbsplitter]=newPerk("Limbsplitter", 
	ds_list_add(sk.perks, all_perks[Perks.Limbsplitter]);

	all_perks[Perks.Skullcrusher]=newPerk("Skull Crusher", 
	ds_list_add(sk.perks, all_perks[Perks.Skullcrusher]);*/

	// Speech
	sk=all_skills[Skills.speech];
	all_perks[Perks.Haggling]=newPerk("Haggling", Perks.Haggling, [0, 10, 15, 20, 25, 30], [0, 20, 40, 60, 80], [], "Buying and selling prices are &% better.");
	ds_list_add(sk.perks, all_perks[Perks.Haggling]);

	/*all_perks[Perks.Allure]=newPerk("Allure", 
	ds_list_add(sk.perks, all_perks[Perks.Allure]);

	all_perks[Perks.Merchant]=newPerk("Merchant", 
	ds_list_add(sk.perks, all_perks[Perks.Merchant]);

	all_perks[Perks.Investor]=newPerk("Investor", 
	ds_list_add(sk.perks, all_perks[Perks.Investor]);

	all_perks[Perks.Fence]=newPerk("Fence", 
	ds_list_add(sk.perks, all_perks[Perks.Fence]);

	all_perks[Perks.MasterTrader]=newPerk("Master Trader", 
	ds_list_add(sk.perks, all_perks[Perks.MasterTrader]);

	all_perks[Perks.Bribery]=newPerk("Bribery", 
	ds_list_add(sk.perks, all_perks[Perks.Bribery]);

	all_perks[Perks.Persuasion]=newPerk("Persuasion", 
	ds_list_add(sk.perks, all_perks[Perks.Persuasion]);

	all_perks[Perks.Intimidation]=newPerk("Intimidation", 
	ds_list_add(sk.perks, all_perks[Perks.Intimidation]);*/


}
