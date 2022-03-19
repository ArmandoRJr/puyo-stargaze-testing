//player = instance_place(x,y, obj_player);
aim_wait_time = 10

player = instance_place(x,y, obj_player);
if (player != noone){
    x = obj_player.x;
    y = obj_player.y;
    
    if(player.zx_pressed == true && hold_duration >= aim_wait_time){
        if (image_index == 3) image_speed = 0;
        else image_speed = 0.5;
        visible = true;
        if (last_seen != noone && instance_exists(last_seen)
            && place_meeting(x,y,last_seen)){
            bullet = instance_create(x,y,obj_bullet);
            bullet.direction = point_direction(x,y,last_seen.x, last_seen.y);
            bullet.image_angle = bullet.direction; //Wack fix but it works
            bullet.hp = 0.5;
            bullet.speed = 10;
            
            //Old lock-on
            //NOTE: use instance_exists + last_seen
            /*target = instance_place(x,y,obj_enemy);
            if (target != noone){
                bullet = instance_create(x,y,obj_bullet);
                bullet.direction = point_direction(x,y,target.x, target.y);
                bullet.image_angle = bullet.direction; //Wack fix but it works
                bullet.hp = 0.5;
                bullet.speed = 10;*/
        }else last_seen = instance_nearest(x,y,obj_enemy);
    }else if (player.zx_pressed == true){
        hold_duration += 1;
    }else{
        visible = false;
        image_index = 0;
        image_speed = 0;
        hold_duration = 0;
    }
}else instance_destroy();

/* */
/*  */
