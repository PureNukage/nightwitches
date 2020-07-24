movespeed = 0
movespeedMax = 5
altitude = 30
altitudeMax = 200
inAir = false
thrust = 0
thrustMax = 100
alive = true
engineOn = false
pitch = 0
roll = 0
image_speed = 0


function ascend(up, down) {
	
	//	The speed the plane will ascend/descend	
	var flightSpeed = 0.0035
	var Roll = 0.004
	
	//	Ascending!a
	if up and altitude < altitudeMax {
		app.zoom_level += flightSpeed
		altitude++
		thrust++
		if altitude >= altitudeMax altitude = altitudeMax
		roll -= Roll
	}
	//	Descending!
	else if down {
		app.zoom_level -= flightSpeed
		altitude--
		thrust--
		roll += Roll
	}
	//	Flying level
	else {

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