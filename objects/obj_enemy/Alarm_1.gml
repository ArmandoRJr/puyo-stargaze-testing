if (instance_find(obj_player,0) != noone){
    bullet_left = instance_create(x,y, obj_enemy_bullet);
    bullet_left.direction = point_direction(x,y,obj_player.x, obj_player.y);
}

