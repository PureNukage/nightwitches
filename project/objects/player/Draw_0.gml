if scale < 1 draw_sprite_ext(sprite_index,image_index,x,y+(altitude-altitude*(1-app.zoom_level)),scale,scale,image_angle,c_black,scale)

draw_sprite_ext(sprite_index,image_index,x,y,app.zoom_level,app.zoom_level,image_angle,c_white,1)