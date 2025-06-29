extends Object

class_name InstanceLogger

const LEVEL_WARN = 0
const LEVEL_ERROR = 1
const LEVEL_LOG = 2
const LEVEL_INF = 3

var source:String

func _init(_source) -> void:
	source = _source

func _log(prefix, a = GD_UNDEF, b = GD_UNDEF, c = GD_UNDEF, d = GD_UNDEF):
	var to_print = [prefix + ": "]
	if GD_UNDEF.is_defined(a): to_print.append_array([&" ",a])
	if GD_UNDEF.is_defined(b): to_print.append_array([&" ",b])
	if GD_UNDEF.is_defined(c): to_print.append_array([&" ",c])
	if GD_UNDEF.is_defined(d): to_print.append_array([&" ",d])
	print.callv(to_print)
	
func error(correlation_id, a, b = GD_UNDEF, c = GD_UNDEF, d = GD_UNDEF):
	if LEVEL_ERROR > ProjectSettings.get("kkSettings/log_level"): return
	if correlation_id == null:
		correlation_id = Time.get_ticks_msec()
	
	var prefix = str("[ERROR pid:", get_peer_id()," source: ",source, " cid: ",correlation_id,"]")
	_log(prefix,a,b,c,d)
	for ln in get_stack():
		_log(prefix,str(ln.source," ",ln.function,":",ln.line))

func warn(correlation_id, a, b = GD_UNDEF, c = GD_UNDEF, d = GD_UNDEF):
	if LEVEL_WARN > ProjectSettings.get("kkSettings/log_level"): return
	if correlation_id == null:
		correlation_id = Time.get_ticks_msec()
	_log(str("[WARN pid:", get_peer_id()," source: ",source, " cid: ",correlation_id,"]"), a,b,c,d)
		
func log(correlation_id, a, b = GD_UNDEF, c = GD_UNDEF, d = GD_UNDEF):
	if LEVEL_LOG > ProjectSettings.get("kkSettings/log_level"): return
	if correlation_id == null:
		correlation_id = Time.get_ticks_msec()
	_log(str("[LOG pid:", get_peer_id()," source: ",source, " cid: ",correlation_id,"]"), a,b,c,d)
		
func info(correlation_id, a, b = GD_UNDEF, c = GD_UNDEF, d = GD_UNDEF):
	if LEVEL_INF > ProjectSettings.get("kkSettings/log_level"): return
	
	if correlation_id == null:
		correlation_id = Time.get_ticks_msec()
	_log(str("[INFO pid:", get_peer_id()," source: ",source, " cid: ",correlation_id,"]"), a,b,c,d)

func get_peer_id():
	if Engine.is_editor_hint():
		return "@ editor"
	else:
		return Engine.get_main_loop().get_multiplayer().get_unique_id()
