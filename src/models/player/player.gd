extends PositionalEntity

class_name Player

var health: float
var energy: float
var points: float

func _init(
	skin: SkinAsset,
	initial_position: Vector2
):
	super(skin, initial_position)

	health = 100
	energy = 100

func dash():
	energy -= 5

func clean(cookie: Cookie):
	points += (cookie.memory_size * 2)

func close(tab: Tab):
	points += (tab.size * 1.5)
