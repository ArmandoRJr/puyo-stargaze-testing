scr_getinputs();

right_arrow = instance_create(x+20, y, obj_arrow)
right_arrow.image_angle = 0;
right_arrow.bool_to_check = key_right;

left_arrow = instance_create(x-20, y, obj_arrow)
left_arrow.image_angle = 180;
left_arrow.bool_to_check = key_left;

up_arrow = instance_create(x, y-20, obj_arrow)
up_arrow.image_angle = 90;
up_arrow.bool_to_check = key_up;

down_arrow = instance_create(x, y+20, obj_arrow)
down_arrow.image_angle = 270;
down_arrow.bool_to_check = key_down;

