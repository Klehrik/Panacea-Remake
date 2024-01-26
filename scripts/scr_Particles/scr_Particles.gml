/// Particles

// Custom particle system using structs

function create_particle(type, _x, _y)
{
	switch (type)
	{
		#region Dust
		case "Dust":
			var directions = [1, -1];
			for (var i = 0; i < 2; i++)
			{
				var part = {
					x: _x,
					y: _y,
					hsp: directions[i],
					life: 12,
				
					update: function()
					{
						x += hsp;
						life--;
					},
				
					draw: function()
					{
						var c = c_white;
						var size = life / 6;
						draw_set_alpha(life / 15);
						draw_circle_color(x, y, size, c, c, false);
						draw_set_alpha(1);
					}
				}
				add_particle(part);
			}
			break;
		#endregion
		
		#region Burn Grass
		case "Burn Grass":
			var directions = [0.5, -0.5];
			for (var i = 0; i < 2; i++)
			{
				var part = {
					x: _x,
					y: _y,
					hsp: directions[i],
					vsp: 0,
					life: 25,
				
					update: function()
					{
						x += hsp;
						y += vsp;
						vsp -= 0.05;
						life--;
					},
				
					draw: function()
					{
						var c = #74a65b;
						var size = life / 9;
						draw_set_alpha(life / 25);
						draw_circle_color(x, y, size, c, c, false);
						draw_set_alpha(1);
					}
				}
				add_particle(part);
			}
			break;
		#endregion
		
		#region Glide
		case "Glide":
			var part = {
				x: _x,
				y: _y,
				life: 60,
				
				update: function()
				{
					life--;
				},
				
				draw: function()
				{
					var c = c_white;
					var size = life / 60;
					draw_set_alpha(life / 90);
					draw_circle_color(x, y, size, c, c, false);
					draw_set_alpha(1);
				}
			}
			add_particle_lower(part);
			break;
		#endregion
	}
}

function add_particle(part) { ds_list_add(obj_ParticleManager.particles, part); }
function add_particle_lower(part) { ds_list_add(obj_ParticleManagerLower.particles, part); }