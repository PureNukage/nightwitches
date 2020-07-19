var centerX = display_get_gui_width()/2
var centerY = display_get_gui_height()/2


var dashWidth = 200
var dashHeight = 80
draw_set_color(c_black)
draw_roundrect(centerX-2,80-2,centerX+dashWidth+2,80+dashHeight+2,false)

draw_set_color(c_dkgray)
draw_roundrect(centerX,80,centerX+dashWidth,80+dashHeight,false)

draw_set_color(c_white)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
var String = ""
if player.engineOn String = "On"
else String = "Off"
draw_text(centerX+dashWidth/2,80+dashHeight/2,"Engine: "+String)

draw_reset()
