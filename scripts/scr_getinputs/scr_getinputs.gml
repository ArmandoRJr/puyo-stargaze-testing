function scr_getinputs() {
	key_left = keyboard_check(vk_left) || gamepad_button_check(0, gp_padl);
	key_right = keyboard_check(vk_right) || gamepad_button_check(0, gp_padr);
	key_up = keyboard_check(vk_up) || gamepad_button_check(0, gp_padu);
	key_down = keyboard_check(vk_down) || gamepad_button_check(0, gp_padd);

	key_hold_left = keyboard_check(ord("Z")) || gamepad_button_check(0, gp_face1);
	key_hold_right = keyboard_check(ord("X")) || gamepad_button_check(0, gp_face2);

	key_press_left = keyboard_check_pressed(ord("Z"))
	                 || gamepad_button_check_pressed(0, gp_face1);
	key_press_right = keyboard_check_pressed(ord("X"))
	                 || gamepad_button_check_pressed(0, gp_face2);

	key_shoot_rf_left = keyboard_check(ord("A"))
	                    || gamepad_button_check(0, gp_shoulderlb);
	key_shoot_rf_right = keyboard_check(ord("S"))
	                     || gamepad_button_check(0, gp_shoulderrb);
						 
	key_hold_focus = keyboard_check(vk_shift)
	                 || gamepad_button_check(0, gp_shoulderrb);

	key_throw_bomb = keyboard_check_pressed(ord("C"));

	key_start = keyboard_check_pressed(vk_escape)
	            || gamepad_button_check_pressed(0, gp_start);;

	key_select = keyboard_check_pressed(vk_enter)
	             || gamepad_button_check_pressed(0, gp_select);;



}
