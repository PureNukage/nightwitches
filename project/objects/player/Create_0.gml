movespeed = 0
movespeedMax = 5
altitude = 30
altitudeMax = 200
inAir = false
thrust = 0
thrustMax = 100
alive = true
engineOn = false
image_speed = 0


function ascend(up, down) {
	
	//	The speed the plane will ascend/descend	
	var flightSpeed = 0.0035
	
	//	Ascending!
	if up and altitude < altitudeMax {
		app.zoom_level += flightSpeed
		altitude++
		thrust++
		if altitude >= altitudeMax altitude = altitudeMax
		image_angle = 0 + floor(((thrust / thrustMax) * 20))
	}
	//	Descending!
	else if down {
		app.zoom_level -= flightSpeed
		altitude--
		thrust--
		image_angle = 0 - (-1*(((thrust / thrustMax) * 20)))
	}
	//	Flying level
	else {
		if image_angle != 0 {
			if (image_angle < 21 and image_angle > 0) image_angle = 0 - (-1*(((thrust / thrustMax) * 20)))
			else if (image_angle < 0) image_angle = 0 + ((thrust / thrustMax) * 20)
		}
		if thrust > 0 thrust--
		else if thrust < 0 thrust++
		
		if thrust != 0 {
			app.zoom_level += sign(thrust) * flightSpeed
			altitude += sign(thrust)
			altitude = clamp(altitude,0,altitudeMax)
		}
	}
	
	thrust = clamp(thrust,thrustMax*-1,thrustMax)
}