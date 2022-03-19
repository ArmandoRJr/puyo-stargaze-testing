for (a = 0; a < global.player_hp; a++){
    image_rot = 0;
    y_offset = -4;  
    if (a % 2 != 0){
        image_rot = 180;
        y_offset = -y_offset;
    } 
    draw_sprite_ext(spr_life_heart, 0, 32+(a*28), 32+y_offset,
                    2, 2, image_rot, c_white, 1); 
}

