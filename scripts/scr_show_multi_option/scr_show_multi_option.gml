/// @description  Shows the multiple choice option.
/// @param	ArgSet

ds_list_clear(show_text_option_list);
ds_list_clear(show_text_option_return);
show_text_option_index=0;
show_text_option=true;

for (var i=1; i<array_length_1d(argument0)-1; i+=2){
	ds_list_add(show_text_option_list, argument0[i]);
	ds_list_add(show_text_option_return, argument0[i+1]);
}

scr_continue();