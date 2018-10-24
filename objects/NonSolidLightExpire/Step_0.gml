if (t>peak_start&&t<peak_end){
	alpha=1;
} else if (t>peak_end){
	alpha=(finish-t)/peak_end;
} else {
	alpha=t/peak_start;
}

t++;

event_inherited();