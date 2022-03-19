hp_bullet = 5;

bullet_straight = instance_create(x,y, obj_bullet);
bullet_straight.direction = 180;
bullet_straight.hp = hp_bullet;

bullet_up = instance_create(x,y, obj_bullet);
bullet_up.direction = 170;
bullet_up.hp = hp_bullet;

bullet_down = instance_create(x,y, obj_bullet);
bullet_down.direction = -170;
bullet_down.hp = hp_bullet;

audio_play_sound(snd_laser, 2, false);

