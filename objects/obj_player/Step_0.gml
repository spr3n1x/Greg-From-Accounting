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
		break;
	#endregion
	case playerStates.run:
	#region run
	break;
	#endregion
}