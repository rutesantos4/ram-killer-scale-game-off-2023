extends Object

class_name Enemy

var memory_size: float
var _skin: SkinAsset

func _init(
	skin: SkinAsset,
	initial_memory_size: float
):
	_skin = skin
	memory_size = initial_memory_size

func consume(cookie: Cookie):
	memory_size += cookie.memory_size
