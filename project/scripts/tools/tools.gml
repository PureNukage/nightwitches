function worldSpeed() {
	
	if instance_exists(player) {
		x -= player.movespeed	
	}
	else {
		if time.seconds_switch debug.log("ERROR Player doesn't exist")	
	}
	
}