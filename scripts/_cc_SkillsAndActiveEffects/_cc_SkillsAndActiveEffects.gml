function _cc_SkillsAndActiveEffects() {
	// Totally not stolen from Skyrim.
	enum Skills {
	    archery,
	    block,
	    heavy,
	    one_hand,
		smith,
	    two_hand,
    
	    alchemy,
	    light,
	    lock,
	    pick,
	    sneak,
	    speech,
    
	    alter,
	    conjour,
	    destruct,
	    enchant,
	    illusion,
	    restore
	}

	globalvar all_skills;

	all_skills=array_create(Skills.restore);
	all_skills[Skills.alchemy]=newSkill("Alchemy", "Doing chemistry at alchemy labs.", 0.75, 0, 1.6, 65, spr_skill_na);
	all_skills[Skills.alter]=newSkill("Alteration", "Changing the world around you.", 3, 0, 2, 0, spr_skill_na);
	all_skills[Skills.archery]=newSkill("Archery", "Shooting stuff with arrows.", 9.3, 0, 2, 0, spr_skill_na);
	all_skills[Skills.block]=newSkill("Block", "Defending against attacks.", 8.1, 0, 2, 0, spr_skill_na);
	all_skills[Skills.conjour]=newSkill("Conjouration", "Creating stuff.", 2.1, 0, 2, 0, spr_skill_na);
	all_skills[Skills.destruct]=newSkill("Destruction", "Wrecking stuff.", 1.35, 0, 2, 0, spr_skill_na);
	all_skills[Skills.enchant]=newSkill("Enchanting", "Making other things do magic for you.", 900, 0, 1, 170, spr_skill_na);
	all_skills[Skills.heavy]=newSkill("Heavy Armor", "Aptitude with metallic armor.", 3.8, 0, 2, 0, spr_skill_na);
	all_skills[Skills.illusion]=newSkill("Illusion", "Appearing to change the world around you, without actually doing so.", 4.6, 0, 2, 0, spr_skill_na);
	all_skills[Skills.light]=newSkill("Light Armor", "Aptitude with softer armor.", 4, 0, 2, 0, spr_skill_na);
	all_skills[Skills.lock]=newSkill("Lockpicking", "Aptitude for intrusion.", 45, 10, 0.25, 300, spr_skill_na);
	all_skills[Skills.one_hand]=newSkill("One-Handed", "Aptitude with smallish weapons.", 6.3, 0, 2, 0, spr_skill_na);
	all_skills[Skills.pick]=newSkill("Pickpocket", "Aptitude for stealing stuff.", 8.1, 0, 0.25, 250, spr_skill_na);
	all_skills[Skills.restore]=newSkill("Restoration", "Fixing stuff.", 2, 0, 2, 0, spr_skill_na);
	all_skills[Skills.smith]=newSkill("Smithing", "Crafting stuff at forges.", 1, 0, 0.25, 300, spr_skill_na);
	all_skills[Skills.sneak]=newSkill("Sneak", "Moving around without attracting attention.", 11.25, 0, 0.5, 120, spr_skill_na);
	all_skills[Skills.speech]=newSkill("Speech", "Your way with words.", 0.36, 0, 2, 0, spr_skill_na);
	all_skills[Skills.two_hand]=newSkill("Two-Handed", "Aptitude with biggish weapons.", 5.95, 0, 2, 0, spr_skill_na);

	enum AllEffects {
		no,
		// Alteration
		Armor,
		AshShell,
		DetectLife,
		DetectUndead,
		Light,
		Paralyze,
		Rune,
		Telekinesis,
		Transmute,
		Waterbreathing,
		Waterwalking,
		Candlelight,
		Magelight,
		Oakflesh,
		Ironflesh,
		// Conjouration
		Banish,
		BoundWeapon,
		Command,
		Conjour,
		FireySoulTrap,
		Reanimate,
		SoulTrap,
		// Destruction
		AbsorbHealth,
		AbsorbMagicka,
		AbsorbStamina,
		ChaosDamage,
		DamageHealth,
		DamageHealthRegen,
		DamageMagicka,
		DamageMagickaRegen,
		DamageStamina,
		DamageStaminaRegen,
		FireDamage,
		FrostDamage,
		HuntsmansProwess,
		LightDamage,
		PoisonDamage,
		ShockDamage,
		Slow,
		SpellAbsorption,
		SunDamage,
		WeaknessToFire,
		WeaknessToFrost,
		WeaknessToMagic,
		WeaknessToPoison,
		WeaknessToShock,
		WeaknessToLight,
		WeaknessToSun,
		WhirlwindCloak,
		// Illusion
		Clairvoyance,
		Fear,
		Frenzy,
		Invisibility,
		Muffle,
		Pacify,
		Rally,
		// Restoration
		CureDisease,
		CurePoison,
		RegenerateHealth,
		RegenerateMagicka,
		RegenerateStamina,
		RegenerateEtherealHealth,
		RegenerateEtherealMagicka,
		RegenerateEtherealStamina,
		ResistDisease,
		ResistFire,
		ResistFrost,
		ResistMagic,
		ResistPoison,
		ResistShock,
		ResistSun,
		ResistLight,
		RestoreHealth,
		RestoreHealthToUndead,
		RestoreMagicka,
		RestoreStamina,
		TurnUnead,
		Ward,
		// Fortify Skill
		FortifyAlchemy,
		FortifyAlteration,
		FortifyArchery,
		FortifyBarter,
		FortifyBarterOppositeSex,
		FortifyBlock,
		FortifyConjuration,
		FortifyDestruction,
		FortifyEnchanting,
		FortifyHeavyArmor,
		FortifyIllusion,
		FortifyVampireIllusion,
		FortifyLightArmor,
		FortifyLockpicking,
		FortifyOneHanded,
		FortifyPersuasion,
		FortifyPickpocket,
		FortifyRestoration,
		FortifySmithing,
		FortifySneak,
		FortifyTwoHanded,
		// Fortify Other
		FortifyBoundWeaponTime,
		FortifyCarryWeight,
		FortifyCombatSkills,
		FortifyHealingSpells,
		FortifyHealth,
		FortifyFireShout,
		FortifyGemFind,
		FortifyGoldFind,
		FortifyMagicka,
		FortifyMagicSkills,
		FortifYSkillBookPoints,
		FortifyShouts,
		FortifySpells,
		FortifyStamina,
		FortifyStealthSkills,
		FortifyStagger,
		FortifyUnarmed,
		ResistStagger,
		// Racial Combinations
		ArgonianBonus,
		BosmerBonus,
		// Other things
		DamageToOppositeSex,
		DamageToAlly,
		DetectAshSpawn,
		DamageFromDragonMelee,
		DamageToDragon,
		DragonbornFire,
		DragonbornForce,
		DragonbornFrost,
		DuplicatePotionOdds,
		FieldBurn,
		FieldPoison,
		last,
	}

	globalvar all_effects;

	all_effects=array_create(AllEffects.last, ["", ""]);

	all_effects[AllEffects.no]=newEffect("", "", 0, 1, Misc.multiplicative);
	all_effects[AllEffects.last]=all_effects[AllEffects.no];
	// Alteration
	all_effects[AllEffects.Armor]=newEffect("Fortify Armor", "Increase the user's armor rating by & points.", 0, 1, Misc.multiplicative);										// strength: number of armor points
	all_effects[AllEffects.AshShell]=newEffect("Ash Shell", "Encases the user in ash for & seconds preventing them from both attacking and being attacked.", false, true, Misc.additive);	// strength: duration
	all_effects[AllEffects.DetectLife]=newEffect("Detect Life", "Reveals living things nearby for & seconds. Probably unimplemented.", 0, 1, Misc.multiplicative);				// strength: duration of effect
	all_effects[AllEffects.DetectUndead]=newEffect("Detect Undead", "Reveals undead things nearby for & seconds. Probably unimplemented.", 0, 1, Misc.multiplicative);			// strength: duration of effect
	all_effects[AllEffects.Light]=newEffect("Light", "Creates a hovering ball of light that lasts for & seconds.", 0, 1, Misc.multiplicative);									// strength: duration of effect
	all_effects[AllEffects.Paralyze]=newEffect("Paralysis", "Paralyzes the target, making them unable to move for & seconds.", 0, 1, Misc.multiplicative);						// strength: duration of effect
	all_effects[AllEffects.Rune]=newEffect("Rune", "Places a rune on the ground. It goes off when it's stepped on.", 0, 1, Misc.multiplicative);								// strength: rune power
	all_effects[AllEffects.Telekinesis]=newEffect("Telekinesis", "Pick up an item from far away. Probably unimplemented.", false, true, Misc.additive);							// strength: true/false
	all_effects[AllEffects.Transmute]=newEffect("Transmute", "Transform iron ore into silver, and silver ore into gold.", false, true, Misc.additive);							// strength: true/false
	all_effects[AllEffects.Waterbreathing]=newEffect("Water Breathing", "Allows the user to breathe underwater for & seconds. Probably left unimplemented.", 0, 1, Misc.multiplicative);							// strength: duration of effect
	all_effects[AllEffects.Waterwalking]=newEffect("Water Walking", "Allows the user to walk on the surface of water.", false, true, Misc.additive,
			mo_waterwalking, MagicClasses.alteration, MagicLevels.adept, 150, MagicFlags.no, ml_waterwalking);			// strength: true/false
	all_effects[AllEffects.Candlelight]=newEffect("Candlelight", "Creates a glowy light spot that hovers with the player. It lasts for & seconds.", 0, 144, Misc.additive,
			mo_candlelight, MagicClasses.alteration, MagicLevels.novice, 21, MagicFlags.no, ml_candlelight);							// strength: duration of effect
	all_effects[AllEffects.Magelight]=newEffect("Magelight", "Creates a glowy light spot that sticks where it lands. It lasts & seconds.", 0, 200, Misc.additive,
			mo_magelight, MagicClasses.alteration, MagicLevels.apprentice, 84, MagicFlags.no, ml_magelight);							// strength: duration of effect
	all_effects[AllEffects.Oakflesh]=newEffect("Oakflesh", "Improves you Light Armor skill by & points for 60 seconds.", 0, 40, Misc.additive);									// strength: number of bonus points
		// novice level
	all_effects[AllEffects.Ironflesh]=newEffect("Ironflesh", "Improves your Heavy Armor skill by & points for 60 seconds.", 0, 40, Misc.additive);								// strength: number of bonus points
		// adept level
	// Conjouration
	all_effects[AllEffects.Banish]=newEffect("Banish", "Sends summoned Daedra up to level & back to Oblivion.", 0, 1, Misc.multiplicative,
		mo_banish, MagicClasses.conjouration, MagicLevels.adept, 6, MagicFlags.no, ml_banish);										// strength: max level
	all_effects[AllEffects.BoundWeapon]=newEffect("Bound Weapon", "Creates a bound weapon.", 0, 1, Misc.multiplicative);														// strength: weapon damage rating
	all_effects[AllEffects.Command]=newEffect("Command", "Summoned and rasied creatures up to level & are put under the user's control.", 0, 1, Misc.additive,
		mo_command, MagicClasses.conjouration, MagicLevels.novice, 30, MagicFlags.no, ml_command);			// strength: max level
	all_effects[AllEffects.Conjour]=newEffect("Conjour", "Counjours an ally up from nothingness.", 0, 1, Misc.additive,
		mo_conjour, MagicClasses.conjouration, MagicLevels.apprentice, 6, MagicFlags.no, ml_conjour);													// strength: summon level
	all_effects[AllEffects.FireySoulTrap]=newEffect("Firey Soul Trap", "Sets the target on fire, and soul traps them.", false, true, Misc.multiplicative);								// strength: amount of fire damage AND duration of soul trap effect
	all_effects[AllEffects.Reanimate]=newEffect("Reanimate", "Resurrects dead corpses up to level & to fight alongside the user.", false, true, Misc.multiplicative);					// strength: max level
	all_effects[AllEffects.SoulTrap]=newEffect("Soul Trap", "If the target dies, their soul is trapped in a Soul Gem.", false, true, Misc.additive,
		mo_soultrap, MagicClasses.conjouration, MagicLevels.apprentice, 100, MagicFlags.no, ml_soultrap);								// strength: duration of effect
	// Destruction
	all_effects[AllEffects.AbsorbHealth]=newEffect("Absorb Health", "The user absorbs & points of health from the target.", 0, 20, Misc.multiplicative,
			mo_absorb_health, MagicClasses.destruction, MagicLevels.adept, 15/*0*/, MagicFlags.no, ml_absorb_health);							// strength: amount stolen
	all_effects[AllEffects.AbsorbMagicka]=newEffect("Absorb Magicka", "The user absorbs & points of magicka from the target.", 0, 20, Misc.multiplicative,
			mo_absorb_magicka, MagicClasses.destruction, MagicLevels.adept, 15/*0*/, MagicFlags.no, ml_absorb_magicka);						// strength: amount stolen
	all_effects[AllEffects.AbsorbStamina]=newEffect("Absorb Stamina", "The user absorbs & points of stamina from the target.", 0, 20, Misc.multiplicative,
			mo_absorb_stamina, MagicClasses.destruction, MagicLevels.adept, 15/*0*/, MagicFlags.no, ml_absorb_stamina);						// strength: amount stolen
	all_effects[AllEffects.ChaosDamage]=newEffect("Chaos Damage", "Can deal fire, ice and shock damage to the target. All at the same time.", 0, 1, Misc.multiplicative,
			mo_chaos, MagicClasses.destruction, MagicLevels.master, 20/*0*/, MagicFlags.no, ml_chaos);			// strength: points of damage
	all_effects[AllEffects.DamageHealth]=newEffect("Damage Health", "Deals extra damage to the target's health.", 0, 1, Misc.multiplicative);									// strength: points of damage
	all_effects[AllEffects.DamageHealthRegen]=newEffect("Damage Health Regen", "Decreases the target's health regeneration rate by & X.", 0, 1, Misc.multiplicative);			// strength: percent
	all_effects[AllEffects.DamageMagicka]=newEffect("Damage Magicka", "Deals damage to the target's magicka.", 0, 1, Misc.multiplicative);										// strength: points of damage
	all_effects[AllEffects.DamageMagickaRegen]=newEffect("Damage Magicka Regen", "Decreases the target's magicka regeneration rate by & X.", 0, 1, Misc.multiplicative);		// strength: percent
	all_effects[AllEffects.DamageStamina]=newEffect("Damage Stamina", "Deals damage to the target's stamina.", 0, 1, Misc.multiplicative);										// strength: points of damage
	all_effects[AllEffects.DamageStaminaRegen]=newEffect("Damage Stamina Regen", "Decreases the target's stamina regeneration rate by & X", 0, 1, Misc.multiplicative);			// strength: percent
	all_effects[AllEffects.FireDamage]=newEffect("Fire Damage", "Deals & points of fire damage to the target.", 0, 20, Misc.multiplicative,
			mo_fire, MagicClasses.destruction, MagicLevels.novice, 14, MagicFlags.fire);							// strength: points of damage
	all_effects[AllEffects.FrostDamage]=newEffect("Frost Damage", "Deals & points of frost damage to the target.", 0, 20, Misc.multiplicative,
			mo_ice, MagicClasses.destruction, MagicLevels.novice, 14, MagicFlags.ice);							// strength: points of damage
	all_effects[AllEffects.HuntsmansProwess]=newEffect("Huntsman's Prowess", "Deals extra damage to animals.", 0, 1, Misc.multiplicative);										// strength: points of damage
	all_effects[AllEffects.LightDamage]=newEffect("Light Damage", "Deals & points of light damage to the target.", 0, 1, Misc.multiplicative);									// strength: points of damage
	all_effects[AllEffects.PoisonDamage]=newEffect("Poison Damage", "Deals & points of poison damage to the target.", 0, 1, Misc.multiplicative);								// strength: points of damage
	all_effects[AllEffects.ShockDamage]=newEffect("Shock Damage", "Deals & points of shock damage to the target.", 0, 20, Misc.multiplicative,
			mo_spark, MagicClasses.destruction, MagicLevels.novice, 14, MagicFlags.shock);						// strength: points of damge
	all_effects[AllEffects.Slow]=newEffect("Slow", "Causes the target to move more slowly for & seconds.", 0, 1, Misc.multiplicative);											// strength: duration of effect
	all_effects[AllEffects.SpellAbsorption]=newEffect("Spell Absorption", "Allows the user to absorb magicka from incoming spells.", 0, 1, Misc.multiplicative);				// strength: percent absorbed
	all_effects[AllEffects.SunDamage]=newEffect("Sun Damage", "Deals & points of sun damage to the target.", 0, 1, Misc.multiplicative);										// strength: points of damage
	all_effects[AllEffects.WeaknessToFire]=newEffect("Weakness to Fire", "Increases the target's weakness to fire by & X.", 1, 0, Misc.multiplicative);							// strength: percentage weaker
	all_effects[AllEffects.WeaknessToFrost]=newEffect("Weakness to Frost", "Increases the target's weakness to frost by & X.", 1, 0, Misc.multiplicative);						// strength: percentage weaker
	all_effects[AllEffects.WeaknessToMagic]=newEffect("Weakness to Magic", "Increases the target's weakness to magic by & X.", 1, 0, Misc.multiplicative);						// strength: percentage weaker
	all_effects[AllEffects.WeaknessToPoison]=newEffect("Weakness to Poison", "Increases the target's weakness to poison by & X.", 1, 0, Misc.multiplicative);					// strength: percentage weaker
	all_effects[AllEffects.WeaknessToShock]=newEffect("Weakness to Shock", "Increases the target's weakness to shock by & X.", 1, 0, Misc.multiplicative);						// strength: percentage weaker
	all_effects[AllEffects.WeaknessToLight]=newEffect("Weakness to Light", "Increases the target's weakness to light by & X.", 1, 0, Misc.multiplicative);						// strength: percentage weaker
	all_effects[AllEffects.WeaknessToSun]=newEffect("Weakness to Sun", "Increases the target's weakness to sun by & X.", 1, 0, Misc.multiplicative);							// strength: percentage weaker
	all_effects[AllEffects.WhirlwindCloak]=newEffect("Whirlwind Cloak", "Creates a whilrwind around the user.", 0, 1, Misc.multiplicative);										// strength: duration of effect
	// Illusion
	all_effects[AllEffects.Clairvoyance]=newEffect("Clairvoyance", "Shows the path towards the current goal. Probably left unimplemented.", 0, 1, Misc.multiplicative);			// strength: duration of effect
	all_effects[AllEffects.Fear]=newEffect("Fear", "Causes targets up to level & to run in fear.", 0, 1, Misc.multiplicative);													// strength: max level
	all_effects[AllEffects.Frenzy]=newEffect("Frenzy", "Causes targets up to level & to attack anyone and everyone.", 0, 1, Misc.multiplicative);								// strength: max level
	all_effects[AllEffects.Invisibility]=newEffect("Invisibility", "Makes the caster invisible for & seconds.", 0, 1, Misc.multiplicative);										// strength: duration of effect
	all_effects[AllEffects.Muffle]=newEffect("Muffle", "Eliminates noise from your armor while sneaking around.", 0, 1, Misc.multiplicative);									// strength: muffle factor (0 is none, 1 is all)
	all_effects[AllEffects.Pacify]=newEffect("Pacify", "Causes targets up to level & to lose their will to fight.", 0, 1, Misc.multiplicative);									// strength: max level
	all_effects[AllEffects.Rally]=newEffect("Rally", "Energizes the user's allies.", 0, 1, Misc.multiplicative);																	// strength: duration of effect
	// Restoration
	all_effects[AllEffects.CureDisease]=newEffect("Cure Disease", "Cures disease.", false, true, Misc.additive);															// strength: true/false
	all_effects[AllEffects.CurePoison]=newEffect("Cure Poison", "Cures poison.", false, true, Misc.additive);																// strength: true/false
	all_effects[AllEffects.RegenerateHealth]=newEffect("Regenerate Health", "Increases the regeneration rate of health by & X.", 0, 1, Misc.multiplicative);						// strength: percentage increased
	all_effects[AllEffects.RegenerateMagicka]=newEffect("Regenerate Magicka", "Increases the regeneration rate of magicka by & X.", 0, 1, Misc.multiplicative);					// strength: percentage increased
	all_effects[AllEffects.RegenerateStamina]=newEffect("Regenerate Stamina", "Increase the regeneration rate of stamina by & X.", 0, 1, Misc.multiplicative);					// strength: percentage increased
	all_effects[AllEffects.RegenerateEtherealHealth]=newEffect("Regenerate Ethereal Health", "Increases the regeneration rate of health while the user is in an ethereal state by & X.", 0, 1, Misc.multiplicative);	// strength: percentage increased
	all_effects[AllEffects.RegenerateEtherealMagicka]=newEffect("Regenerate Ethereal Magicka", "Increases the regeneration rate of magicka while the user is in an ethereal state by & X.", 0, 1, Misc.multiplicative);	// strength: percentage increased
	all_effects[AllEffects.RegenerateEtherealStamina]=newEffect("Regenerate Ethereal Stamina", "Increases the regeneration rate of stamina while the user is in an ethereal state by & X.", 0, 1, Misc.multiplicative);	// strength: percentage increased
	all_effects[AllEffects.ResistDisease]=newEffect("Resist Disease", "Increases resistance to disease by & X.", 1, 0, Misc.multiplicative);										// strength: percentage increased
	all_effects[AllEffects.ResistFire]=newEffect("Resist Fire", "Increases resistance to fire by & X.", 1, 0, Misc.multiplicative);												// strength: percentage incresed
	all_effects[AllEffects.ResistFrost]=newEffect("Resist Frost", "Increases resistance to frost by & X.", 1, 0, Misc.multiplicative);											// strength: percentage increased
	all_effects[AllEffects.ResistMagic]=newEffect("Resist Magic", "Increases resistance to magic by & X.", 1, 0, Misc.multiplicative);											// strength: percentage increased
	all_effects[AllEffects.ResistPoison]=newEffect("Resist Poison", "Increases the resistance to poison by & X.", 1, 0, Misc.multiplicative);										// strength: percentage increased
	all_effects[AllEffects.ResistShock]=newEffect("Resist Shock", "Increases resistance to shock by & X", 1, 0, Misc.multiplicative);												// strength: percentage increased
	all_effects[AllEffects.ResistLight]=newEffect("Resist Light", "Increases the resistance to light by & X.", 1, 0, Misc.multiplicative);										// strength: percentage increased
	all_effects[AllEffects.ResistSun]=newEffect("Resist Sun", "Increases resistance to sun by & X", 1, 0, Misc.multiplicative);													// strength: percentage increased
	all_effects[AllEffects.RestoreHealth]=newEffect("Restore Health", "Restores & points of health.", 0, 1, Misc.multiplicative);												// strength: points of restoration
	all_effects[AllEffects.RestoreHealthToUndead]=newEffect("Restore Health To Undead", "Restores & poitns of health to the undead.", 0, 1, Misc.multiplicative);				// strength: points of restoration
	all_effects[AllEffects.RestoreMagicka]=newEffect("Restore Magicka", "Restores & points of magicka.", 0, 1, Misc.multiplicative);												// strength: points of restoration
	all_effects[AllEffects.RestoreStamina]=newEffect("Restore Stamina", "Restores & points of stamina.", 0, 1, Misc.multiplicative);												// strength: points of restoration
	all_effects[AllEffects.TurnUnead]=newEffect("Turn Undead", "Causes undead up to level & to flee.", 0, 1, Misc.multiplicative);												// strength: max level
	all_effects[AllEffects.Ward]=newEffect("Ward", "Nullifies up to & points of damage from magic.", 0, 1, Misc.multiplicative);													// strength: armor rating raised AND points of magic absorbed
	// Fortify Skill
	all_effects[AllEffects.FortifyAlchemy]=newEffect("Fortify Alchemy", "Increases the Alchemy skill by & X.", 0, 1, Misc.multiplicative);										// strength: Percentage increased
	all_effects[AllEffects.FortifyAlteration]=newEffect("Fortify Alteration", "Increases the Alteration skill by & X.", 0, 1, Misc.multiplicative);								// strength: Percentage increased
	all_effects[AllEffects.FortifyArchery]=newEffect("Fortify Archery", "Increases the Archery skill by & X.", 0, 1, Misc.multiplicative);										// strength: Percentage increased
	all_effects[AllEffects.FortifyBarter]=newEffect("Fortify Barter", "Increases the Speech skill by & X.", 0, 1, Misc.multiplicative);											// strength: Percentage increased
	all_effects[AllEffects.FortifyBarterOppositeSex]=newEffect("Fortify Barter (Opposite Sex)", "Increases the Speech skill by & X when dealing with members of the opposite sex.", 0.0, 1.0, Misc.multiplicative);	// strength: Percentage increased
	all_effects[AllEffects.FortifyBlock]=newEffect("Fortify Block", "Increases the Block skill by & X.", 0, 1, Misc.multiplicative);												// strength: Percentage increased
	all_effects[AllEffects.FortifyConjuration]=newEffect("Fortify Conjouration", "Increases the Conjouration skill by & X.", 0, 1, Misc.multiplicative);							// strength: Percentage increased
	all_effects[AllEffects.FortifyDestruction]=newEffect("Fortify Destruction", "Increases the Destruction skill by & X.", 0, 1, Misc.multiplicative);							// strength: Percentage increased
	all_effects[AllEffects.FortifyEnchanting]=newEffect("Fortify Enchanting", "Increases the Enchanting skill by & X.", 0, 1, Misc.multiplicative);								// strength: Percentage increased
	all_effects[AllEffects.FortifyHeavyArmor]=newEffect("Fortify Heavy Armor", "Increases the Heavy Armor skill by & X.", 0, 1, Misc.multiplicative);								// strength: Percentage increased
	all_effects[AllEffects.FortifyIllusion]=newEffect("Fortify Illusion", "Increases the Illusion skill by & X.", 0, 1, Misc.multiplicative);										// strength: Percentage increased
	all_effects[AllEffects.FortifyVampireIllusion]=newEffect("Fortify Illusion (Vampire)", "Increases the Illusion skill when in Vampire form by & X.", 0, 1, Misc.multiplicative);								// strength: Percentage increased
	all_effects[AllEffects.FortifyLightArmor]=newEffect("Fortify Light Armor", "Increases the Light Armor skill by & X.", 0, 1, Misc.multiplicative);								// strength: Percentage increased
	all_effects[AllEffects.FortifyLockpicking]=newEffect("Fortify Lockpicking", "Increases the Lockpicking skill by & X.", 0, 1, Misc.multiplicative);							// strength: Percentage increased
	all_effects[AllEffects.FortifyOneHanded]=newEffect("Fortify One-Handed", "Increases the One Handed skill by & X.", 0, 1, Misc.multiplicative);								// strength: Percentage increased
	all_effects[AllEffects.FortifyPersuasion]=newEffect("Fortify Persuasion", "Increases the odds of successfully persuading someone by & X.", 0, 1, Misc.multiplicative);		// strength: Percentage increased
	all_effects[AllEffects.FortifyPickpocket]=newEffect("Fortify Pickpocket", "Increases the Pickpocket skill by & X.", 0, 1, Misc.multiplicative);								// strength: Percentage increased
	all_effects[AllEffects.FortifyRestoration]=newEffect("Fortify Restoration", "Increases the Restoration skill by & X.", 0, 1, Misc.multiplicative);							// strength: Percentage increased
	all_effects[AllEffects.FortifySmithing]=newEffect("Fortify Smithing", "Increases the Smithing skill by & X.", 0, 1, Misc.multiplicative);										// strength: Percentage increased
	all_effects[AllEffects.FortifySneak]=newEffect("Fortify Sneak", "Increases the Sneak skill by & X.", 0, 1, Misc.multiplicative);												// strength: Percentage increased
	all_effects[AllEffects.FortifyTwoHanded]=newEffect("Fortify Two-Handed", "Increases the Two Handed skill by & X.", 0, 1, Misc.multiplicative);								// strength: Percentage increased
	// Fortify Other
	all_effects[AllEffects.FortifyBoundWeaponTime]=newEffect("Fortify Bound Weapon Time", "Increases the amount of time bound weapons will last by & seconds.", 0, 1, Misc.multiplicative);					// strength: time of conjouration
	all_effects[AllEffects.FortifyCarryWeight]=newEffect("Fortify Carry Weight", "Increases the amount of stuff the user can carry by & points.", 0, 1, Misc.multiplicative);	// strength: points of carry weight
	all_effects[AllEffects.FortifyCombatSkills]=newEffect("Fortify Combat Skills", "Increases the user's combat skills by & percent.", 0, 1, Misc.multiplicative);				// strength: percentage increased
	all_effects[AllEffects.FortifyHealingSpells]=newEffect("Fortify Healing Spells", "Increases the power of the user's healing spells by & percent.", 0, 1, Misc.multiplicative);								// strength: Percentage increased
	all_effects[AllEffects.FortifyHealth]=newEffect("Fortify Health", "Increases the user's health by & points.", 0, 1, Misc.multiplicative);									// strength: points of health
	all_effects[AllEffects.FortifyFireShout]=newEffect("Fortify Fire Shout", "Increases the power of the user's Fire Shout by & X.", 0, 1, Misc.multiplicative);					// strength: Percentage increased
	all_effects[AllEffects.FortifyGemFind]=newEffect("Fortify Gem Finding", "Increases the amount of gems the user may find in a container.", 0, 1, Misc.multiplicative);		// strength: Percentage increased
	all_effects[AllEffects.FortifyGoldFind]=newEffect("Fortify Gold Finding", "Increases the amount of gold the user may find in a container.", 0, 1, Misc.multiplicative);		// strength: Percentage increased
	all_effects[AllEffects.FortifyMagicka]=newEffect("Fortify magicka", "Increases the user's magicka by & points.", 0, 1, Misc.multiplicative);									// strength: points of magicka
	all_effects[AllEffects.FortifyMagicSkills]=newEffect("Fortify Magic Skills", "Increase the power of the user's magic skills by & X.", 0, 1, Misc.multiplicative);				// strength: Percentage increased
	all_effects[AllEffects.FortifYSkillBookPoints]=newEffect("Fortify Skill Book Points", "Increases the number of Skill Points you may recieve from reading Skill Books.", 0, 1, Misc.multiplicative);		// strength: number of skill points
	all_effects[AllEffects.FortifyShouts]=newEffect("Fortify Shouts", "Decreases the cooldown time for Shouts by & X.", 0, 1, Misc.multiplicative);								// strength: Percentage decreased
	all_effects[AllEffects.FortifySpells]=newEffect("Fortify Spells", "Decreases the cost to casting spells by & X.", 0, 1, Misc.multiplicative);									// strength: Percentage decreased
	all_effects[AllEffects.FortifyStamina]=newEffect("Fortify Stamina", "Increases the user's stamina by & points.", 0, 1, Misc.multiplicative);									// strength: points of stamina
	all_effects[AllEffects.FortifyStealthSkills]=newEffect("Fortify Stealth Skills", "Increases the user's stealth skills by & X.", 0, 1, Misc.multiplicative);					// strength: Percentage increased
	all_effects[AllEffects.FortifyStagger]=newEffect("Fortify Stagger", "Increases the odds of the user staggering the opponent by & X.", 0, 1, Misc.multiplicative);				// strength: Percentage increased
	all_effects[AllEffects.FortifyUnarmed]=newEffect("Fortify Unarmed Combat", "Increases the amount of unarmed damage dealt by & X.", 0, 1, Misc.multiplicative);				// strength: Percentage increased
	all_effects[AllEffects.ResistStagger]=newEffect("Resist Stagger", "Decreases teh odds of the user beings staggered by & X.", 0, 1, Misc.multiplicative);						// strength: Percentage increased
	// Racial things
	all_effects[AllEffects.ArgonianBonus]=newEffect("Be an Argonian", "& X resistance to disease. Can walk on water. & X higher Unarmed damage.", 0, 1, Misc.multiplicative);		// strength: percentage resisted AND percentage increased
	all_effects[AllEffects.BosmerBonus]=newEffect("Be a Bosmer", "& X resistance to disease and poison.", 0, 1, Misc.multiplicative);											// strength: percentage resisted
	// Other things (I like how almost all of them start with a D)
	all_effects[AllEffects.DamageToOppositeSex]=newEffect("Damage to Opposite Sex", "Increases damage dealt to members of the opposite sex by & X.", 0, 1, Misc.multiplicative);	// strength: percentage increased
	all_effects[AllEffects.DamageToAlly]=newEffect("Damage to Ally", "Decreases the amount of damage dealt to the user's allies by & X.", 0, 1, Misc.multiplicative);				// strength: percentage decreased
	all_effects[AllEffects.DetectAshSpawn]=newEffect("Detect Ash Spawn", "Allows the user to detect ash spawn sources. Probably not going to be implemented.", 0, 1, Misc.multiplicative);						// strength: duration of effect
	all_effects[AllEffects.DamageFromDragonMelee]=newEffect("Damage From Dragon Melee", "Decreases the amount of damage taken from dragon melee attacks by & X.", 0, 1, Misc.multiplicative);					// strength: scale factor
	all_effects[AllEffects.DamageToDragon]=newEffect("Damage to Dragon", "Does & X extra damage to dragons.", 0, 1, Misc.multiplicative);											// strength: scale factor
	all_effects[AllEffects.DragonbornFire]=newEffect("Dragonborn Fire", "When killing something with your Fire Shout, summon a fire wraith to fight alongside you.", 0, 1, Misc.multiplicative);				// strength: duration of summon
	all_effects[AllEffects.DragonbornForce]=newEffect("Dragonborn Force", "Unrelenting Force Shout may disintegrate its targets.", 0, 1, Misc.multiplicative);					// strength: chance of disintegration
	all_effects[AllEffects.DragonbornFrost]=newEffect("Dragonborn Frost", "Targets of your Frost Shout are frozen solid.", 0, 1, Misc.multiplicative);							// strength: duration of freeze
	all_effects[AllEffects.DuplicatePotionOdds]=newEffect("Duplicate Potions", "When making potions, you may occasionally create a duplicate one.", 0, 1, Misc.multiplicative);	// strength: chance of duplicate potions
	all_effects[AllEffects.FieldBurn]=newEffect("Burn", "You take & points of damage per second.", 0, 1, Misc.additive);													// strength: points of damage per second
	all_effects[AllEffects.FieldPoison]=newEffect("Poison", "You take & points of damage per second.", 0, 1, Misc.additive);													// strength: points of damage per second


}
