//	I am alive!
if alive {
	//	Check for inputs 
	hspd = input.keyRight - input.keyLeft
	vspd = input.keyDown - input.keyUp

	//	Determine the scale of the shadow
	if altitude < altitudeMax {
		scale = (altitudeMax - altitude) / (altitudeMax*2)
	} else scale = 1
	
	//	Ignition toggle check
	if input.keyPlaneIgnition {
		engineOn = !engineOn
		image_speed = engineOn
	}

	//	We are in the air!
	if inAir {
	
		//	If the engine is on, lets check for ascending/descending
		if engineOn ascend(input.keyRight, input.keyLeft)
		//	The engine is not on, lets descend
		else {
			var flightSpeed = 0.0035
			app.zoom_level -= flightSpeed
			altitude--
			thrust--
			image_angle = 0 - (-1*(((thrust / thrustMax) * 20)))	
		}
	
		//	I am touching the ground!
		if altitude <= 30 {
			//	Touching too fash, that's a plane crash
			if abs(thrust) > 20 {
				var Boom = instance_create_layer(x,y,"Instances",explosion)
				Boom.sprite_index = s_explosion
				alive = false
			}
			//	I have landed!
			else {
				inAir = false	
			}
		}
	
		//	Apply movement
		if (hspd != 0 or vspd != 0) and engineOn {
			var Direction = point_direction(0,0,hspd,vspd)

			y += lengthdir_y(movespeed, Direction)
			y = clamp(y, 0 + sprite_get_height(sprite_index)/2, room_height - sprite_get_height(sprite_index)/2)
		}
	}
	
	//	We are on the ground!
	else {
		
		//	The engine is on
		if engineOn {
			
			//	Accelerating
			if (hspd > 0) {
				movespeed += 0.03
				movespeed = clamp(movespeed,0,movespeedMax)
		
				if movespeed >= 5 {
					altitude++
					if altitude >= 30 {//and vspd < 0 {
						inAir = true
					}
					altitude = clamp(altitude,0,30)
				}

			} 
				
			//	Decelerating 
			else if (hspd < 0) {
				movespeed -= 0.03	
				movespeed = clamp(movespeed,0,movespeedMax)
			}
		}
		//	The engine is off
		else {
			if movespeed > 0 movespeed -= 0.03
			else movespeed = 0
		}
	}
}
//	I am ded
else {
	sprite_index = s_plane_crashed
	movespeed = 0
	altitude = 0
	scale = 1
}


depth = -1