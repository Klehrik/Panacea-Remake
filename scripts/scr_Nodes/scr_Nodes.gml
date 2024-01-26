/// Node Physics Library
/// Klehrik


// chain = new NodeChain(x, y, constraint_iterations);
// * Creates a new node chain containing 1 starting node.
//		x (default 0) - The x position of the chain.
//		y (default 0) - The y position of the chain.
//		constraint_iterations (default 50) - The number of iterations to apply when constraining points to each other.


// chain.set_position(x, y);
// * Moves the chain to the given position.
//		x - The x position of the chain.
//		y - The y position of the chain.


// chain.add_node(distance, vx_added, vy_added, vx_scale, vy_scale, fixed);
// * Adds a node to the end of the chain.
//		distance (default 0) - The distance (in pixels) between this node and the previous one.
//		vx_added (default 0) - The amount of horizontal velocity added every frame.
//		vy_added (default 0) - The amount of vertical velocity added every frame.
//		vx_scale (default 1) - The scale factor for horizontal velocity.
//		vy_scale (default 1) - The scale factor for vertical velocity.
//		fixed (default false) - Whether or not to apply positional updates.
// > Returns the node pointer.


// chain.remove_node(position);
// * Removes a node at the given position.
//		position - The position of the node to be removed (starting at 0).
//			! Note that node 0 itself cannot be removed (as it is the starting node).
// > Returns true if successful, otherwise false.


// chain.update_nodes();
// * Updates the positions and applies constraints for all nodes in the chain.


// chain.draw_nodes();
// * A simple rendering of all the nodes in the chain.
// * Can be overridden if desired.


// chain.destroy_nodes();
// * Remove all the nodes from the chain.
//		! This should be called before deleting the chain struct itself.


// ----------------------------------------


function NodeChain(_x = 0, _y = 0, constraint_iterations = 50) constructor
{
	// Variables
	x = _x;
	y = _y;
	nodes = ds_list_create();
	constraintIterations = constraint_iterations;				// Number of times to apply constraints per update (affects rigidity of the chain)
	ds_list_add(nodes, new Node(x, y, 0, 0, 0, 0, 0, true));	// Add starting node (a fixed node that will always follow the NodeChain's coordinates)
	
	
	// Functions
	static set_position = function(_x, _y)
	{
		x = _x;
		y = _y;
	}
	
	static add_node = function(distance = 0, vx_added = 0, vy_added = 0, vx_scale = 1, vy_scale = 1, fixed = false)
	{
		var prev_node = nodes[| ds_list_size(nodes) - 1];
		var node = new Node(prev_node.x, prev_node.y, distance, vx_added, vy_added, vx_scale, vy_scale, fixed);
		ds_list_add(nodes, node);
		return node;
	}
	
	static remove_node = function(n)
	{
		if (n > 0 and n < ds_list_size(nodes))
		{
			delete nodes[| n];
			ds_list_delete(nodes, n);
			return true;
		}
		return false;
	}
	
	static update_nodes = function()
	{
		// Set starting node position
		nodes[| 0].x = x;
		nodes[| 0].y = y;
		
		// Update positions
		for (var i = 0; i < ds_list_size(nodes); i++) nodes[| i].update_position();
	
		// Apply constraints
		for (var j = 0; j < constraintIterations; j++)
		{
			for (var i = 0; i < ds_list_size(nodes); i++)
			{
				var prev = {x: x, y: y, fixed: false};
				if (i > 0) prev = nodes[| i - 1];
				nodes[| i].apply_constraints(prev);
			}
		}
	}
	
	static draw_nodes = function()
	{
		for (var i = 0; i < ds_list_size(nodes); i++)
		{
			var node = nodes[| i];
			draw_circle(node.x, node.y, 10, false);
		}
	}
	
	static destroy_nodes = function()
	{
		for (var i = 0; i < ds_list_size(nodes); i++) delete nodes[| i];
		ds_list_destroy(nodes);
	}
}


function Node(_x, _y, _distance, vx_added, vy_added, vx_scale, vy_scale, _fixed) constructor
{
	// Variables
	x = _x;
	y = _y;
	xPrev = _x;
	yPrev = _y;
	distance = _distance;	// Distance from previous node in the chain
	vxAdded = vx_added;		// Added every positional update
	vyAdded = vy_added;
	vxScale = vx_scale;		// Multiplier for velocity calculation
	vyScale = vy_scale;
	fixed = _fixed;			// Whether or not to apply positional updates
	
	
	// Functions
	static update_position = function()
	{
		if (!fixed)
		{
			// Calculate velocities
			var vx = (x - xPrev) * vxScale;
			var vy = (y - yPrev) * vyScale;
		
			// Update previous positions
			xPrev = x;
			yPrev = y;
		
			// Apply velocities (with added modifiers)
			x += vx + vxAdded;
			y += vy + vyAdded;
		}
	}
	
	static apply_constraints = function(prev)
	{
		// Pull nodes together if they are too far apart
		var dist = point_distance(x, y, prev.x, prev.y);
		if (dist > distance)
		{
			// Each node moves half of the difference closer to the other
			var half_diff = (dist - distance) / 2;
			
			// Get x and y increments
			var dir = point_direction(x, y, prev.x, prev.y);
			var _x = dcos(dir) * half_diff;
			var _y = dsin(dir) * half_diff;
			
			// Apply increments to both nodes
			if (!fixed)
			{
				x += _x;
				y -= _y;
			}
			if (!prev.fixed)
			{
				prev.x -= _x;
				prev.y += _y;
			}
			
		}
	}
}