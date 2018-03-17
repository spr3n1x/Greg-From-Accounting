/// @desc

switch (playerState) {
	case playerStates.idle:
	#region idle
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
				image_index = 2;
			break;
		}
		if(keyboard_check(ord("D"))||keyboard_check(ord("A"))){
			playerState = playerStates.walk;
		}
		break;
	#endregion
	case playerStates.walk:
	#region walk
		sprite_index = spr_player_idle;
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
		if(x_speed > 0){
			image_xscale = 1;
		}else if (x_speed < 0){
			image_xscale = -1;
		}
		if(keyboard_check(vk_shift)){
			playerState = playerStates.run;
		}
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed > 0){
			x_speed -= pFriction;
		}
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed < 0){
			x_speed += pFriction;
		}
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed == 0){
			playerState = playerStates.idle;
		}else{
			x+=x_speed;
		}
		if(keyboard_check(vk_space)){
			playerState = playerStates.jump;
		}
		break;
	#endregion
	case playerStates.run:
	#region run
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
		if(x_speed > 0){
			image_xscale = 1;
		}else if (x_speed < 0){
			image_xscale = -1;
		}
		if(!keyboard_check(vk_shift)){
			playerState = playerStates.walk;
		}
		
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed > 0){
			x_speed -= pFriction;
		}
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed < 0){
			x_speed += pFriction;
		}
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed == 0){
			playerState = playerStates.idle;
		}else{
			x+=x_speed;
		}
		if(keyboard_check(vk_space)){
			playerState = playerStates.jump;
		}
		
		break;
	#endregion
	case playerStates.jump:
	#region jump
	if(jump){
		jump = false;
	}
		
		if(keyboard_check(vk_shift)){
			playerState = playerStates.run;
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
			playerState = playerStates.walk;
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
		if(!keyboard_check(ord("A")) && !keyboard_check(ord("D")) && x_speed == 0){
			playerState = playerStates.idle;
		}else{
			x+=x_speed;
		}
		if(keyboard_check(vk_space) || collision_rectangle(x-5, y+3, x+5 ,y-2, self ,false, false)){
			playerState = playerStates.jump;
		}
	break;
	#endregion
}