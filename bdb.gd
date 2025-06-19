extends Node

class_name Bdb

const default_message = "This is required"
static func require(n:Variant, msg:String = default_message):
	assert(n, default_message)
	return n
