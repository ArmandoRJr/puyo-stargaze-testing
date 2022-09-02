if (hp <= 0){
    audio_play_sound(snd_enm_explode,0,false);
    instance_destroy();
    global.points += 50;
}

//if (alarm[1] == -1) alarm[1] = 30;

hit = instance_place(x,y, obj_bullet);
if (hit != noone){
    hp -= hit.hp;
    instance_destroy(hit);
    sprite_index = spr_enemy_hurt;
    audio_play_sound(snd_enm_hit,1,false);
    alarm[0] = 2;
}

