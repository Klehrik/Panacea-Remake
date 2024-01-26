/// obj_Player : Draw

// Testing instructions
if (room == rm_Test)
{
	draw_set_font(fnt_Theoretical);
	draw_text(2, 2, "left right/AD - Move");
	draw_text(2, 12, "X/K - Jump (hold to go higher) (double)");
	draw_text(2, 22, "Hold JUMP to glide");
	draw_text(2, 32, "down/S - Crouch / Faster fall");
	draw_text(2, 42, "C/J - Breathe fire");
	draw_text(2, 52, "LMB - Teleport to cursor");
	draw_text(2, 62, "R - Reset");
	draw_text(2, 132, "Space - ???");
}
else if (room == rm_Test2)
{
	draw_set_font(fnt_Theoretical);
	draw_text(42, 22, "left right - Move");
	draw_text(42, 32, "X - Jump (triple jump)");
	draw_text(42, 42, "Hold JUMP to glide");
	draw_text(42, 52, "down - Crouch / Faster fall (not needed)");
	draw_text(42, 62, "C - Breathe fire (not needed)");
	draw_text(42, 72, "R - Reset");
	draw_text(42, 82, "1 - Toggle smooth camera");
}


#region Draw Self

	// Update time for feather floating
	featherSineTime++;
	
	// Create surface
	var surface = new CameraSurface(global.camera);

	// Update head feather positions and floating values
	feather1.set_position(round(x) + feather1Offsets.x, round(y) + feather1Offsets.y);
	for (var i = 0; i < ds_list_size(feather1.nodes); i++) feather1.nodes[| i].vxAdded = -image_xscale * (abs(dsin(featherSineTime) * 0.4) + 0.4);
	feather1.update_nodes();

	feather2.set_position(round(x) + feather2Offsets.x, round(y) + feather2Offsets.y);
	for (var i = 0; i < ds_list_size(feather2.nodes); i++) feather2.nodes[| i].vxAdded = -image_xscale * (abs(dsin(featherSineTime) * 0.4) + 0.4);
	feather2.update_nodes();

	// Draw self and head feathers
	feather2.draw_nodes(surface);
	apply_squash_and_stretch();
	draw_player(surface);
	feather1.draw_nodes(surface);
	
	// Draw surface with outline shader
	shader_set(shd_Outline);
	shader_set_uniform_f(shader_get_uniform(shd_Outline, "pixelW"), texture_get_texel_width(surface_get_texture(surface.surface)));
	shader_set_uniform_f(shader_get_uniform(shd_Outline, "pixelH"), texture_get_texel_height(surface_get_texture(surface.surface)));
	surface.draw();
	surface.delete_surface();
	delete surface;
	shader_reset();

#endregion

// Breath meter
if (breath < breathMax)
{
	draw_set_alpha(0.5);
	var c = c_black;
	draw_rectangle_color(x - 14, y - 7, x - 12, y - 7 + ((breathMax - breath) / breathMax * 11), c, c, c, c, false);
	var c = c_white;
	draw_rectangle_color(x - 14, y + 5 - (breath / breathMax * 11), x - 12, y + 4, c, c, c, c, false);
	draw_set_alpha(1);
}



// testing
if (keyboard_check_pressed(vk_space)) increase_head_feather_length();

if (mouse_check_button_pressed(mb_left) and room != rm_Test2)
{
	x = mouse_x;
	y = mouse_y;
}


if (get_hazard_collision() or breath <= 0)
{
	if (room == rm_Game) room_restart();
	else
	{
		x = save[0];
		y = save[1];
		state = "Wake";
	}
}

if (place_meeting(x, y, obj_Flag)) save = [x, y];