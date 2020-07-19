draw_sprite(sprite_index,image_index,x,y)

//	If animation has ended
if image_index >= image_number - 1 {
	instance_destroy()	
}

depth = -1