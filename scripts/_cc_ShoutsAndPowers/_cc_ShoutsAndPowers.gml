enum Shouts {
	no,
	AnimalAllegiance,
	AuraWhisper,
	BattleFury,
	BecomeEthereal,
	BendWill,
	CallDragon,
	CallOfValor,
	ClearSkies,
	Cyclone,
	Disarm,
	Dismay,
	DragonAspect,
	Dragonrend,
	DrainVitality,
	ElementalFury,
	FireBreath,
	FrostBreath,
	IceForm,
	KynesPeace,
	MarkedForDeath,
	SlowTime,
	SoulTear,
	StormCall,
	SummonDurnehviir,
	ThrowVoice,
	UnrelentingForce,
	WhirlwindSprint,
}

all_shouts=array_create(Shouts.WhirlwindSprint, noone);

all_shouts[Shouts.no]=newShout("No Shout", "Word1", "Word2", "Word3", 5, 15, 25, "No shout.");

all_shouts[Shouts.AnimalAllegiance]=newShout("Animal Allegiance", "Animal", "Allegiance", "Pack", 50, 60, 70, "A Shout for help from the beasts of the wild, who come to fight in your defense.");
all_shouts[Shouts.AuraWhisper]=newShout("Aura Whisper", "Life", "Seek", "Hunt", 30, 40, 50, "Your Voice is not a Shout, but a whisper, revealing the life forces of any and all.");
all_shouts[Shouts.BattleFury]=newShout("Battle Fury", "Loyal", "Valor", "Inspire", 20, 30, 40, "Your Thu'um enchants your nearby allies' weapons, allowing them to attack faster.");
all_shouts[Shouts.BecomeEthereal]=newShout("Become Ethereal", "Fade", "Spirit", "Bind", 20, 20, 40, "The Thu'um reaches out to the Void, changing your form to one that cannot harm, or be harmed.");
all_shouts[Shouts.BendWill]=newShout("Bend Will", "Earth", "Mind", "Dragon", 10, 90, 120, "Your voice bends the very stones to your will. As it gains power, animals, people, and even dragons must do your bidding.");
all_shouts[Shouts.CallDragon]=newShout("Call Dragon", "Snow", "Hunter", "Wing", 5, 5, 300, "Odahviing! Hear my Voice and come forth. I summon you in my time of need.");
all_shouts[Shouts.CallOfValor]=newShout("Call of Valor", "Hero", "Champion", "Legend", 180, 180, 180, "The valiant of Sovngarde hear your Voice, and journey beyond space and time to lend aid.");
all_shouts[Shouts.ClearSkies]=newShout("Clear Skies", "Sky", "Spring", "Summer", 5, 10, 15, "Skyrim itself yields before the Thu'um, as you clear away fog and inclement weather.");
all_shouts[Shouts.Cyclone]=newShout("Cyclone", "Wind", "Unleash", "Strike", 30, 45, 60, "Your Thu'um creates a whirling cyclone that sows chaos among your enemies.");
all_shouts[Shouts.Disarm]=newShout("Disarm", "Weapon", "Hand", "Defeat", 30, 35, 40, "Shout defies steel, as you rip the weapon from an opponent's grasp.");
all_shouts[Shouts.Dismay]=newShout("Dismay", "Fear", "Run", "Terror", 40, 45, 50, "And the weak shall fear the Thu'um, and flee in terror.");
all_shouts[Shouts.DragonAspect]=newShout("Dragon Aspect", "Strength", "Armor", "Wyrm", 5, 5, 5, "Once a day, take on the mighty aspect of a dragon, delivering colossal blows, with an armored hide, and more powerful shouts.", true);
all_shouts[Shouts.Dragonrend]=newShout("Dragonrend", "Mortal", "Finite", "Temporary", 10, 12, 15, "Your Voice lashes out at a dragon's very soul, forcing the beast to land.");
all_shouts[Shouts.DrainVitality]=newShout("Drain Vitality", "Stamina", "Magicka", "Health", 30,60,90, "Coax both magical and mortal energies from your hapless opponent.");
all_shouts[Shouts.ElementalFury]=newShout("Elemental Fury", "Air", "Battle", "Grace", 30, 40, 50, "The Thu'um imbues your arms with the speed of wind, allowing for faster weapon strikes.");
all_shouts[Shouts.FireBreath]=newShout("Fire Breath", "Fire", "Inferno", "Sun", 30, 50, 100, "Inhale air, exhale flame, and behold the Thu'um as inferno.");
all_shouts[Shouts.FrostBreath]=newShout("Frost Breath", "Frost", "Cold", "Freeze", 30, 50, 100, "Your breath is winter, your Thu'um a blizzard.");
all_shouts[Shouts.IceForm]=newShout("Ice Form", "Ice", "Flesh", "Statue", 60, 90, 120, "Your Thu'um freezes an opponent solid.");
all_shouts[Shouts.KynesPeace]=newShout("Kyne's Peace", "Kyne", "Peace", "Trust", 40, 50, 60, "The Voice soothes wild beasts, who lose their desire to fight or flee.");
all_shouts[Shouts.MarkedForDeath]=newShout("Marked For Death", "Kill", "Leech", "Suffer", 20, 30, 40, "The Voice soothes wild beasts, who lose their desire to fight or flee.");
all_shouts[Shouts.SlowTime]=newShout("Slow Time", "Time", "Sand", "Eternal", 30, 45, 60, "Shout at time, and command it to obey, as the world around you stands still.");
all_shouts[Shouts.SoulTear]=newShout("Soul Tear", "Essence", "Tear", "Zombie", 5, 5, 90, "Your Thu'um cuts through flesh and shatters soul, commanding the will of the fallen.");
all_shouts[Shouts.StormCall]=newShout("Storm Call", "Storm", "Wrath", "Lightning", 300, 480, 600, "A Shout to the skies, a cry to the clouds, that awakens the destructive force of Skyrim's lightning.");
all_shouts[Shouts.SummonDurnehviir]=newShout("Summon Durnehviir", "Curse", "Never", "Dying", 5, 5, 300, "Durnehviir! Hear my Voice and come forth from the Soul Cairn. I summon you in my time of need.");
all_shouts[Shouts.ThrowVoice]=newShout("Throw Voice", "Voice", "Fool", "Far", 30, 15, 5, "The Thu'um is heard, but its source unknown, fooling those into seeking it out.");
all_shouts[Shouts.UnrelentingForce]=newShout("Unrelenting Force", "Force", "Balance", "Push", 15, 20, 45, "Your Voice is raw power, pushing aside anything - or anyone - who stands in your path.");
all_shouts[Shouts.WhirlwindSprint]=newShout("Whirlwind Sprint", "Whirlwind", "Temptest", "Fury", 20, 25, 35, "The Thu'um rushes forward, carrying you in its wake with the speed of a tempest.");

enum Powers {
	no,
	// Greater Powers
	AdrenalineRush,
	AncestorsWrath,
	BattleCry,
	BeastForm,
	BerserkerRage,
	CommandAnimal,
	Dragonskin,
	DreadCloak,
	EmbraceOfShadows,
	Highborn,
	Histskin,
	MorasAgony,
	MorasBoon,
	MorasGrasp,
	NightningaleStrife,
	NightingaleSubterfuge,
	OmenOfWarding,
	PolymorphSkeever,
	RingOfHircine,
	SecretOfArcana,
	SecretOfProtection,
	SecretOfStrength,
	ShadowcloakOfNocturnal,
	SummonKarstaag,
	SummonSpectralAssassin,
	RitualStone,
	SerpentStone,
	ShadowStone,
	TowerStone,
	VampiresSeduction,
	VampiresServant,
	VoiceOfTheEmperor,
	//	Single use Greater Powers
	BonesOfTheEarth,
	ConjureWerebear,
	NorthWind,
	RootOfPower,
	SunFlare,
	WatersOfLife,
	// Lesser Powers
	BardicKnowledge,
	BlackMarket,
	BreathOfNchuak,
	FrostmoonInstinct,
	NightEye,
	SecretServant,
	VampiresSight,
	VampireLord
}

all_powers=array_create(Powers.VampireLord, noone);

all_powers[Powers.AdrenalineRush]=newPower("Adrenaline Rush", -1, true, "Stamina regenerates ten times faster for 60 seconds.");
all_powers[Powers.BattleCry]=newPower("Battle Cry", -1, true, "Targets flee for 30 seconds.");

enum Abilities {
	no,
	AgentOfDibella,
	AgentOfMara,
	AncientKnowledge,
	AhzidalsGenius,
	BoethiasBlessing,
	Claws,
	ChampionOfTheNight,
	CompanionsInsight,
	DetectAshSource,
	DragonInfusion,
	DragonbornFlame,
	DragonbornForce,
	DragonbornFrost,
	EternalSpirit,
	TheFireWithin,
	ForceWithoutEffort,
	Highborn,
	ImperialLuck,
	LoversInsight,
	MagicResistance,
	NelothsHealthBoost,
	NelothsMemorySpell,
	NightingaleArmorFullSet,
	ProwlersProfit,
	ResistDisease,
	ResistDiseaseSuper,
	ResistDiseaseAndPoison,
	ResistFire,
	ResistFrost,
	ResistPoison,
	ResistPoisonSuper,
	SailorsRepose,
	ScholarsInsight,
	SeekerOfMight,
	SeekerOfShadows,
	SeekerOfSorcery,
	ShroudedArmorFullSet,
	SinderionsSerendipity,
	Surefoot,
	Waterbreathing,
	WeakenedSoul,
}

all_abilities=array_create(Abilities.WeakenedSoul, noone);