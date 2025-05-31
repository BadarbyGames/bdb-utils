extends Node	

static func _log(prefix, a = GD_UNDEF, b = GD_UNDEF, c = GD_UNDEF):
	var to_print = [prefix, ": "]
	if  GD_UNDEF.is_defined(a): 
		to_print.append(" ")
		to_print.append(a)
	if GD_UNDEF.is_defined(b): 
		to_print.append(" ")
		to_print.append(b)
	if GD_UNDEF.is_defined(c): 
		to_print.append(" ")
		to_print.append(c)
	print.callv(to_print)

static func log(correlation_id, a, b = GD_UNDEF, c = GD_UNDEF):
	if correlation_id == null:
		correlation_id = Time.get_ticks_msec()
	_log(str("[LOG ", get_peer_id(), " cid: ",correlation_id,"]"), a,b,c)
	
static func warn(correlation_id, a, b = GD_UNDEF, c = GD_UNDEF):
	if correlation_id == null:
		correlation_id = Time.get_ticks_msec()
	_log(str("[WARN ", get_peer_id(), " cid: ",correlation_id,"]"), a,b,c)
	
static func error(correlation_id, a, b = GD_UNDEF, c = GD_UNDEF):
	if correlation_id == null:
		correlation_id = Time.get_ticks_msec()
	
	var prefix = str("[ERROR ", get_peer_id(), " cid: ",correlation_id,"]")
	_log(prefix,a,b,c)
	for ln in get_stack():
		_log(prefix,str(ln.source," ",ln.function,":",ln.line))

static func get_peer_id():
	if Engine.is_editor_hint():
		return "@ editor"
	else:
		return Engine.get_main_loop().get_multiplayer().get_unique_id()
