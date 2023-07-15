name="Actor";
description="Hello!";

alias=noone;
cutscenes=ds_map_create();

inventory=ds_list_create();

// equipment

equip_head=noone;
equip_hands=noone;
equip_body=noone;
equip_feet=noone;
equip_ring=noone;
equip_necklace=noone;

equip_left=noone;
equip_right=noone;

equip_spell=noone;
equip_power=noone;
equip_shout=noone;

// skills and variables

//race=get_random_race();
race=Races.inanimate;

var s=array_length_1d(all_skills);
skill_exp=array_create(s);
skill_level=array_create(s);
for (var i=0; i<s; i++){
	skill_exp[i]=get_skill_level_experience(i, DEFAULT_SKILL_LEVEL);
	skill_level[i]=DEFAULT_SKILL_LEVEL;
}

character_exp=get_character_level_experience(DEFAULT_CHARACTER_LEVEL);
character_level=DEFAULT_CHARACTER_LEVEL;
character_perk_points=0;

magic=ds_list_create();
effects=ds_list_create();
shouts=ds_list_create();
powers=ds_list_create();

perk_levels=array_create(Perks.Intimidation, 0);

souls=0;

skills_trained_this_level=array_create(s, 0);

shout_timer=0;
battle_priority=0;
battle_deleteable=false;
respawns=true;
defeated=false;
is_ghost=false;
side=Misc.side_opponent;
alpha=1;
target_alpha=1;
defeat_notify=false;
blocking=false;
required=false;
ethereal=false;
ward_points=0;
alive=true;
soul_trapped=false;

health_bar_alpha=0;

target=Actors.no;

// stats

st_mod_hp=0;
st_mod_mp=0;
st_mod_sp=0;

st_act_hp=100;
st_act_mp=100;
st_act_sp=100;

st_vis_hp=st_act_hp;
st_vis_mp=st_act_mp;
st_vis_sp=st_act_sp;