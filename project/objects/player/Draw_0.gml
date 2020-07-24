//	Draw shadow
if scale < 1 {
	draw_sprite_ext(sprite_index, 21, x, y-(sprite_get_height(sprite_index)/4)+altitude, scale, scale, image_angle, c_black, scale)	
}

//	Draw the spritestacked plane
for(var i=0;i<sprite_get_number(sprite_index);i++)	{
	//draw_sprite_ext(sprite_index,i,x,y-i,scale,scale,image_angle,c_white,1)
	draw_sprite_ext(sprite_index,i,x+(roll*i),y-i+(pitch*i),app.zoom_level,app.zoom_level,image_angle,c_white,1)	
}
