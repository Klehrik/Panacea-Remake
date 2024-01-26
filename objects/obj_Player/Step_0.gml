/// obj_Player : Step

// Jump input
jumpBuffer--;
isJumpingThisFrame = false;
if (input_check_pressed("jump")) jumpBuffer = jumpBufferMax;

// Set variables for later (when applying forces)
var maxVsp = maxVspFall;
var gravityValue = grav;

// Change vertical velocity in water
if (isSubmerged)
{
	maxVsp = grav * 4;
	gravityValue = grav / 4;
}

// Subtract breath
if (position_meeting(x, y - 4, obj_Water)) breath = max(breath - 1, 0);
else breath = min(breath + 4, breathMax);

// Reset jump count
if (isGrounded or isSubmerged) jumpCount = jumpCountMax;


#region Logic States
	
	#region Main
	
		switch (state)
		{
			#region Free
			case "Free":
				
				var sum = input_check("left") + input_check("right");
				
				// Move
				if (canMoveHorizontally)
				{
					// Get acceleration value (lower when gliding)
					var acc = acceleration;
					if (input_check("jump") and vsp > 0 and !isSubmerged) acc = accelerationGlide;
					
					// Get inputs
					if (sum != 1)
					{
						hsp -= acc * sign(hsp);
						if (abs(hsp) < acc) hsp = 0;
					}
					else if (input_check("left")) hsp -= acc;
					else if (input_check("right")) hsp += acc;
					
					// Clamp speed to maximum (halved when underwater)
					var _max = moveSpeed;
					if (isSubmerged) _max *= 0.5;
					hsp = clamp(hsp, -_max, _max);
				}
				else
				{
					// Apply friction
					if (isGrounded) hsp *= frictionFactor;
					else hsp *= frictionFactorAir;
				}
				
				if (!isSubmerged)
				{
					// Jump
					if (jumpBuffer > 0 and jumpCount > 0)
					{
						vsp = -jumpHeight;
						jumpCount--;
						jumpBuffer = 0;
						isJumpingThisFrame = true;
					}
				}
				else
				{
					// Swim upwards
					if (input_check("jump")) vsp = -jumpHeight / 2;
				}
				if (input_check_released("jump") and vsp < 0) vsp /= 2;	// Variable jump height
		
				// Glide
				if (input_check("jump") and vsp > 0 and !isSubmerged) maxVsp = maxVspGlide;
				
				// Crouch/Fast fall
				else if (input_check("down"))
				{
					if (isGrounded) state = "Crouch";
					else if (isSubmerged)
					{
						maxVsp = grav * 12;
						gravityValue = grav;
					}
					else
					{
						maxVsp = maxVspFall * 1.5;
						gravityValue = grav * 3;
					}
				}
				
				
				
				#region Animation
				if (state == "Free")
				{
					// Change sprite
					if (isGrounded)
					{
						if (sum == 1) sprite_index = spr_PlayerRun;
						else sprite_index = spr_PlayerIdle;
						image_speed = 1;
						if (isGroundedThisFrame) image_index = 3;	// Looks better after landing
					}
					else
					{
						if (vsp > 0)
						{
							if (sprite_index != spr_PlayerFall and sprite_index != spr_PlayerAttackFall)
							{
								sprite_index = spr_PlayerFall;
								image_index = 0;
								image_speed = 1;
							}
							if (image_index >= 2) image_speed = 0;
						}
						else sprite_index = spr_PlayerJump;
					}
			
					// Flip
					if (sum == 1)
					{
						if (input_check("left")) image_xscale = -1;
						if (input_check("right")) image_xscale = 1;
					}
					
					// Glide particles
					if (input_check("jump") and vsp >= maxVspGlide and !isSubmerged)
					{
						create_particle("Glide", x - 6, y - 4);
						create_particle("Glide", x + 6, y - 4);
					}
			
					// Fast fall stretch
					if (input_check("down") and !input_check("jump")) set_squash_and_stretch("v", stretchValue);
			
					// Head feather offsets
					feather1Offsets = {x: -1, y: -7};
					feather2Offsets = {x: -1, y: -6};
				}
				#endregion
			
				break;
			#endregion
			
			#region Crouch
			case "Crouch":
				
				// Apply slide friction
				hsp *= frictionFactor;
			
				// Get up
				if (!input_check("down") or !isGrounded) state = "Free";
				
				
				
				#region Animation
				if (state == "Crouch")
				{
					sprite_index = spr_PlayerCrouch;
			
					// Head feather offsets
					feather1Offsets = {x: -1, y: -4};
					feather2Offsets = {x: -1, y: -3};
				}
				#endregion
			
				break;
			#endregion
			
			#region Wake
			case "Wake":
				
				hsp = 0;
				vsp = max(0, vsp);
				stateAction = "Freeze";
				canMoveHorizontally = true;
				
				
				
				#region Animation
				if (state == "Wake")
				{
					// Start animation
					if (sprite_index != spr_PlayerWake)
					{
						sprite_index = spr_PlayerWake;
						image_index = 0;
						image_speed = 1;
					}
				
					// Allow player control
					else
					{
						if (image_index >= 45)
						{
							state = "Free";
							stateAction = "Free";
						}
					}
				
					// Head feather offsets
					feather1Offsets = {x: -1, y: -4};
					feather2Offsets = {x: -1, y: -3};
				}
				#endregion
				
				break;
			#endregion
			
			
			
			// Unused now lol
			#region Cutscene - Run Right
			case "Cutscene - Run Right":
				
				hsp = 1;
				
				
				
				#region Animation
				if (state == "Cutscene - Run Right")
				{
					sprite_index = spr_PlayerRun;
				}
				#endregion
				
				break;
			#endregion
			
			#region Cutscene - Jump Right
			case "Cutscene - Jump Right":
				
				if (isGrounded) vsp = -jumpHeight;
				
				
				
				#region Animation
				if (state == "Cutscene - Jump Right")
				{
					if (isGrounded)
					{
						sprite_index = spr_PlayerJump;
						image_speed = 0;
						image_index = 0;
						set_squash_and_stretch("v", stretchValue);
					}
				
					// Change sprite when falling
					if (vsp >= 0)
					{
						if (sprite_index != spr_PlayerFall)
						{
							sprite_index = spr_PlayerFall;
							image_index = 0;
							image_speed = 1;
						}
						if (image_index >= 2) image_speed = 0;
					}
				}
				#endregion
				
				break;
			#endregion
		}
	
	#endregion
	
	#region Action
	
		switch (stateAction)
		{
			#region Free
			case "Free":
				
				// Breathe fire
				if (input_check("fire"))
				{
					stateAction = "Fire";
					canMoveHorizontally = false;
				}
				
				break;
			#endregion
			
			#region Fire
			case "Fire":
				
				// Create fire particles
				if (global.frame mod 2 == 0)
				{
					var y_offset = -3;
					if (state == "Crouch") y_offset = 1;
					
					var fire = instance_create_depth(x + (image_xscale * 6) - 1, y + y_offset, 0, obj_Fire);
					fire.dir = random_range(-12, 15);
					if (image_xscale < 0) fire.dir = random_range(165, 192);
					if (state == "Crouch")
					{
						fire.dir = random_range(0, 15);
						if (image_xscale < 0) fire.dir = random_range(165, 180);
					}
				}
				
				// Halt
				if (!input_check("fire"))
				{
					stateAction = "Free";
					canMoveHorizontally = true;
				}
				
				
				
				#region Animation
				if (stateAction == "Fire")
				{
					// Default attack sprite
					if (vsp == 0) sprite_index = spr_PlayerAttack;
					
					else if (vsp < 0) sprite_index = spr_PlayerAttackJump;
					
					// Falling
					else
					{
						sprite_index = spr_PlayerAttackFall;
						if (image_index >= 2) image_speed = 0;
					}
				
					// Crouching
					if (state == "Crouch") sprite_index = spr_PlayerAttackCrouch;
				}
				#endregion
				
				break;
			#endregion
		}
	
	#endregion
	
#endregion


// Set squash and stretch
if (isJumpingThisFrame) set_squash_and_stretch("v", stretchValue);
if (isGroundedThisFrame) set_squash_and_stretch("h", stretchValue);

if ((isJumpingThisFrame or isGroundedThisFrame) and !isSubmerged) create_particle("Dust", x, bbox_bottom);

// Update position
apply_collisions_and_forces(gravityValue, maxVsp);
