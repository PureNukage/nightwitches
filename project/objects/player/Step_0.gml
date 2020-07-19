//	Check for inputs 
hspd = input.keyRight - input.keyLeft
vspd = input.keyDown - input.keyUp

//	The speed the plane will ascend/descend	
var flightSpeed = 0.0035

//	Ascending!
if input.keyPlaneUp {
	app.zoom_level += flightSpeed
	altitude++
	if altitude >= 200 altitude = 200
	image_angle = 20
}
//	Descending!
else if input.keyPlaneDown {
	app.zoom_level -= flightSpeed
	altitude--
	image_angle = 340	
	//if altitude < 90 altitude--
}
//	Flying level
else {
	image_angle = 0	
}

//altitude = 19 + (200 - 19) * app.zoom_level;

//	Determine the scale of the shadow
if altitude < 200 {
	scale = (200 - altitude) / 400
} else scale = 1

//	Crashing!
if altitude <= 30 {
	//game_restart()
	var Boom = instance_create_layer(x,y,"Instances",explosion)
	Boom.sprite_index = s_explosion
	instance_destroy()
}

//	Apply movement
if (hspd != 0 or vspd != 0) {
	var Direction = point_direction(0,0,hspd,vspd)

	x += lengthdir_x(movespeed, Direction)
	y += lengthdir_y(movespeed, Direction)
}

depth = -1