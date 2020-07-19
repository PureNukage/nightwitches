function worldSpeed() {
	
	if instance_exists(player) {
		x -= player.movespeed	
	}
	else {
		if time.seconds_switch debug.log("ERROR Player doesn't exist")	
	}
	
}

function draw_reset() {
	draw_set_color(c_black)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_font(-1)
	draw_set_alpha(1)
}