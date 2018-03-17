/// @desc

switch (playerState) {
	case playerStates.idle:
	#region idle
	//checking HitPoints
	// changing sprite index and speed based on how many hits you have taken
		switch (hp) {
			case 3:
				sprite_index = spr_player_idle;
				image_index = 0;
				image_speed = 1;
			break;
			case 2:
				sprite_index = spr_player1hit_idle;
				image_index = 0;
				image_speed = 1.5;
			break;
			case 1:
				sprite_index = spr_player2hit_idle;
				image_index = 0;
				image_speed = 2;
			break;
		}
		//checking if the left or right keys are pressed
		if(keyboard_check(ord("D"))||keyboard_check(ord("A"))){
			playerState = playerStates.walk;
			//checking if you press the run key
			if(keyboard_check(vk_shift)){
				playerState = playerStates.run;
			}
		}
		//check if you pressed the crouch button
		if(keyboard_check(ord("S"))){
			playerState = playerStates.crouch;
		}
		//check if you have pressed the jump button
		if(keyboard_check(vk_space)){
			playerState = playerStates.jump;
		}
		break;
	#endregion
	case playerStates.walk:
	#region walk
	//set the sprite index to the walk animation
	sprite_index = spr_player_idle;
		//check if the right key is pressed
		if(keyboard_check(ord("D"))){
			x_speed+=acceleration;
			if(x_speed > max_speed){
				x_speed = max_speed;
			}
		}
		//check if the left key is pressed
		if(keyboard_check(ord("A"))){
			x_speed-=acceleration;
			if(x_speed < -max_speed){
				x_speed = -max_speed;
			}
		}
		//check if you are moving right
		if(x_speed > 0){
			image_xscale = 1;
		}//check if you are moving left
		else if (x_speed < 0){
			image_xscale = -1;
		}
		//check if you are pressing the run key
		if(keyboard_check(vk_shift)){
			playerState = playerStates.run;
		}
		//checking if you are not pressing left or right and you are moving right
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed > 0){
			x_speed -= pFriction;
		}
		//checking if you are not pressing left or right and you are moving right
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed < 0){
			x_speed += pFriction;
		}
		//checking if you are not pressing left or right and you are not moving
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed == 0){
			playerState = playerStates.idle;
		}
		//add the speed to the players x value
		else{
			x+=x_speed;
		}
		//check if you are pressing the crouch button
		if(keyboard_check(ord("S"))){
			playerState = playerStates.crouch;
		}
		//check if you are pressing the jump button
		if(keyboard_check(vk_space)){
			playerState = playerStates.jump;
		}
		break;
	#endregion
	case playerStates.run:
	#region run
		//check if the right key is pressed
		if(keyboard_check(ord("D"))){
			x_speed+=acceleration*1.5;
			if(x_speed > max_speed*2){
				x_speed = max_speed*2;
			}
		}
		//check if the left key is pressed
		if(keyboard_check(ord("A"))){
			x_speed-=acceleration*1.5;
			if(x_speed < -max_speed*2){
				x_speed = -max_speed*2;
			}
		}
		//check if you are moving right
		if(x_speed > 0){
			image_xscale = 1;
		}//check if you are moving left
		else if (x_speed < 0){
			image_xscale = -1;
		}
		//check if the shift key is not pressed down
		if(!keyboard_check(vk_shift)){
			playerState = playerStates.walk;
		}
		//checking if you are not pressing left or right and you are moving right
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed > 0){
			x_speed -= pFriction;
		}
		//checking if you are not pressing left or right and you are moving left
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed < 0){
			x_speed += pFriction;
		}
		//checking if you are not pressing left or right and you are not moving
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed == 0){
			playerState = playerStates.idle;
		}//add the speed to the players x value
		else{
			x+=x_speed;
		}
		//check if you are pressing the crouch button
		if(keyboard_check(ord("S"))){
			playerState = playerStates.crouch;
		}
		//check if you are pressing the jump button
		if(keyboard_check(vk_space)){
			playerState = playerStates.jump;
		}
		
		break;
	#endregion
	case playerStates.jump:
	#region jump
	if(jump){
		jump = false;
		y_speed = -3;
	}else{
		y_speed+=jGravity;
	}
	y+=y_speed;
		
		if(keyboard_check(vk_shift)){
			//playerState = playerStates.run;
			if(keyboard_check(ord("D"))){
			x_speed+=acceleration*1.5;
			if(x_speed > max_speed*2){
				x_speed = max_speed*2;
			}
		}
		if(keyboard_check(ord("A"))){
			x_speed-=acceleration*1.5;
			if(x_speed < -max_speed*2){
				x_speed = -max_speed*2;
			}
		}
		}else{
			//playerState = playerStates.walk;
			if(keyboard_check(ord("D"))){
			x_speed+=acceleration;
			if(x_speed > max_speed){
				x_speed = max_speed;
			}
		}
		if(keyboard_check(ord("A"))){
			x_speed-=acceleration;
			if(x_speed < -max_speed){
				x_speed = -max_speed;
			}
		}
		}
		if(x_speed > 0){
			image_xscale = 1;
		}else if (x_speed < 0){
			image_xscale = -1;
		}
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed > 0){
			x_speed -= pFriction;
		}
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed < 0){
			x_speed += pFriction;
		}
		x+=x_speed;
	break;
	#endregion
}