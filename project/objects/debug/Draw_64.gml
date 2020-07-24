if on {
	var xx = 15
	var yy = 15

	with player {
		draw_text(xx,yy, "x: "+string(x)) yy += 15
		draw_text(xx,yy, "y: "+string(y)) yy += 15
		draw_text(xx,yy, "altitude: "+string(altitude))	yy += 15
		draw_text(xx,yy, "zoom_level: "+string(app.zoom_level)) yy += 15
		draw_text(xx,yy, "movespeed: "+string(movespeed)) yy += 15
		draw_text(xx,yy, "inAir: "+string(inAir)) yy += 15
		draw_text(xx,yy, "thrust: "+string(thrust)) yy += 15
		draw_text(xx,yy, "image_angle: "+string(image_angle)) yy += 15
		draw_text(xx,yy, "roll: "+string(roll)) yy += 15
		draw_text(xx,yy, "pitch: "+string(pitch)) yy += 15
		
	}
}