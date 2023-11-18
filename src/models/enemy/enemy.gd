extends Object

class_name Enemy

var size: float
var skin: SkinAsset

func _init(
	skin: SkinAsset,
	initial_size: float
):
	skin = skin
	size = initial_size

func consume(cookie: Cookie):
	#TODO: implement
	pass