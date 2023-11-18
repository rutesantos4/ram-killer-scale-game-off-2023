extends Object

class_name Player

var health: float
var energy: float
var points: float
var _skin: SkinAsset


func _init(
	skin: SkinAsset
):
	_skin = skin
	health = 100
	energy = 100

func dash():
	energy -= 5

func clean(cookie: Cookie):
	points += (cookie.memory_size * 2)

func close(tab: Tab):
	points += (tab.size * 1.5)
