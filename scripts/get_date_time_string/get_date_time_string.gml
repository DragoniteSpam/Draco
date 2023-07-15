function get_date_time_string() {
	var datetime=date_create_datetime(game_current_year, game_current_month, game_current_day, game_current_hour, game_current_minute, game_current_second);

	var weekday=date_get_weekday(datetime);

	switch (weekday){
		case 0:
			var str="Sunday";
			break;
		case 1:
			var str="Monday";
			break;
		case 2:
			var str="Tuesday";
			break;
		case 3:
			var str="Wednesday";
			break;
		case 4:
			var str="Thursday";
			break;
		case 5:
			var str="Friday";
			break;
		case 6:
			var str="Saturday";
			break;
	}

	var timestamp=game_current_hour%12;
	if (timestamp==0){
		timestamp=12;
	}

	var minute=string_zero(game_current_minute);

	var ap=((game_current_hour div 12)==1)?"PM":"AM";

	switch (game_current_month){
		case 0:
			var m="January";
			break;
		case 1:
			var m="February";
			break;
		case 2:
			var m="March";
			break;
		case 3:
			var m="April";
			break;
		case 4:
			var m="May";
			break;
		case 5:
			var m="June";
			break;
		case 6:
			var m="July";
			break;
		case 7:
			var m="August";
			break;
		case 8:
			var m="September";
			break;
		case 9:
			var m="October";
			break;
		case 10:
			var m="November";
			break;
		case 11:
			var m="December";
			break;
	}

	str=str+" "+string(timestamp)+":"+minute+" "+ap+" "+m;

	return str;


}
