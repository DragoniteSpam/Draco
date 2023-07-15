function _cc_Misc() {
	enum Misc {
		morning,
		afternoon,
		evening,
		night,
		title,
		play,
		battle,
		equals,
		greater,
		greater_equal,
		less,
		less_equal,
		land,
		water,
		January,
		February,
		March,
		April,
		May,
		June,
		July,
		August,
		September,
		October,
		November,
		December,
		outdoors,
		indoors,
		cave,
		side_opponent,
		side_player,
		bs_start,
		bs_turn_start,
		bs_turn_mid,
		bs_turn_end,
		bs_input,
		bs_input_target,
		bs_flee,
		bs_defeat,
		additive,
		multiplicative,
	}

	day_time_alpha[Misc.night]=0.4;
	day_time_alpha[Misc.evening]=0.1;
	day_time_alpha[Misc.afternoon]=0;
	day_time_alpha[Misc.morning]=0;


}
