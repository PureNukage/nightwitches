version = "0.0.0"


instance_create_layer(0,0,"Instances",time)
instance_create_layer(0,0,"Instances",input)
instance_create_layer(0,0,"Instances",debug)
instance_create_layer(0,0,"Instances",gui)


surfaceGroundX = 0
surfaceGround = -1

function surfaceGroundCreate() {
	surfaceGround = surface_create(room_width,room_height)
	surface_set_target(surfaceGround)
	var Layer = layer_get_id("ground")
	var map = layer_tilemap_get_id(Layer)
	draw_tilemap(map,0,0)
	surface_reset_target()
	layer_depth(Layer, 201)
} 

function drawSurfaceGround() {
	if surface_exists(surfaceGround) {
		if surfaceGroundX == 0 {
			draw_surface(surfaceGround,0,0)	
		} 
		
		else {
			draw_surface(surfaceGround,surfaceGroundX,0)
			var otherX = room_width + surfaceGroundX
			draw_surface(surfaceGround,otherX,0)
		}
		if instance_exists(player) surfaceGroundX -= player.movespeed
		if (surfaceGroundX <= room_width * -1) surfaceGroundX = 0
	}
	
	else {
		surfaceGroundCreate()
	}
}





#region Camera

	width = 1920
	height = 1080

	#region Views

		view_enabled = true
		view_visible[0] = true

		view_set_visible(0,true)

		view_set_wport(0,width)
		view_set_hport(0,height)

	#endregion
	#region Resize and Center Game Window

		window_set_rectangle((display_get_width()-view_wport[0])*0.5,(display_get_height()-view_hport[0])*0.5,view_wport[0],view_hport[0])
	
		surface_resize(application_surface,view_wport[0],view_hport[0])
	
		display_set_gui_size(width,height)


	#endregion
	#region Camera Create

		camera = camera_create()

		var viewmat = matrix_build_lookat(width,height,-10,width,height,0,0,1,0)
		var projmat = matrix_build_projection_ortho(width,height,1.0,32000.0)

		camera_set_view_mat(camera,viewmat)
		camera_set_proj_mat(camera,projmat)
	
		camera_set_view_pos(camera,x,y)
		camera_set_view_size(camera,width,height)
	
		camera_set_view_speed(camera,200,200)
		camera_set_view_border(camera,width,height)
	
		camera_set_view_target(camera,id)

		view_camera[0] = camera

	#endregion
	
	function scale_canvas(new_width, new_height) {
		window_set_size(new_width, new_height)
	
		//if center {
		//	centerWindow = true
		//}
	
		surface_resize(application_surface,new_width,new_height)
	}
	
	//scale_canvas(1280,720)
	
	zoom_level = .45
	default_zoom_width = camera_get_view_width(camera)
	default_zoom_height = camera_get_view_height(camera)

#endregion