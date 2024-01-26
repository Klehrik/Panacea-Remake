/// World Gen

function modify_tile(cmd)
{
	switch (cmd)
	{
		#region Init World
		case "Init World":
		
			for (var _y = 0; _y < room_height / 8; _y++)
			{
				for (var _x = 0; _x < room_width / 8; _x++)
				{
					// Get tile
					var tilemap = layer_tilemap_get_id("Front_Tiles");
					var tile = tilemap_get(tilemap, _x, _y);
					
					
					// RULES
		
					// Top rock tiles -> Grass tiles (Must be unsubmerged)
					var grass = layer_tilemap_get_id("Grass");
					if (tile >= 1 and tile <= 3 and !position_meeting(_x * 8, _y * 8, obj_Water))
					{
						tilemap_set(tilemap, tile_set_index(tile, tile + 68), _x, _y);
						tilemap_set(grass, choose(0, irandom_range(53, 55)), _x, _y - 1);
					}
				}
			}
			
			break;
		#endregion
		
		#region Burn Grass
		case "Burn Grass":
			
			var bbox_x = [bbox_left, bbox_right, bbox_left, bbox_right];
			var bbox_y = [bbox_top, bbox_top, bbox_bottom + 1, bbox_bottom + 1];
	
			for (var i = 0; i < 4; i++)
			{
				var tilemap = layer_tilemap_get_id("Front_Tiles");
				var tile = tilemap_get_at_pixel(tilemap, bbox_x[i], bbox_y[i]);
				
				// Check if the tile is a grass tile and change it accordingly
				if (tile >= 69 and tile <= 71)
				{
					tilemap_set_at_pixel(tilemap, tile_set_index(tile, tile + 16), bbox_x[i], bbox_y[i]);
					global.stats.grassBurned++;
					
					// Remove grass above it as well
					var grass = layer_tilemap_get_id("Grass");
					var tileAbove = tilemap_get_at_pixel(grass, bbox_x[i], bbox_y[i] - 8);
					
					if (tileAbove >= 53 and tileAbove <= 55) tilemap_set_at_pixel(grass, 0, bbox_x[i], bbox_y[i] - 8);
					
					// Create particles
					create_particle("Burn Grass", bbox_x[i], bbox_y[i] - 2);
				}
			}
			
			break;
		#endregion
	}
}