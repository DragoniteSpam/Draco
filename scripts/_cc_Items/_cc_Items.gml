// Item/inventory settings.

enum Items {
    no,
	// Weapons
	iron_sword,
	steel_sword,
	imperial_sword,
	dwarven_sword,
	orcish_sword,
	// Apparel
    // Potions
    // Books
	stFlames,
	stSparks,
	stFrostbite,
	stOakflesh,
	stCandlelight,
	stMagelight,
	stWaterWalking,
    // Food
	fBeer,
    // Keys
    // Crafting
    // Alchemy
    // Enchanting
	// Misc
    eraser,
	gold,
	last,
}

var ND="No Description.";

all_items=array_create(Items.last, noone);

all_items[Items.no]=newItem("", "", 0, 0, ItemClasses.misc, ItemChuckStatus.no, 0, null,  spr_item_default, 0);

// Weapons

all_items[Items.iron_sword]=newItem("Iron Sword", "A basic iron sword. Does the job but quickly outclassed by other things.", 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 10, use_equip_one_hand, spr_item_default, 0, ItemEquipClasses.onehand, ItemHardwareClasses.iron);
all_items[Items.steel_sword]=newItem("Steel Sword", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 15, use_equip_one_hand, spr_item_default, 0, ItemEquipClasses.onehand, ItemHardwareClasses.steel);
all_items[Items.imperial_sword]=newItem("Imperial Sword", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 15, use_equip_one_hand, spr_item_default, 0, ItemEquipClasses.onehand, ItemHardwareClasses.imperial);
all_items[Items.dwarven_sword]=newItem("Dwarven Sword", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 20, use_equip_one_hand, spr_item_default, 0, ItemEquipClasses.onehand, ItemHardwareClasses.dwarven);
all_items[Items.orcish_sword]=newItem("Orcish Sword", ND, 25, 10, ItemClasses.weapon, ItemChuckStatus.no, 20, use_equip_one_hand, spr_item_default, 0, ItemEquipClasses.onehand, ItemHardwareClasses.orcish);

// Apparel
// Potions
// Books
all_items[Items.stMagelight]=newItem("Spell Tome: Magelight", "Contains information on the Magelight spell.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, Magic.magelight);
all_items[Items.stCandlelight]=newItem("Spell Tome: Candlelight", "Contains information on the Candlelight spell.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, Magic.candlelight);
all_items[Items.stSparks]=newItem("Spell Tome: Sparks", "Contains information on basic shock mafic.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, Magic.sparks);
all_items[Items.stFlames]=newItem("Spell Tome: Flames", "Contains information on basic fire mafic.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, Magic.flames);
all_items[Items.stFrostbite]=newItem("Spell Tome: Frostbite", "Contains information on basic ice mafic.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, Magic.frostbite);
all_items[Items.stOakflesh]=newItem("Spell Tome: Oakflesh", "Contains information on the Oakflesh spell.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, Magic.oakflesh);
all_items[Items.stWaterWalking]=newItem("Spell Tome: Water Walking", "Contains information on the Water Walking spell.", 50, 1, ItemClasses.book, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, Magic.waterwalking);

// Food

all_items[Items.fBeer]=newItem("Beer", "Restores 30 points of Stamina.", 5, 1, ItemClasses.food, ItemChuckStatus.no, 0, use_spell_tome, spr_item_default, 0);

// Keys
// Crafting
// Alchemy
// Enchanting
// Misc

all_items[Items.eraser]=newItem("Eraser", "Good for doing math but useless in an RPG.", 5, 0.2, ItemClasses.misc, ItemChuckStatus.no, 0, null, spr_item_default, 0);
all_items[Items.gold]=newItem("Gold", "A boring yellow metal that people attribute value to, for some reason.", 1, 0, ItemClasses.misc, ItemChuckStatus.no, 0, null, spr_item_gold, 0);