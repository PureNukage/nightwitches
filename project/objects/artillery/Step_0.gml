if alive {

	//	Aim at the player
	if instance_exists(player) image_angle = point_direction(x,y,player.x,player.y)
	
	//	If I get blowed up I'm dead
	if place_meeting(x,y,explosion) {
		alive = false
		sprite_index = s_artillery_rubble
	}

}

//	Move to the left
worldSpeed()

//	If off screen to the left, move off screen to the right
if x < -100 {
	x = room_width+100	
}