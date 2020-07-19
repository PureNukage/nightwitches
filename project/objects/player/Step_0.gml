if alive {
	//	Check for inputs 
	hspd = input.keyRight - input.keyLeft
	vspd = input.keyDown - input.keyUp

	//	Determine the scale of the shadow
	if altitude < altitudeMax {
		scale = (altitudeMax - altitude) / (altitudeMax*2)
	} else scale = 1

	if inAir {
	
		ascend(input.keyRight, input.keyLeft)
	
		//	Crashing!
		if altitude <= 30 {
			if abs(thrust) > 20 {
				var Boom = instance_create_layer(x,y,"Instances",explosion)
				Boom.sprite_index = s_explosion
				alive = false
			}
			
			else {
				inAir = false	
			}
		}
	
		//	Apply movement
		if (hspd != 0 or vspd != 0) {
			var Direction = point_direction(0,0,hspd,vspd)

			//var XX = x + lengthdir_x(movespeed, Direction)
			//if (XX < (camera_get_view_x(app.camera) + camera_get_view_width(app.camera)/2)) 
			//x += lengthdir_x(movespeed, Direction)
			y += lengthdir_y(movespeed, Direction)
			y = clamp(y, 0 + sprite_get_height(sprite_index)/2, room_height - sprite_get_height(sprite_index)/2)
		}
	}

	else {
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
			x += movespeed
		
			//var XX = x + movespeed
			//if (XX < (camera_get_view_x(app.camera) + camera_get_view_width(app.camera)/2)) x += movespeed
		} else if (hspd < 0) {
			movespeed -= 0.03	
			movespeed = clamp(movespeed,0,movespeedMax)
		}
	}
}

else {
	sprite_index = s_plane_crashed
	movespeed = 0
	altitude = 0
	scale = 1
}


depth = -1