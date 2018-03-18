
/// @description Create the variables
hspeed_ = 0;
max_hspeed_ = 6;
vspeed_ = 0;
gravity_ = 1;
acceleration_ = 3;
friction_ = 1;
jump_height_ = -15;
// Map the keys
keyboard_set_map(ord("W"), vk_up);
keyboard_set_map(ord("A"), vk_left);
keyboard_set_map(ord("S"), vk_down);
keyboard_set_map(ord("D"), vk_right);


invulnerable = false;
invulnerabilityTime = 1.5;
invulnerabilityTimer = 0;
pulseDirection = false;
hp = 3;
