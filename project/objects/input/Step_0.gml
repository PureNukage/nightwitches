keyUp = keyboard_check(ord("W"))
keyDown = keyboard_check(ord("S"))
keyLeft = keyboard_check(ord("A"))
keyRight = keyboard_check(ord("D"))

keyPlaneUp = keyboard_check(ord("R"))
keyPlaneDown = keyboard_check(ord("F"))

debugPress = keyboard_check_pressed(vk_control)

if keyUp debug.log("I am pressing W")
if keyDown debug.log("I am pressing S")
if keyLeft debug.log("I am pressing A")
if keyRight debug.log("I am pressing D")