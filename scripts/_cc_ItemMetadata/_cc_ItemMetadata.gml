function _cc_ItemMetadata() {
	enum ItemClasses {
		no,
	    weapon,
	    apparel,
	    potion,
	    book,
	    food,
	    key,
	    crafting,
	    alchemy,
	    enchanting,
	    misc
	}

	item_class_names=array_create(ItemClasses.misc, "");
	item_class_names[ItemClasses.weapon]="Weapons";
	item_class_names[ItemClasses.apparel]="Apparel";
	item_class_names[ItemClasses.potion]="Potions";
	item_class_names[ItemClasses.book]="Books";
	item_class_names[ItemClasses.food]="Food";
	item_class_names[ItemClasses.key]="Keys";
	item_class_names[ItemClasses.crafting]="Crafting";
	item_class_names[ItemClasses.alchemy]="Ingredients";
	item_class_names[ItemClasses.enchanting]="Enchanting";
	item_class_names[ItemClasses.misc]="Misc.";

	enum ItemEquipClasses {
	    no,
	    head,
	    body,
	    hands,
	    shoes,
	    ring,
	    onehand,
	    twohand,
		bow,
		shield,
		arrow,
	}

	enum ItemHardwareClasses {
	    no,
	    leather,
	    hide,
	    iron,
	    steel,
	    imperial,
	    dwarven,
	    elven,
	    glass,
	    orcish,
	    stahlrim,
	    dragon,
	    netch,
	    studded,
	    daedric,
	    misc
	}

	item_hardware_class_names=array_create(ItemHardwareClasses.misc, "");
	item_hardware_class_names[ItemHardwareClasses.no]="N/A";
	item_hardware_class_names[ItemHardwareClasses.leather]="Leather";
	item_hardware_class_names[ItemHardwareClasses.hide]="Hide";
	item_hardware_class_names[ItemHardwareClasses.iron]="Iron";
	item_hardware_class_names[ItemHardwareClasses.steel]="Steel";
	item_hardware_class_names[ItemHardwareClasses.imperial]="Imperial";
	item_hardware_class_names[ItemHardwareClasses.dwarven]="Dwarven";
	item_hardware_class_names[ItemHardwareClasses.elven]="Elven";
	item_hardware_class_names[ItemHardwareClasses.glass]="Glass";
	item_hardware_class_names[ItemHardwareClasses.orcish]="Orcish";
	item_hardware_class_names[ItemHardwareClasses.stahlrim]="Stahlrim";
	item_hardware_class_names[ItemHardwareClasses.dragon]="Dragon";
	item_hardware_class_names[ItemHardwareClasses.netch]="Netch";
	item_hardware_class_names[ItemHardwareClasses.studded]="Studded";
	item_hardware_class_names[ItemHardwareClasses.daedric]="Daedric";
	item_hardware_class_names[ItemHardwareClasses.misc]="Misc.";

	enum ItemArmorTypes {
		light,
		heavy,
	}

	enum ItemChuckStatus{
		no,
		quest,
		key,
	}

	item_chuck_status[ItemChuckStatus.no]="";
	item_chuck_status[ItemChuckStatus.quest]="Quest items can't be removed from your inventory.";
	item_chuck_status[ItemChuckStatus.key]="Keys can't be removed from your inventory.";


}
