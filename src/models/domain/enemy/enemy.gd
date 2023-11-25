extends PositionalEntity

class_name Enemy

const SCALE_INCREASE_PERCENTAGE = 2.5

var previous_memory_size = 2.5

var initial_memory_size: float
var memory_size: float
var consumed_cookies_count: float

func _init(
	skin: SkinAsset,
	initial_position: Vector2,
	initial_memory_size: float
):
	super(skin, initial_position)

	self.initial_memory_size = initial_memory_size
	self.memory_size = initial_memory_size
	self.previous_memory_size = initial_memory_size
	self.consumed_cookies_count = 0

func consume(cookie: Cookie):
	memory_size += cookie.memory_size
	consumed_cookies_count += 1

func get_scale(current_scale: Vector2) -> Vector2:
	var size: float = (memory_size - previous_memory_size)/100 
	previous_memory_size = memory_size
	return Vector2(current_scale.x + size, current_scale.y + size)
