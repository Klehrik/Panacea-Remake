/// Camera

function Camera(_x = 0, _y = 0) constructor
{
	// Variables
	x = _x;
	y = _y;
	xTo = _x;
	yTo = _y;
	width = 0;
	height = 0;
	
	entity = noone;
	paddingH = 8;	// Amount of distance the entity has to move from the center before the camera moves
	paddingV = 8;
	slideDivision = 16;
	borders = [0, 0, room_width, room_height];
	
	//scalingGame = 16;
	scalingWindow = 5;
	smoothCamera = false;	// If true, the camera will not obey the pixel grid
	centerThisFrame = true;	// window_center() has to be run on the next frame for some reason
	
	
	// Functions
	static update_position = function()
	{
		// Border restrictions
		xTo = clamp(xTo, borders[0], borders[2] - width);
		yTo = clamp(yTo, borders[1], borders[3] - height);
		
		// Slide camera
		var dx = xTo - x;
		var dy = yTo - y;
		x += dx / slideDivision;
		y += dy / slideDivision;
		if (abs(dx) < 0.25) x = xTo;
		if (abs(dy) < 0.25) y = yTo;
		
		// Set camera position
		var _x = round(x);
		var _y = round(y);
		if (smoothCamera)
		{
			_x = x;
			_y = y;
		}
		camera_set_view_pos(view_camera, _x, _y);
	}
	
	static follow_entity = function(_entity = entity)
	{
		if (instance_exists(_entity))
		{
			entity = _entity;
			
			// Follow entity
			var half_cam_x = x + (width / 2);
			var half_cam_y = y + (height / 2);
			if (entity.x < half_cam_x - paddingH) xTo = entity.x - (width / 2) + paddingH;
			else if (entity.x > half_cam_x + paddingH) xTo = entity.x - (width / 2) - paddingH;
			if (entity.y < half_cam_y - paddingV) yTo = entity.y - (height / 2) + paddingV;
			else if (entity.y > half_cam_y + paddingV) yTo = entity.y - (height / 2) - paddingV;
			
			// Set new borders (on collision with obj_CameraBorder)
			var cb = instance_position(entity.x, entity.y, obj_CameraBorder);
			if (instance_exists(cb)) borders = [cb.bbox_left, cb.bbox_top, cb.bbox_right, cb.bbox_bottom];
		}
	}
	
	
	// Window Scaling
	static init = function(_w = 256, _h = 144)
	{
		width = _w;
		height = _h;
		camera_set_view_size(view_camera, width, height);
		window_set_size(width * scalingWindow, height * scalingWindow);
		set_smooth_camera(smoothCamera);
	}
	//static init_16_10 = function() { init(256, 160); }	// Clashes with the actual level design itself
	static init_4_3 = function() { init(192, 144); }
	static init_3_2 = function() { init(216, 144); }
	
	static set_scaling = function(scaling)
	{
		scaling = clamp(scaling, 1, 10);
		scalingWindow = scaling;
		window_set_size(width * scalingWindow, height * scalingWindow);
		set_smooth_camera(smoothCamera);
		centerThisFrame = true;
	}
	
	static set_smooth_camera = function(state)
	{
		smoothCamera = state;
		surface_resize(application_surface, width, height);
		if (smoothCamera) surface_resize(application_surface, width * scalingWindow, height * scalingWindow);
	}
	
	static toggle_fullscreen = function()
	{
		if (window_get_fullscreen())
		{
			window_set_fullscreen(false);
			centerThisFrame = true;
		}
		else window_set_fullscreen(true);
	}
	
	static check_window_center = function()
	{
		if (centerThisFrame)
		{
			centerThisFrame = false;
			window_center();
		}
	}
	
	//static set_aspect_ratio = function(horizontal_ratio, vertical_ratio)
	//{
	//	width = horizontal_ratio * scalingGame;
	//	height = vertical_ratio * scalingGame;
	//	camera_set_view_size(view_camera, width, height);
	//	surface_resize(application_surface, width, height);
	//	if (smoothCamera) surface_resize(application_surface, width * scalingWindow, height * scalingWindow);
	//	window_set_size(width * scalingWindow, height * scalingWindow);
	//	window_center();
	//}
}

function CameraSurface(_camera) constructor
{
	// A surface that is automatically adjusted to the Camera's position.
	// Keeps things a bit cleaner.
	
	// Variables
	camera = _camera;
	surface = surface_create(camera.width, camera.height);
	
	
	// Functions
	static delete_surface = function()
	{
		surface_free(surface);
	}
	
	static draw = function()
	{
		draw_surface(surface, round(camera.x), round(camera.y));
	}
	
	static cs_draw_point_color = function(x, y, col)
	{
		surface_set_target(surface);
		draw_point_color(x - round(camera.x), y - round(camera.y), col);
		surface_reset_target();
	}
	
	static cs_draw_line_color = function(x1, y1, x2, y2, col)
	{
		surface_set_target(surface);
		draw_line_color(x1 - round(camera.x), y1 - round(camera.y), x2 - round(camera.x), y2 - round(camera.y), col, col);
		surface_reset_target();
	}
	
	static cs_draw_rectangle_color = function(x1, y1, x2, y2, col, outline = false)
	{
		surface_set_target(surface);
		draw_rectangle_color(x1 - round(camera.x), y1 - round(camera.y), x2 - round(camera.x), y2 - round(camera.y), col, col, col, col, outline);
		surface_reset_target();
	}
	
	static cs_draw_clear = function(col)
	{
		surface_set_target(surface);
		draw_clear(col);
		surface_reset_target();
	}
	
	static cs_draw_sprite_ext = function(sprite, subimg, x, y, xscale, yscale)
	{
		surface_set_target(surface);
		draw_sprite_ext(sprite, subimg, x - round(camera.x), y - round(camera.y), xscale, yscale, 0, c_white, 1);
		surface_reset_target();
	}
	
	static cs_draw_light_ring = function(x, y, diameter)
	{
		gpu_set_blendmode(bm_subtract);
		surface_set_target(surface);
		var scale = diameter / 256;
		draw_sprite_ext(spr_LightRing, 0, x - round(camera.x), y - round(camera.y), scale, scale, 0, c_white, 1);
		surface_reset_target();
		gpu_set_blendmode(bm_normal);
	}
	
	static capture_camera = function()
	{
		surface_set_target(surface);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
	}
}
