hspd = input.keyRight - input.keyLeft
vspd = input.keyDown - input.keyUp

var flightSpeed = 0.004

if input.keyPlaneUp {
	app.zoom_level += flightSpeed
	altitude++
	image_angle = 20
}

else if input.keyPlaneDown {
	app.zoom_level -= flightSpeed
	altitude--
	image_angle = 340	
	if altitude < 90 altitude--
}

else {
	image_angle = 0	
}

if altitude < 250 {
	scale = (250 - altitude) / 250
} else scale = 1

if altitude <= 20 {
	//game_restart()
	var Boom = instance_create_layer(x,y,"Instances",explosion)
	Boom.sprite_index = s_explosion
	instance_destroy()
}

if (hspd != 0 or vspd != 0) {
	var Direction = point_direction(0,0,hspd,vspd)

	x += lengthdir_x(movespeed, Direction)
	y += lengthdir_y(movespeed, Direction)
}

depth = -1