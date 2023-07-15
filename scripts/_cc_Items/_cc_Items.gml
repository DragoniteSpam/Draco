function _cc_Items() {
	// Item/inventory settings.

	enum Items {
	    no,
		// Weapons
		long_bow,
		iron_arrows,
		iron_sword,
		steel_dagger,
		steel_sword,
		imperial_sword,
		dwarven_sword,
		dwarven_greatsword,
		orcish_sword,
		// Apparel
		leather_armor,
		leather_boots,
		leather_bracers,
	    // Potions
	    // Books
		stFlames,
		stSparks,
		stFrostbite,
		stOakflesh,
		stIronflesh,
		stCandlelight,
		stMagelight,
		stWaterWalking,
	    // Food
		fBeer,
	    // Keys
	    // Crafting
	    // Alchemy
		aDaedraHeart,
	    // Enchanting
		// Misc
	    eraser,
		gold,
		lockpick,
		last,
	}

	var ND="No Description.";

	globalvar all_items;

	all_items=array_create(Items.last, noone);

	all_items[Items.no]=newItem("", "", 0, 0, ItemClasses.misc, ItemChuckStatus.no, 0, null,  spr_item_default, 0);

	// Weapons

	all_items[Items.long_bow]=newItem("Long Bow", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 20, use_equip_two_hand, spr_item_default, 0, ItemEquipClasses.bow, ItemHardwareClasses.hide);
	all_items[Items.iron_arrows]=newItem("Iron Arrows", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 20, null, spr_item_default, 0, ItemEquipClasses.arrow, ItemHardwareClasses.iron);
	all_items[Items.iron_sword]=newItem("Iron Sword", "A basic iron sword. Does the job but quickly outclassed by other things.", 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 10, use_equip_one_hand, spr_item_default, 0, ItemEquipClasses.onehand, ItemHardwareClasses.iron);
	all_items[Items.steel_dagger]=newItem("Steel Dagger", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 20, use_equip_one_hand, spr_item_default, 0, ItemEquipClasses.onehand, ItemHardwareClasses.orcish);
	all_items[Items.steel_sword]=newItem("Steel Sword", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 15, use_equip_one_hand, spr_item_default, 0, ItemEquipClasses.onehand, ItemHardwareClasses.steel);
	all_items[Items.imperial_sword]=newItem("Imperial Sword", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 15, use_equip_one_hand, spr_item_default, 0, ItemEquipClasses.onehand, ItemHardwareClasses.imperial);
	all_items[Items.dwarven_sword]=newItem("Dwarven Sword", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 20, use_equip_one_hand, spr_item_default, 0, ItemEquipClasses.onehand, ItemHardwareClasses.dwarven);
	all_items[Items.dwarven_greatsword]=newItem("Dwarven Greatsword", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 20, use_equip_two_hand, spr_item_default, 0, ItemEquipClasses.twohand, ItemHardwareClasses.dwarven);
	all_items[Items.orcish_sword]=newItem("Orcish Sword", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 20, use_equip_one_hand, spr_item_default, 0, ItemEquipClasses.onehand, ItemHardwareClasses.orcish);
	// Apparel
	all_items[Items.leather_armor]=newItem("Leather Armor", ND, 25, 10, ItemClasses.apparel, ItemChuckStatus.no, 20, use_equip_body, spr_item_default, 0, ItemEquipClasses.body, ItemHardwareClasses.leather);
	all_items[Items.leather_boots]=newItem("Leather Boots", ND, 25, 10, ItemClasses.apparel, ItemChuckStatus.no, 20, use_equip_feet, spr_item_default, 0, ItemEquipClasses.body, ItemHardwareClasses.leather);
	all_items[Items.leather_bracers]=newItem("Leather Bracers", ND, 25, 10, ItemClasses.apparel, ItemChuckStatus.no, 20, use_equip_hands, spr_item_default, 0, ItemEquipClasses.body, ItemHardwareClasses.leather);
	// Potions
	// Books
	all_items[Items.stMagelight]=newItem("Spell Tome: Magelight", "Contains information on the Magelight spell.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, AllEffects.Magelight);
	all_items[Items.stCandlelight]=newItem("Spell Tome: Candlelight", "Contains information on the Candlelight spell.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, AllEffects.Candlelight);
	all_items[Items.stSparks]=newItem("Spell Tome: Sparks", "Contains information on basic shock mafic.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, AllEffects.ShockDamage);
	all_items[Items.stFlames]=newItem("Spell Tome: Flames", "Contains information on basic fire mafic.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, AllEffects.FireDamage);
	all_items[Items.stFrostbite]=newItem("Spell Tome: Frostbite", "Contains information on basic ice mafic.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, AllEffects.FrostDamage);
	all_items[Items.stOakflesh]=newItem("Spell Tome: Oakflesh", "Contains information on the Oakflesh spell.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, AllEffects.FortifyLightArmor);
	all_items[Items.stIronflesh]=newItem("Spell Tome: Ironflesh", "Contains information on the Ironflesh spell.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, AllEffects.FortifyHeavyArmor);
	all_items[Items.stWaterWalking]=newItem("Spell Tome: Water Walking", "Contains information on the Water Walking spell.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, AllEffects.Waterwalking);

	// Food

	all_items[Items.fBeer]=newItem("Beer", "Restores 30 points of Stamina.", 5, 1, ItemClasses.food, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, 0);

	// Keys
	// Crafting
	// Alchemy

	all_items[Items.aDaedraHeart]=newItem("Daedra Heart", "The heart of a Daedra.", 100, 1, ItemClasses.alchemy, ItemChuckStatus.no, 0, null, spr_item_default, 0);

	// Enchanting
	// Misc

	all_items[Items.eraser]=newItem("Eraser", "Good for doing math but useless in an RPG.", 5, 0.2, ItemClasses.misc, ItemChuckStatus.no, 0, null, spr_item_default, 0);
	all_items[Items.gold]=newItem("Gold", "A boring yellow metal that people attribute value to, for some reason.", 1, 0, ItemClasses.misc, ItemChuckStatus.no, 0, null, spr_item_gold, 0);
	all_items[Items.lockpick]=newItem("Lockpick", "It's for picking locks.", 1, 0, ItemClasses.misc, ItemChuckStatus.no, 0, null, spr_item_default, 0);


}
