enum MagicClasses {
	no,
	alteration,
	conjouration,
	destruction,
	illusion,
	restoration,
	shout,
	powers,
	effects,
}

enum MagicLevels {
	novice,
	apprentice,
	adept,
	expert,
	master
}

enum MagicTargets {
	single,
	multiple,
	user
}

magic_class_names=array_create(MagicClasses.shout, "");

magic_class_names[MagicClasses.alteration]="Alteration";
magic_class_names[MagicClasses.conjouration]="Conjouration";
magic_class_names[MagicClasses.destruction]="Destruction";
magic_class_names[MagicClasses.illusion]="Illusion";
magic_class_names[MagicClasses.restoration]="Restoration";
magic_class_names[MagicClasses.shout]="Shouts";
magic_class_names[MagicClasses.powers]="Powers";
magic_class_names[MagicClasses.effects]="Active Effects";

magic_level_names=array_create(MagicLevels.master, "");

magic_level_names[MagicLevels.novice]="Novice";
magic_level_names[MagicLevels.apprentice]="Apprentice";
magic_level_names[MagicLevels.adept]="Adept";
magic_level_names[MagicLevels.expert]="Expert";
magic_level_names[MagicLevels.master]="Master";

enum MagicFlags {
	no,
	fire,
	ice,
	shock,
	sun,
	light,
	poison,
	misc,
}