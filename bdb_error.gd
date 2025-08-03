class_name BdbError

const NOT_IMPLEMENTED_STR = &"This method has not been implemented"
static func not_implemented(str:String = NOT_IMPLEMENTED_STR):
	assert(false, str)

const DEPRECATED_STR = &"This method has been deprecated"
static func deprecated(str:String = DEPRECATED_STR):
	assert(false, str)
