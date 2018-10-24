switch (pause_stage){
    case PauseMenu.rose:
        drawPauseMenuRose();
        break;
	case PauseMenu.inventory:
		drawPauseMenuInventory(pause_other_inventory);
		break;
	case PauseMenu.magic:
		drawPauseMenuMagic();
		break;
	case PauseMenu.skills:
		drawPauseMenuSkills();
		break;
	case PauseMenu.map:
		break;
	// Journal stuff
	case PauseMenu.journal:
		break;
	case PauseMenu.stats:
		break;
	case PauseMenu.system:
		break;
	// Side stuff
	case PauseMenu.wait:
		drawPauseMenuWait();
		break;
}