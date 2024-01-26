/// obj_Manager : Draw GUI

// not gonna support smooth camera anymore so this is unused
var scale_number = function(n)
{
	// Smooth camera uses a way larger application_surface, so this is to compensate
	
	if (global.camera.smoothCamera) return n * global.camera.scalingWindow;
	return n;
}


// Jump count
for (var i = 0; i < obj_Player.jumpCountMax; i++)
{
	var spr = 0;
	if (obj_Player.jumpCount <= i) spr = 1;
	draw_sprite_ext(spr_Feather, spr, 8 + (i * 12), global.camera.height - 18, 1, 1, 0, c_white, 1);
	//draw_sprite_ext(spr_Feather, spr, scale_number(8) + (i * scale_number(12)), scale_number(global.camera.height) - scale_number(18), scale_number(1), scale_number(1), 0, c_white, 1);
}

// Grass burned
draw_text_transformed(2, 32, "Grass burned: " + string(global.stats.grassBurned), 1, 1, 0);
//draw_text_transformed(scale_number(2), scale_number(2), "Grass burned: " + string(global.stats.grassBurned), scale_number(1), scale_number(1), 0);

// Breath count
//draw_text_transformed(scale_number(2), scale_number(12), "Breath: " + string(obj_Player.breath), scale_number(1), scale_number(1), 0);

// Debug: Instance count
var c = c_lime;
draw_text_transformed_color(2, 2, "FPS Real: " + string(fps_real), 1, 1, 0, c, c, c, c, 1);
draw_text_transformed(2, 12, "Instances: " + string(instance_count), 1, 1, 0);
draw_text_transformed(2, 22, "Particles: " + string(ds_list_size(obj_ParticleManager.particles) + ds_list_size(obj_ParticleManagerLower.particles)), 1, 1, 0);