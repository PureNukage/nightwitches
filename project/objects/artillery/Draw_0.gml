//	Draw the sprite slices and assemble the model
for(var i=0;i<sprite_get_number(sprite_index);i++) {
	draw_sprite_ext(sprite_index, i, x, y-i, 1,1, image_angle, c_white, 1)
}