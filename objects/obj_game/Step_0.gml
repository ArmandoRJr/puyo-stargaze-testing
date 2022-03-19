scr_getinputs();

//Fullscreen changes
if (key_select) {
    if window_get_fullscreen() window_set_fullscreen(false);
    else window_set_fullscreen(true);
}

if (room == rm_game) {
    if (key_start) {
        paused = !paused;
        
        if (paused == false) {
            instance_activate_all();
            surface_free(paused_surf);
            paused_surf = -1;
        }
    }
    if (paused == true) {
        alarm[0]++;
        alarm[1]++;
    }
}

