/// obj_Manager : Step

global.frame++;

// Camera
global.camera.check_window_center();
global.camera.follow_entity();
global.camera.update_position();

// Cutscenes
//global.cutscenes.run_cutscene();



// debug
if (keyboard_check_pressed(ord("F"))) global.camera.toggle_fullscreen();
//if (keyboard_check_pressed(ord("1"))) global.camera.set_smooth_camera(!global.camera.smoothCamera);
if (keyboard_check_pressed(ord("2"))) global.camera.set_scaling(global.camera.scalingWindow - 1);
if (keyboard_check_pressed(ord("3"))) global.camera.set_scaling(global.camera.scalingWindow + 1);


ds_list_add(fpsList, fps_real);
if (ds_list_size(fpsList) > 20) ds_list_delete(fpsList, 0);
var total = 0;
for (var i = 0; i < ds_list_size(fpsList); i++)
{
	total += fpsList[| i];
}
//show_debug_message(total / ds_list_size(fpsList));