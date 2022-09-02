scr_getinputs();

a_key = instance_create(x-20, y-20, obj_keyboard_key)
a_key.sprite_index = spr_keyboard_a;
a_key.bool_to_check = key_shoot_rf_left;

s_key = instance_create(x+20, y-20, obj_keyboard_key)
s_key.sprite_index = spr_keyboard_s;
s_key.bool_to_check = key_shoot_rf_right;

z_key = instance_create(x-20, y+10, obj_keyboard_key)
z_key.sprite_index = spr_keyboard_z;
z_key.bool_to_check = key_hold_left;

x_key = instance_create(x+20, y+10, obj_keyboard_key)
x_key.sprite_index = spr_keyboard_x;
x_key.bool_to_check = key_hold_right;

shift_key = instance_create(x-70, y+10, obj_keyboard_key)
shift_key.sprite_index = spr_keyboard_shift;
shift_key.bool_to_check = key_hold_focus;