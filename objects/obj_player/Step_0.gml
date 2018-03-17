/// @desc

switch (playerState) {
	case playerStates.idle:
	#region idle
		sprite_index = spr_player;
		break;
	#endregion
	case playerStates.walk:
	#region walk
	sprite_index = spr_player;
		break;
	#endregion
	case playerStates.run:
	#region run
	break;
	#endregion
}