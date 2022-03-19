if (image_index = 29) image_index = 24;
image_yscale = 1.5;

player = instance_find(obj_player, 0);
//if (image_xscale > 0) player = instance_place(x-10,y, obj_player);
//else player = instance_place(x+10,y, obj_player);
if (player != noone){
    if (player.image_xscale < 0){
        x = obj_player.x-10;
        y = obj_player.y;
        image_xscale = -1.5;
    }else{
        x = obj_player.x+10;
        y = obj_player.y;
        image_xscale = 1.5;
    }
    
    if (player.laser_pressed) {
        if (!visible) visible = true;
        if (image_speed == 0) image_speed = 1;
        
    } else {
        if (visible) visible = false;
        if (image_speed > 0) image_speed = 0;
        if (image_index > 0) image_index = 0;
    }
    
} else instance_destroy();

