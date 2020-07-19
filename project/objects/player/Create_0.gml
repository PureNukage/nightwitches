movespeed = 0
movespeedMax = 5
altitude = 30
altitudeMax = 200
inAir = false

function ascend(up, down) {
	
	//	The speed the plane will ascend/descend	
	var flightSpeed = 0.0035
	
	//	Ascending!
	if up and altitude < altitudeMax {
		app.zoom_level += flightSpeed
		altitude++
		if altitude >= altitudeMax altitude = altitudeMax
		image_angle = 20
	}
	//	Descending!
	else if down {
		app.zoom_level -= flightSpeed
		altitude--
		image_angle = 340	
		//if altitude < 90 altitude--
	}
	//	Flying level
	else {
		image_angle = 0	
	}
}