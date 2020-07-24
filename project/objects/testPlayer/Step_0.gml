if input.keyLeft image_angle++
if input.keyRight image_angle--

pitch += (keyboard_check(ord("Q")) - keyboard_check(ord("E"))) / 10
roll += (keyboard_check(ord("Z")) - keyboard_check(ord("C"))) / 10