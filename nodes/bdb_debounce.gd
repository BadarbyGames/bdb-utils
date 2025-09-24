extends Timer

class_name BdbDebounce

var debounce_secs:float

var params_array:Array


func _init(secs = 1) -> void:
	debounce_secs = secs
	autostart = false
	time_left
	one_shot = true

func cb_0(callable:Callable):
	timeout.connect(callable)
	return cb_0_callback
	
func cb_0_callback():
	stop()
	start(debounce_secs)

func cb_1(callable:Callable):
	timeout.connect(func(): callable.callv(params_array))
	return cb_1_callback

func cb_1_callback(param):
	params_array = [param]
	stop()
	start(debounce_secs)
