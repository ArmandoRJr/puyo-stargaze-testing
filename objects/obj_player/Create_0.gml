friction = 0.25;
zx_pressed = false;
laser_pressed = false;
instance_create(x,y,obj_zx_circle);
instance_create(x,y,obj_puyo);
instance_create(x,y,obj_laser);
image_speed = 0.5;
alarm[0] = 120;

movement_speed = 3;
rapid_fire_left_alarm = -1;
rapid_fire_cooldown_alarm = -1;

