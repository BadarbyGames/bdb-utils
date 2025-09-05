extends RefCounted

class_name BdbIdioms

static func free_children(parent:Node):
	for c in parent.get_children():
		c.free()

static func clear_signal(sig:Signal):
	for connection in sig.get_connections():
		sig.disconnect(connection.callable)
