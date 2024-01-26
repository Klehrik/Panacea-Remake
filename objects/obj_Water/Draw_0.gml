/// obj_Water : Draw

time += 1 / room_speed;


// Draw only if in camera view
if !(bbox_left > global.camera.x + global.camera.width
	or bbox_right < global.camera.x
	or bbox_top > global.camera.y + global.camera.height
	or bbox_bottom < global.camera.y)
{
	var extraHeight = 10;

	// Set shader
	shader_set(shd_Water);

	// Set variables
	var _time = shader_get_uniform(shd_Water, "time");
	shader_set_uniform_f(_time, time);

	// Create surface
	var surface = surface_create(sprite_width, sprite_height + extraHeight);
	surface_set_target(surface);

	// Main
	draw_surface_part_ext(application_surface, bbox_left - global.camera.x, bbox_top - global.camera.y, sprite_width, sprite_height, 0, extraHeight, 1, 1, c_white, 1);
	gpu_set_colorwriteenable(true, true, true, false);
	draw_set_alpha(0.15);
	var c = c_blue;
	draw_rectangle_color(0, extraHeight, sprite_width, sprite_height + extraHeight, c, c, c, c, false);
	draw_set_alpha(1);
	gpu_set_colorwriteenable(true, true, true, true);

	// Draw surface
	surface_reset_target();
	draw_surface(surface, x, y - extraHeight);
	surface_free(surface);

	// Reset shader
	shader_reset();
}