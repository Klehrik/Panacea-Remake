/// Entity Functions

function init_entity_variables()
{
	hsp = 0;
	vsp = 0;
	grav = 0.1;
	maxVspFall = 3;
	
	isGrounded = false;
	isGroundedThisFrame = false;
	isSubmerged = false;
	
	stretchH = 1;
	stretchV = 1;
	stretchValue = 1.6;
}

function apply_collisions_and_forces(gravityValue = grav, maxVsp = infinity)
{
	var maxLoopCount = 100;		// This will never be needed in normal circumstances, but when debugging an infinite loop can occur when dragging the player inside a wall
	
	// Horizontal
	var bbox_side =	(hsp > 0) ? bbox_right : bbox_left;
	if (get_horizontal_tilemap_collision(bbox_side + hsp))
	{
		var loops = 0;
		while (!get_horizontal_tilemap_collision(bbox_side + sign(hsp)) and loops < maxLoopCount)
		{
			loops++;
			bbox_side =	(hsp > 0) ? bbox_right : bbox_left;
			x += sign(hsp) * 0.5;
		}
		
		// QoL: Land on ledge if only just missed (by ~4 pixels)
		if (vsp > 0) check_ledge_grab(bbox_side + hsp);
		
		hsp = 0;
	}
	x += hsp;
	
	// Vertical
	vsp += gravityValue;
	var bbox_side =	(vsp > 0) ? bbox_bottom : bbox_top;
	if (get_vertical_tilemap_collision(bbox_side + vsp))
	{
		var loops = 0;
		while (!get_vertical_tilemap_collision(bbox_side + sign(vsp)) and loops < maxLoopCount)
		{
			loops++;
			bbox_side =	(vsp > 0) ? bbox_bottom : bbox_top;
			y += sign(vsp) * 0.5;
		}
		vsp = 0;
	}
	vsp = min(vsp, maxVsp);
	y += vsp;
	
	
	
	// isGrounded
	isGroundedThisFrame = false;
	if (get_vertical_tilemap_collision(bbox_bottom + 1))
	{
		if (!isGrounded) isGroundedThisFrame = true;
		isGrounded = true;
	}
	else isGrounded = false;
	
	// isSubmerged
	isSubmerged = false;
	if (position_meeting(x, y, obj_Water)) isSubmerged = true;
}

function get_horizontal_tilemap_collision(side, tilemapID = "Geometry")
{
	// This allows walls to extend infinitely when outside of the borders
	var top = clamp(bbox_top, global.camera.borders[1], global.camera.borders[3]);
	var bottom = clamp(bbox_bottom, global.camera.borders[1], global.camera.borders[3]);
	
	var tilemap = layer_tilemap_get_id(tilemapID);
	var sideCenter = top + ((bottom - top) / 2);
	return tilemap_get_at_pixel(tilemap, side, top) == 1
		or tilemap_get_at_pixel(tilemap, side, bottom) == 1
		or tilemap_get_at_pixel(tilemap, side, sideCenter) == 1;
}

function get_vertical_tilemap_collision(side, tilemapID = "Geometry")
{
	// This allows walls to extend infinitely when outside of the borders
	var left = clamp(bbox_left, global.camera.borders[0], global.camera.borders[2]);
	var right = clamp(bbox_right, global.camera.borders[0], global.camera.borders[2]);
	
	var tilemap = layer_tilemap_get_id(tilemapID);
	var sideCenter = left + ((right - left) / 2);
	return tilemap_get_at_pixel(tilemap, left, side) == 1
		or tilemap_get_at_pixel(tilemap, right, side) == 1
		or tilemap_get_at_pixel(tilemap, sideCenter, side) == 1;
}

function get_hazard_collision(tilemapID = "Geometry")
{
	var tilemap = layer_tilemap_get_id(tilemapID);
	
	var tl = tilemap_get_at_pixel(tilemap, bbox_left + 1, bbox_top + 1);
	var tr = tilemap_get_at_pixel(tilemap, bbox_right - 1, bbox_top + 1);
	var bl = tilemap_get_at_pixel(tilemap, bbox_left + 1, bbox_bottom - 1);
	var br = tilemap_get_at_pixel(tilemap, bbox_right - 1, bbox_bottom - 1);
	
	return (bl == 2 and br != 1)
		or (br == 2 and bl != 1)
		
		or (tl == 2 and tr != 1)
		or (tr == 2 and tl != 1);
}

function check_ledge_grab(side, leeway = 4, tilemapID = "Geometry")
{
	// This allows walls to extend infinitely when outside of the borders
	var _side = clamp(side, global.camera.borders[0], global.camera.borders[2]);
	
	var tilemap = layer_tilemap_get_id(tilemapID);
	if (tilemap_get_at_pixel(tilemap, _side, bbox_bottom - leeway) == 0) y -= leeway;
}



function set_squash_and_stretch(type, value)
{
	switch (type)
    {
        case "h":
            stretchH = value;
            stretchV = 1 / value;
            break;
            
        case "v":
            stretchH = 1 / value;
            stretchV = value;
            break;
    }
}

function apply_squash_and_stretch()
{
	stretchH = lerp(stretchH, 1, 0.15);
	stretchV = lerp(stretchV, 1, 0.15);
}

function draw_player(surface)
{
	var _x = round(x) + 0.25;	// Keeps that one pixel of Fen's eye when fast falling ¯\_(ツ)_/¯
	surface.cs_draw_sprite_ext(sprite_index, image_index, _x, round(y), image_xscale * stretchH, image_yscale * stretchV);
}

function draw_entity()
{
	draw_sprite_ext(sprite_index, image_index, round(x), round(y), image_xscale * stretchH, image_yscale * stretchV, image_angle, image_blend, image_alpha);
}

function draw_self_rounded()
{
	draw_sprite_ext(sprite_index, image_index, round(x), round(y), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}



function show_hitbox()
{
	var c = c_red;
	draw_set_alpha(0.5);
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c, c, c, c, false);
	draw_set_alpha(1);
}


// ----------------------------------------


//function apply_collisions_and_forces_OLD(gravityValue = grav, maxVsp = infinity)
//{
//	var wall = obj_Wall;
	
//	// Horizontal
//	if (place_meeting(x + hsp, y, wall))
//	{
//		while (!place_meeting(x + sign(hsp), y, wall)) x += sign(hsp);
//		hsp = 0;
//	}
//	x += hsp;
	
//	// Vertical
//	vsp += gravityValue;
//	if (place_meeting(x, y + vsp, wall))
//	{
//		while (!place_meeting(x, y + sign(vsp), wall)) y += sign(vsp);
//		vsp = 0;
//	}
//	vsp = min(vsp, maxVsp);
//	y += vsp;
	
//	// isGrounded
//	isGroundedThisFrame = false;
//	if (place_meeting(x, y + 1, wall))
//	{
//		if (!isGrounded) isGroundedThisFrame = true;
//		isGrounded = true;
//	}
//	else isGrounded = false;
//}