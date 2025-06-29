extends Node

const LEVEL_WARN = InstanceLogger.LEVEL_WARN
const LEVEL_ERROR = InstanceLogger.LEVEL_ERROR
const LEVEL_LOG = InstanceLogger.LEVEL_LOG
const LEVEL_INF = InstanceLogger.LEVEL_INF

static var _global_logger := InstanceLogger.new("GLOBAL")

static func _log(prefix, a = GD_UNDEF, b = GD_UNDEF, c = GD_UNDEF, d = GD_UNDEF):
	_global_logger.log(prefix, a, b, c, d)
	
static func error(correlation_id, a, b = GD_UNDEF, c = GD_UNDEF, d = GD_UNDEF):
	_global_logger.error(correlation_id, a, b, c, d)

static func warn(correlation_id, a, b = GD_UNDEF, c = GD_UNDEF, d = GD_UNDEF):
	_global_logger.warn(correlation_id, a, b, c, d)
		
static func log(correlation_id, a, b = GD_UNDEF, c = GD_UNDEF, d = GD_UNDEF):
	_global_logger.log(correlation_id, a, b, c, d)
		
static func info(correlation_id, a, b = GD_UNDEF, c = GD_UNDEF, d = GD_UNDEF):
	_global_logger.info(correlation_id, a, b, c, d)

static func get_peer_id():
	if Engine.is_editor_hint():
		return "@ editor"
	else:
		return Engine.get_main_loop().get_multiplayer().get_unique_id()
