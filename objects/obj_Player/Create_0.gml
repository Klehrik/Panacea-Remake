/// obj_Player : Init

init_entity_variables();
lightRingSize = 96;

// Stats
jumpCount = 0;
jumpCountMax = 3;
headFeatherLength = 4;
breathMax = 7 *60;
breath = breathMax;

// Physics Variables
moveSpeed = 1.2;
acceleration = 0.3;
accelerationGlide = 0.06;
jumpHeight = 2.35;
maxVspGlide = 0.4;
frictionFactor = 0.9;
frictionFactorAir = 0.97;

// Platformer QoL
jumpBuffer = 0;
jumpBufferMax = 6;

// States and Flags
state = "Free";
stateAction = "Free";
isJumpingThisFrame = false;
canMoveHorizontally = true;

// Other
#region Head Feathers
	
	var iterations = 10;
	
	// Create feather 1 node chain and add nodes
	feather1 = new NodeChain();
	feather1.constraintIterations = iterations;
	for (var i = 0; i < headFeatherLength - 1; i++) feather1.add_node(1, 0, 0.17, 0.4, 0.4);
	feather1.draw_nodes = function(surface)
	{
		for (var i = 1; i < ds_list_size(feather1.nodes); i++)
		{
			var node = feather1.nodes[| i];
			var prev_node = feather1.nodes[| i - 1];
			var c = #ff6c24;
			surface.cs_draw_point_color(node.x, node.y, c);
			surface.cs_draw_line_color(prev_node.x, prev_node.y, node.x, node.y, c);
		}
	}
	
	// Create feather 2 node chain and add nodes
	feather2 = new NodeChain();
	feather2.constraintIterations = iterations;
	for (var i = 0; i < headFeatherLength; i++) feather2.add_node(1, 0, 0.3, 0.4, 0.4);
	feather2.draw_nodes = function(surface)
	{
		for (var i = 1; i < ds_list_size(feather1.nodes); i++)
		{
			var node = feather2.nodes[| i];
			var prev_node = feather2.nodes[| i - 1];
			var c = #ab5236;
			surface.cs_draw_point_color(node.x, node.y, c);
			surface.cs_draw_line_color(prev_node.x, prev_node.y, node.x, node.y, c);
		}
	}
	
	// Set movement and position variables
	featherSineTime = 0;
	feather1Offsets = {x: -1, y: -7};
	feather2Offsets = {x: -1, y: -6};
	
	// Functions
	increase_head_feather_length = function()
	{
		headFeatherLength++;
		feather1.add_node(1, 0, 0.17, 0.4, 0.4);
		feather2.add_node(1, 0, 0.3, 0.4, 0.4);
	}
	
#endregion


// Functions
reset_states = function()
{
	state = "Free";
	stateAction = "Free";
	hsp = 0;
	vsp = 0;
	sprite_index = spr_PlayerIdle;
	image_speed = 1;
}

freeze = function()
{
	state = "Freeze";
	stateAction = "Freeze";
	hsp = 0;
	vsp = 0;
	sprite_index = spr_PlayerIdle;
	image_speed = 1;
}
