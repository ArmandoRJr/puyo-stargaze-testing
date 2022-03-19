image_speed = 0.25;

x_rad = 20;
y_rad = 10;
x_speed = 2;
y_speed = 1;
x_degree = 0;
y_degree = 0;

player = instance_place(x,y, obj_player);
if (player != noone){
    x = obj_player.x;
    y = obj_player.y;
}

