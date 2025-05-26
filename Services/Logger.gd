extends Node


func log(a, b = GD_UNDEF, c = GD_UNDEF):
	var to_print = ["Logger ", multiplayer.get_unique_id(), ": ",a]
	if GD_UNDEF.is_defined(b): 
		to_print.append(" ")
		to_print.append(b)
	if GD_UNDEF.is_defined(c): 
		to_print.append(" ")
		to_print.append(c)
	print.callv(to_print)
	
func error(a, b = GD_UNDEF, c = GD_UNDEF):
	var to_print = ["Error ", multiplayer.get_unique_id(), ": ",a]
	if GD_UNDEF.is_defined(b): 
		to_print.append(" ")
		to_print.append(b)
	if GD_UNDEF.is_defined(c): 
		to_print.append(" ")
		to_print.append(c)
	print.callv(to_print)
