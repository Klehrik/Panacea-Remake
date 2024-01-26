/// obj_Fire : Step

// Set depth (newer Fire particles should be rendered above)
depth = -100 - life;



// Decrement lifetime
if (life > 0) life--;
else instance_destroy();
var stage = floor((life / lifeMax) * 4);	// 0 to 3

// Apply motion
motion_set(dir, spd);

// Fly upwards at the last stage (gray)
if (stage == 0)
{
	image_alpha -= 0.75 / (lifeMax / 4);
	dir -= sign(angle_difference(dir, 90)) * 6;
}



if (stage > 0)
{
	// Water collision
	if (place_meeting(x, y, obj_Water))
	{
		life = lifeMax / 4;
		stage = 0;
	}
	
	// Burn grass
	if (stage > 0) modify_tile("Burn Grass");
	
	// Tile collision
	if (get_horizontal_tilemap_collision(bbox_left) or get_horizontal_tilemap_collision(bbox_right)
		or get_vertical_tilemap_collision(bbox_top) or get_vertical_tilemap_collision(bbox_bottom))
	{
		 life = lifeMax / 4;
		 stage = 0;
	}
}



// Change color
image_blend = colors[stage + 1];