hspd = input.keyRight - input.keyLeft
vspd = input.keyDown - input.keyUp

var Direction = point_direction(0,0,hspd,vspd)

x += lengthdir_x(movespeed, Direction)
y += lengthdir_y(movespeed, Direction)