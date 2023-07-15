function macros() {
#macro DIR_NULL -1
#macro TS_SLOW 1
#macro TS_MEDIUM 2
#macro TS_FAST 3
#macro W 1280
#macro H 720
#macro NULL_STRING "\\%$NULL STRING"	// wtf is this
#macro vk_lmouse $01
#macro vk_mmouse $04
#macro vk_rmouse $02
#macro DIR_EAST 0
#macro DIR_NORTH 90
#macro DIR_WEST 180
#macro DIR_SOUTH 270
#macro COLOR_HEALTH	c_red
#macro COLOR_MAGIC	c_blue
#macro COLOR_STAMINA	c_green
#macro COLOR_EXP	c_dkgray
#macro COLOR_STAT_BORDER	c_silver
#macro COLOR_PERK_AVAILABLE	c_lime
#macro COLOR_PERK_MAX c_aqua
#macro COLOR_PERK_UNAVAILABLE make_color_rgb(255, 153, 153)
#macro WATER_COLOR	c_aqua
#macro WATER_ALPHA	0.75
#macro CAVE_ALPHA	0.5
#macro TAB	"   "
#macro LIGHT_SURFACE_SCALE	4
#macro ALARM_EFFECT_TIMER	0
#macro DEPTH_PARTICLES	-100
#macro DEPTH_PARTICLES_SUB	550
#macro SEPIA_TONE	0.8
#macro MILLION	1000000
#macro	CONJOURATION_DURATION	120
#macro	GAMEPAD_INDEX	1
	// Skills
#macro MAX_SKILL_LEVEL	100
#macro SKILL_CURVE	1.95
#macro DEFAULT_SKILL_LEVEL	15
#macro DEFAULT_CHARACTER_LEVEL	1
#macro SKILL_LEVEL	0
#macro SKILL_EXP	1
	// Grid and rendering stuff
#macro GRID_CELL_WIDTH	32
#macro GRID_CELL_HEIGHT	32
#macro ANIMATION_CYCLES_PER_SECOND	2
#macro ANIMATION_ITEM_PER_SECOND	4
#macro MAP_WIDTH	2048
#macro MAP_HEIGHT	2048
	// Alarms
#macro	ALARM_ATTACK	0
#macro	ALARM_CONJOURATION_EXPIRY	1
	// Extra colors
#macro	c_pink	merge_colour(c_red, c_white, 0.5)


}
