extends PositionalEntity

class_name Player

const _DASH_ENERGY_CONSUMPTION = 5.0

var health: float
var energy: float
var points: float
var cleaned_cookies_count: int

func _init(
	skin: SkinAsset,
	initial_position: Vector2
):
	super(skin, initial_position)

	health = 100
	energy = 100
	points = 0
	cleaned_cookies_count = 0

func can_dash():
	return energy >= _DASH_ENERGY_CONSUMPTION

func dash():
	energy -= _DASH_ENERGY_CONSUMPTION
	
func recover():
	energy += _DASH_ENERGY_CONSUMPTION

func clean(cookie: Cookie):
	points += (cookie.memory_size * 2)
	cleaned_cookies_count+=1

func close(tab: Tab):
	points += (tab.memory_size * 1.5)
	
func receive(shock: ElectricalShock):
	health -= 5.0
