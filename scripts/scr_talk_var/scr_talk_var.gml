/// @description  void scr_talk();
/// @param	ArgSet
// sets up NPC dialogue (or inanimate object dialogue, if you want)
// scr_talk "text" [name?]

var arg_set=argument0;

World.speaking=true;
show_text_message=active.var_string;
show_text_t=0;
show_text_name=noone;
show_text_arrow=noone;

switch (array_length_1d(arg_set)){
	case 4:
		show_text_arrow=GetMyActor(arg_set[3]);
	case 3:
		show_text_name=GetMyActor(arg_set[2]);
		break;
}