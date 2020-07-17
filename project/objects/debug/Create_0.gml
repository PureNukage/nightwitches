on = false

function log(String) {
	
	var Time = "[" + string(time.stream) + "] " 
	
	var objectName = string_upper(object_get_name(other.object_index))
	
	var fullMessage = Time + objectName + " " + String
	
	show_debug_message(fullMessage)
}