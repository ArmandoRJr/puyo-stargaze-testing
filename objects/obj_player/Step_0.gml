//Character inputs
scr_getinputs();

//Boundaries, will eventually change to a camera limit
//attached to an object
x = min(x, room_width-16);
x = max(x, 16);
y = min(y, room_height-16);
y = max(y, 16);

//Left / right shooting + simultaneous shooting v3
//Focus vs normal speed
if (key_hold_focus){
    movement_speed = focus_speed;
	bullet_dir_mult = 0.5;
}
else {
	movement_speed = normal_speed;
	bullet_dir_mult = 1;
}
//Rotation of sprite
if (key_hold_left && !key_hold_right){
    image_xscale = -1;
	if (rapid_fire_left_alarm == -1) rapid_fire_left_alarm = 6;
} else if (key_hold_right && !key_hold_left){
    image_xscale = 1;
	if (rapid_fire_right_alarm == -1) rapid_fire_right_alarm = 6;
} 


//Standard movement
if (key_left) x -= movement_speed;
if (key_right) x += movement_speed;
if (key_up) y -= movement_speed;
if (key_down) y += movement_speed;

//Still part of shooting
bullet_hp = 5;
bullet_base_dir = 180;
bullet_angle_inc = 10;

if (rapid_fire_left_alarm == 6){
    bullet_straight = instance_create(x,y, obj_bullet);
    bullet_straight.direction = bullet_base_dir;
    bullet_straight.image_xscale = 2 - bullet_dir_mult;
    bullet_straight.image_yscale = 2 - bullet_dir_mult;
    bullet_straight.hp = bullet_hp + 5;
    audio_play_sound(snd_vulcan, 2, false);
}else if (rapid_fire_left_alarm == 4){    
    bullet_up = instance_create(x,y, obj_bullet);
    bullet_up.direction = bullet_base_dir + (bullet_angle_inc * bullet_dir_mult);
    bullet_up.hp = bullet_hp;
    bullet_down = instance_create(x,y, obj_bullet);
    bullet_down.direction = bullet_base_dir - (bullet_angle_inc * bullet_dir_mult);
    bullet_down.hp = bullet_hp;       
    //audio_play_sound(snd_vulcan, 2, false);
}else if (rapid_fire_left_alarm == 2){
    bullet_up2 = instance_create(x,y, obj_bullet);
    bullet_up2.direction = bullet_base_dir + (bullet_angle_inc * bullet_dir_mult * 2);
    bullet_up2.hp = bullet_hp;
    bullet_down2 = instance_create(x,y, obj_bullet);
    bullet_down2.direction = bullet_base_dir - (bullet_angle_inc * bullet_dir_mult * 2);
    bullet_down2.hp = bullet_hp;
	audio_play_sound(snd_vulcan, 2, false);
}else if(rapid_fire_left_alarm == 0){
    bullet_up3 = instance_create(x,y, obj_bullet);
    bullet_up3.direction = bullet_base_dir + (bullet_angle_inc * bullet_dir_mult);
    bullet_up3.hp = bullet_hp;
    bullet_down3 = instance_create(x,y, obj_bullet);
    bullet_down3.direction = bullet_base_dir - (bullet_angle_inc * bullet_dir_mult);
    bullet_down3.hp = bullet_hp;       
    //audio_play_sound(snd_vulcan, 2, false);
    //rapid_fire_cooldown_alarm = 15;
}
if (rapid_fire_left_alarm > -1) rapid_fire_left_alarm--;
//if (rapid_fire_cooldown_alarm > -1) rapid_fire_cooldown_alarm--;


if (rapid_fire_right_alarm == 6){
    bullet_straight = instance_create(x,y, obj_bullet);
    bullet_straight.direction = 0;
    bullet_straight.image_xscale = 1.5;
    bullet_straight.image_yscale = 1.5;
    bullet_straight.hp = bullet_hp + 5;
    audio_play_sound(snd_vulcan, 2, false);
}else if (rapid_fire_right_alarm == 4){    
    bullet_up = instance_create(x,y, obj_bullet);
    bullet_up.direction = 5;
    bullet_up.hp = bullet_hp;
    bullet_down = instance_create(x,y, obj_bullet);
    bullet_down.direction = -5;
    bullet_down.hp = bullet_hp;       
    //audio_play_sound(snd_vulcan, 2, false);
}else if (rapid_fire_right_alarm == 2){
    bullet_up2 = instance_create(x,y, obj_bullet);
    bullet_up2.direction = 10;
    bullet_up2.hp = bullet_hp;
    bullet_down2 = instance_create(x,y, obj_bullet);
    bullet_down2.direction = -10;
    bullet_down2.hp = bullet_hp;
	audio_play_sound(snd_vulcan, 2, false);
}else if(rapid_fire_right_alarm == 0){
    bullet_up3 = instance_create(x,y, obj_bullet);
    bullet_up3.direction = 5;
    bullet_up3.hp = bullet_hp;
    bullet_down3 = instance_create(x,y, obj_bullet);
    bullet_down3.direction = -5;
    bullet_down3.hp = bullet_hp;       
    //audio_play_sound(snd_vulcan, 2, false);
    //rapid_fire_cooldown_alarm = 15;
}
if (rapid_fire_right_alarm > -1) rapid_fire_right_alarm--;


//Death, lives removal and
//instance destruction (for obj_player + obj_zx_circle + obj_puyo)
if ((instance_place(x,y, obj_enemy_bullet) != noone
    || instance_place(x,y,obj_enemy) != noone)) && sprite_index == spr_player{
        audio_play_sound(snd_explosion,0,false);
        instance_destroy();
        possible_radar = instance_find(obj_zx_circle,0)
        if (possible_radar != noone) {instance_destroy(possible_radar);}
        possible_puyo = instance_find(obj_puyo,0)
        if (possible_puyo != noone) {instance_destroy(possible_puyo);}
        global.player_hp -= 1;
        if (global.player_hp > 0){
            instance_create(100, 180, obj_player);
        }else instance_destroy();
}

/* */
/*  */
