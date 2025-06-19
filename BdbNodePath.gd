class_name BdbNodePath

static func get_property(node:Node, prop_name:String) ->NodePath:
	return append_path(node.get_path(), ":"+prop_name)

## append_path("/foo/bar","/baz") -> /foo/bar/baz
## append_path("/foo/bar",":baz") -> /foo/bar:baz
## append_path("/foo:bar",":baz") -> /foo:bar:baz
static func append_path(path:NodePath, appendee:String) -> NodePath:
	var path_string := path.get_concatenated_names()
	if path.get_subname_count():
		path_string += ":"+path.get_concatenated_subnames()
	path_string += appendee
	return NodePath(path_string)
