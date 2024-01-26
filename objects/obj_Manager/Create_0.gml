/// obj_Manager : Init

depth = -5000;

global.frame = 0;

// Initialization
randomize();
draw_set_circle_precision(64);
draw_set_font(fnt_Varnished);
layer_set_visible("Level_Layout_Background", false);
layer_set_visible("Geometry", false);

// Camera
if (!variable_global_exists("camera"))
{
	global.camera = new Camera(obj_Player.x - (obj_Player.x mod 256), obj_Player.y - (obj_Player.y mod 144));
	global.camera.entity = obj_Player;
}
global.camera.init();


// Cutscenes
//global.cutscenes = new CutsceneManager();
//global.cutscenes.start_cutscene("Intro Jump");

// Tileset
modify_tile("Init World");

// Stats
global.stats = {
	grassBurned:	0,
}



// debug
fpsList = ds_list_create();

if (room != rm_Game)
{
	with (obj_Player)
	{
		jumpCountMax = 3;
		increase_head_feather_length();
		save = [x, y];
	}
}