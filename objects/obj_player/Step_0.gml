/// @description Player Movement
var hinput = keyboard_check(vk_right) - keyboard_check(vk_left);
		switch (hp) {
			case 3:
				if(hspeed_ == 0){
					sprite_index = spr_player_idle;
					if(keyboard_check(vk_down)){
						sprite_index = spr_player_crouch_run;
						image_speed = 0;
					}else{
						image_speed = 1;
					}
				}else if(keyboard_check(vk_shift)){
					sprite_index = spr_player_walk;
					if(keyboard_check(vk_down)){
					sprite_index = spr_player_crouch_run;
					image_speed = 1;
					}else{
					image_speed = 2;
					}
				}else{
					sprite_index = spr_player_walk;
					if(keyboard_check(vk_down)){
					sprite_index = spr_player_crouch_run;
					image_speed = 1;
					}else{
					image_speed = 1;
					}
				}
		
				break;
			case 2:
				if(hspeed_ == 0){
					sprite_index = spr_player1hit_idle;
					if(keyboard_check(vk_down)){
						sprite_index = spr_player1hit_crouch_run;
						image_speed = 0;
					}else{
						image_speed = 1;
					}
				}else if(keyboard_check(vk_shift)){
					sprite_index = spr_player1hit_walk;
					if(keyboard_check(vk_down)){
					sprite_index = spr_player1hit_crouch_run;
					image_speed = 1;
					}else{
					image_speed = 2;
					}
				}else{
					sprite_index = spr_player1hit_walk;
					if(keyboard_check(vk_down)){
					sprite_index = spr_player1hit_crouch_run;
					image_speed = 1;
					}else{
					image_speed = 1;
					}
				}
				break;
			case 1:
				if(hspeed_ == 0){
					sprite_index = spr_player2hit_idle;
					if(keyboard_check(vk_down)){
						sprite_index = spr_player2hit_crouch_run;
						image_speed = 0;
					}else{
						image_speed = 1;
					}
				}else if(keyboard_check(vk_shift)){
					sprite_index = spr_player2hit_walk;
					if(keyboard_check(vk_down)){
					sprite_index = spr_player2hit_crouch_run;
					image_speed = 1;
					}else{
					image_speed = 2;
					}
				}else{
					sprite_index = spr_player2hit_walk;
					if(keyboard_check(vk_down)){
					sprite_index = spr_player2hit_crouch_run;
					image_speed = 1;
					}else{
					image_speed = 1;
					}
				}
				break;
		}
if hinput != 0 {
	image_xscale = sign(hinput);
	if(keyboard_check(vk_down)){
		hspeed_ += hinput*acceleration_/2;
		hspeed_ = clamp(hspeed_, -max_hspeed_/2, max_hspeed_/2);
	}else if(keyboard_check(vk_shift)){
		hspeed_ += hinput*acceleration_*2;
		hspeed_ = clamp(hspeed_, -max_hspeed_*2, max_hspeed_*2);
	}else{
		hspeed_ += hinput*acceleration_;
		hspeed_ = clamp(hspeed_, -max_hspeed_, max_hspeed_);
	}
} else {
	if(keyboard_check(vk_shift)){
		hspeed_ = lerp(hspeed_, 0, friction_);
	}else{
		hspeed_ = lerp(hspeed_, 0, friction_);
	}
}

if !place_meeting(x, y+1, obj_platform) {
	vspeed_ += gravity_;
} else {
	if keyboard_check_pressed(vk_space) {
		vspeed_ = jump_height_;
		if keyboard_check(vk_down){
		vspeed_ += jump_height_/2;
		}
	}
}

if(place_meeting(x+hspeed_, y, obj_platform)){
	for(var i = 0;i <= abs(hspeed_);i++) {
		if(!place_meeting(x+sign(hspeed_), y, obj_platform)){
			x += sign(hspeed_);
		}else{
			break;
		}
	}
	hspeed_ = 0;
}
x += hspeed_;

if place_meeting(x, y+vspeed_, obj_platform) {
	while !place_meeting(x, y+sign(vspeed_), obj_platform) {
		y += sign(vspeed_);
	}
	vspeed_ = 0;
}
y += vspeed_;



if(invulnerable){
	if(pulseDirection){
		image_alpha -= 0.075
		if(image_alpha <= 0.3){
			pulseDirection = false;
		}
	}else if(!pulseDirection){
		image_alpha += 0.075
		if(image_alpha >= 1){
			pulseDirection = true;
		}
	}
	if (invulnerabilityTimer < room_speed*invulnerabilityTime){
		show_debug_message("test");
		invulnerabilityTimer++;
	} else{
		image_alpha = 1;
		invulnerable = false;
		invulnerabilityTimer = 0;
		show_debug_message("can be hit");
	}
}
