function _cc_PauseMenu() {
	// Creating some pause menu things.
	enum PauseMenu {
	    rose,
	    inventory,
		skills,
		magic,
		map,
		journal,
		system,
		stats,
		options,
		wait,
	}

	enum PauseEndActions {
		ReturnToRose,
		ReturnToGame,
		ReturnFromSleep,
		ReturnFromWait,
		ReturnToGameNoContinue,
	}

	enum PauseInventoryScreens {
		base,
		contents,
		quantity_transaction,
		quantity_toss,
		poison,
	}

	enum PauseMagicScreens {
		base,
		contents,
		unlock,
		cantunlock,
		cantuse,
	}

	enum PauseSkillScreens {
		base,
		levelup,
		perk,
	}

	enum PauseWaitScreens {
		base,
		wait,
	}


}
