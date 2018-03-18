/// @desc
if(distance_to_object(obj_player) < 200){
	var _direction = point_direction(x, y,obj_player.x, obj_player.y); //direction of movement
	var _length = speed_; // distance moving
	x_speed = lengthdir_x(_length,_direction); // updating xAxis to account for diagonal speed boost
	y_speed = lengthdir_y(_length,_direction); // updating yAxis to account for diagonal speed boost

	var _speed = point_distance(0, 0, x_speed, y_speed);
	var _direction = point_direction(0, 0, x_speed, y_speed);
	if (_speed > max_speed) {
		x_speed = lengthdir_x(max_speed, _direction);
		y_speed = lengthdir_y(max_speed, _direction);
	}
}
if(place_meeting(x+x_speed, y, obj_platform)){
	if(x_speed != 0){
	for(var i = 0;i <= abs(x_speed);i++){
		if(!place_meeting(x+sign(x_speed), y, obj_platform)){
			x += sign(x_speed);
		}else{
			break;
		}
	}
	x_speed = 0;
	}
}
if(place_meeting(x, y+y_speed, obj_platform)){
	if(y_speed != 0){
	for(var i = 0;i <= abs(y_speed);i++){
		if(!place_meeting(x, y+sign(y_speed), obj_platform)){
			y += sign(y_speed);
		}else{
			break;
		}
	}
	y_speed = 0;
	}
}
x+=x_speed;
y+=y_speed;


