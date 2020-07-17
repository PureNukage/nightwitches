if instance_exists(player) image_angle = point_direction(x,y,player.x,player.y)

x -= 2

if x < -100 {
	x = room_width+100	
}