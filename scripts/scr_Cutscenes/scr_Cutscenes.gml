/// Cutscenes

// fuck cutscenes bro im allowing pull player action during them now

//function CutsceneManager() constructor
//{
//	// Variables
//	time = 0;
//	timeMax = 0;
//	isPlaying = false;
//	name = "";
	
	
//	// Functions
//	static start_cutscene = function(_name)
//	{
//		if (_name == "") return;
//		time = 0;
//		isPlaying = true;
//		name = _name;
//	}
		
//	static run_cutscene = function()
//	{
//		if (isPlaying)
//		{
//			switch (name)
//			{
//				#region Intro Jump
//				case "Intro Jump":
				
//					timeMax = 140;
					
//					var player = obj_Player;
//					player.stateAction = "Freeze";
					
//					// Timeline (i love hardcoding things lmao)
//					if (time == 0) player.state = "Cutscene - Run Right";
//					if (time == 60) player.state = "Cutscene - Jump Right";
//					if (time > 60 and player.isGrounded) player.freeze();
//					if (time >= timeMax) player.reset_states();
				
//					break;
//				#endregion
				
				
				
//				default:
//					isPlaying = false;
//					break;
//			}
			
//			if (time >= timeMax) isPlaying = false;
//			time++;
//		}
//	}
//}