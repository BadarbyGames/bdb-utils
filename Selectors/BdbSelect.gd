class_name BdbSelect

static func node(n:Node):
	assert(n, "Node is required but not founnd")
	return n
	
#region by_type
static func child_by_type(parent:Node, type):
	return item_by_type(parent.get_children(),type)
	  
static func item_by_type(items:Array, type):
	for i in items: if is_instance_of(i, type): return i
	
static func children_by_type(parent:Node, type):
	return items_by_type(parent.get_children(),type)
 
"""
Override result
"""
static func items_by_type(items:Array, type, result:Variant = []) -> Variant:
	for item in items:
		if is_instance_of(item, type):
			result.append(item)
	return result
#endregion

#region by_name
static func child_by_name(parent:Node, nname:String):
	return item_by_name(parent.get_children(),nname)

static func children_by_name(parent:Node, nname:String):
	return items_by_name(parent.get_children(),nname)
	
static func item_by_name(items:Array, nname:String):
	for i in items: if i.name == nname: return i

static func items_by_name(items:Array, nname:String) -> Array:
	return items.filter(func (i): return i.name == nname)
#endregion
	
#region by_method
static func child_by_method(parent:Node, nname:String):
	return item_by_method(parent.get_children(),nname)

static func children_by_method(parent:Node, nname:String):
	return items_by_method(parent.get_children(),nname)
	
static func item_by_method(items:Array, nname:String):
	for i in items: if i.has_method(nname): return i

static func items_by_method(items:Array, nname:String) -> Array:
	return items.filter(func (i): return i.has_method(nname))
#endregion
