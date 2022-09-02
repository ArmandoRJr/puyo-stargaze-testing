friction = 0.25;
instance_create(x,y,obj_puyo);
//instance_create(x,y,obj_laser);
image_speed = 0.5;
alarm[0] = 120;

//X, Y movement speed
movement_speed = 4;
normal_speed = 4;
focus_speed = 2;

//Standard multiplier when not focusing
bullet_dir_mult = 1;

//Bullet spread alarm
rapid_fire_left_alarm = -1;
rapid_fire_right_alarm = -1;
