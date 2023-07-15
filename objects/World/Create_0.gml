state=Misc.title;
state_sepia=0;
state_sepia_target=0;

grid=ds_grid_create(MAP_WIDTH div 32, MAP_HEIGHT div 32);
event=ds_grid_create(MAP_WIDTH div 32, MAP_HEIGHT div 32);
terrain=ds_grid_create(MAP_WIDTH div 32, MAP_HEIGHT div 32);
lights=ds_grid_create(MAP_WIDTH div 32, MAP_HEIGHT div 32);

// Enumerated constants/things related to said enumerated constants.
_cc_Battle();
_cc_Directions();
_cc_Effects();
_cc_Flags();
_cc_ItemMetadata();
_cc_Items();
_cc_JS();
_cc_MagicMetadata();
_cc_Misc();
_cc_PauseMenu();
_cc_ShoutsAndPowers();
_cc_SkillsAndActiveEffects();

// These may depend on other things being declared.
_cc_Perks();
_cc_Races();
_cc_Actors();

// Important things.

instantiate(Controller);

// Any DLLs you use would go here, maybe.

// For testing, as well as other graphics stuff
show_debug_overlay(true);
gpu_set_texfilter(false);
application_surface_draw_enable(false);

// Settings.
use_controller=true;
text_speed=TS_FAST;
time_scale=30;

// View.
view_xcell=__view_get( e__VW.XView, 0 ) div 32;
view_ycell=__view_get( e__VW.YView, 0 ) div 32;
view_wcell=__view_get( e__VW.WView, 0 ) div 32;
view_hcell=__view_get( e__VW.HView, 0 ) div 32;

// Various hooks that are important to the game.
speaking=false;
active=noone;

pausing=noone;
show_text_t=0;
show_text_message="";
show_text_name=noone;
show_text_arrow=noone;
scene_index=0;

show_text_option_list=ds_list_create();
show_text_option_return=ds_list_create();
show_text_option_index=0;
show_text_option=false;

show_skill_trainer=-1;

variable=array_create(10, 0);

location_type=Misc.outdoors;

shade_target=0;
shade_alpha=0;

pause_reset_variables();

// Battle stuff
battle_difficulty=1;
battle_spawned=ds_list_create();

// Timing. 
game_current_second=current_second;
game_current_minute=current_minute;
game_current_hour=current_hour;
game_current_day=current_day;
game_current_month=current_month;
game_current_year=current_year;

alarm[ALARM_EFFECT_TIMER]=game_get_speed(gamespeed_fps);

day_alpha=0;

// AI stuff.
ai_grid=noone;

room_goto(Title);

//instance_deactivate_object(Struct);