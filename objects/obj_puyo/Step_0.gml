player = instance_find(obj_player, 0);

if (player != noone){
    x_degree += x_speed;
    y_degree += y_speed;
    x = obj_player.x + x_rad*dsin(x_degree);
    y = obj_player.y + y_rad*(dcos(y_degree)/2);
    
    if (player.image_xscale < 0) {image_xscale = -1;}
    else {image_xscale = 1;}
}else instance_destroy();

