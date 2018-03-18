/// @desc
/// @function

if not instance_exists(target) exit;

x = lerp(x, target.x, 0.1);
y = lerp(y, target.y, 0.1);

x = round_n(x, scale);
y = round_n(y, scale);

x = clamp(x, width/2 + CELL_WIDTH , room_width);
y = clamp(y, height/2 + CELL_HEIGHT , room_height);

camera_set_view_pos(view_camera[0], x-width/2, y-height/2);
