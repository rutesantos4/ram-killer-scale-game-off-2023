extends Object
class_name LazyFileImage

var _file_path: String
var _value: Texture2D

func _init(
	file_path: String
): _file_path = file_path

func value():
	if(!_value):
		_value = load(_file_path)
	
	return _value
