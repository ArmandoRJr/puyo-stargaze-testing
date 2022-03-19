//Character inputs
scr_getinputs();

//Standard movement
if (key_left) x -= movement_speed;
if (key_right) x += movement_speed;
if (key_up) y -= movement_speed;
if (key_down) y += movement_speed;

normal_speed = 4;
focus_speed = 2;

//Boundaries, will eventually change to a camera limit
//attached to an object
x = min(x, room_width-16);
x = max(x, 16);
y = min(y, room_height-16);
y = max(y, 16);

/*//Left / right shooting + simultaneous shooting
if (key_shoot_left && key_shoot_right){
    zx_pressed = true;}
else if (key_shoot_left){
    if (alarm[10] == -1) alarm[10] = 1;
    image_xscale = -1;
    zx_pressed = false;
}else if(key_shoot_right){
    if (alarm[11] == -1) alarm[11] = 5;
    image_xscale = 1;
    zx_pressed = false;
}else zx_pressed = false;*/

//Left / right shooting + simultaneous shooting v2
//Now with ChoRenSha shooting
if (key_hold_left && key_hold_right){
    laser_pressed = false;
    zx_pressed = true;
    movement_speed = focus_speed;
} else if (key_press_left || key_shoot_rf_left){
    if (rapid_fire_left_alarm == -1) rapid_fire_left_alarm = 6;
    image_xscale = -1;
} else if (key_hold_left){
    if (rapid_fire_left_alarm == -1 && rapid_fire_cooldown_alarm == -1) {
        laser_pressed = true;
        movement_speed = focus_speed;
    }
    image_xscale = -1;
} else if (key_press_right){
    if (alarm[11] == -1) alarm[11] = 5;
    image_xscale = 1;
} else if(key_hold_right){
    if (rapid_fire_left_alarm == -1 && rapid_fire_cooldown_alarm == -1) {
        laser_pressed = true;
        movement_speed = focus_speed;
    }
    image_xscale = 1;
}

if !(key_hold_left && key_hold_right) zx_pressed = false; 
if !(key_hold_right || key_hold_left) {
    laser_pressed = false;
    movement_speed = normal_speed;
}
//Still part of shooting
hp_bullet = 5;
if (rapid_fire_left_alarm == 6){
    bullet_straight = instance_create(x,y, obj_bullet);
    bullet_straight.direction = 180;
    bullet_straight.image_xscale = 2;
    bullet_straight.image_yscale = 2;
    bullet_straight.hp = 10;
    audio_play_sound(snd_laser, 2, false);
}else if (rapid_fire_left_alarm == 4){    
    bullet_up = instance_create(x,y, obj_bullet);
    bullet_up.direction = 175;
    bullet_up.hp = hp_bullet;
    bullet_down = instance_create(x,y, obj_bullet);
    bullet_down.direction = -175;
    bullet_down.hp = hp_bullet;       
    audio_play_sound(snd_laser, 2, false);
}else if (rapid_fire_left_alarm == 2){
    bullet_up2 = instance_create(x,y, obj_bullet);
    bullet_up2.direction = 170;
    bullet_up2.hp = hp_bullet;
    bullet_down2 = instance_create(x,y, obj_bullet);
    bullet_down2.direction = -170;
    bullet_down2.hp = hp_bullet;
    audio_play_sound(snd_laser, 2, false);
}else if(rapid_fire_left_alarm == 0){
    bullet_up3 = instance_create(x,y, obj_bullet);
    bullet_up3.direction = 175;
    bullet_up3.hp = hp_bullet;
    bullet_down3 = instance_create(x,y, obj_bullet);
    bullet_down3.direction = -175;
    bullet_down3.hp = hp_bullet;       
    audio_play_sound(snd_laser, 2, false);
    rapid_fire_cooldown_alarm = 15;
}
if (rapid_fire_left_alarm > -1) rapid_fire_left_alarm--;
if (rapid_fire_cooldown_alarm > -1) rapid_fire_cooldown_alarm--;
    

/*Momentum
if (keyboard_check(vk_up)) vspeed -= 3;
if (keyboard_check(vk_down)) vspeed += 3;
if (vspeed >= 6) vspeed = 6;
if (vspeed <= -6) vspeed = -6;*/


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
