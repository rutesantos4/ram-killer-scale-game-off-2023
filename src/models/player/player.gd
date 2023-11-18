extends Object

class_name Player

var health: float
var energy: float
var skin: SkinAsset


func _init(
	skin: SkinAsset
):
	skin = skin
	health = 100
	energy = 100

func dash():
	energy -= 5

func clean(cookie: Cookie):
	#TODO: implement
	pass

func close(tab: Tab):
	#TODO: implement
	pass
