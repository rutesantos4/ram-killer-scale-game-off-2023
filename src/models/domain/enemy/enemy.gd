extends PositionalEntity

class_name Enemy

var initial_memory_size: float
var memory_size: float
const SCALE_INCREASE_PERCENTAGE = 2.5
var previous_memory_size = 2.5

func _init(
	skin: SkinAsset,
	initial_position: Vector2,
	initial_memory_size: float
):
	super(skin, initial_position)

	self.initial_memory_size = initial_memory_size
	memory_size = initial_memory_size
	previous_memory_size = initial_memory_size

func consume(cookie: Cookie):
	memory_size += cookie.memory_size

func get_scale(current_scale: Vector2) -> Vector2:
	var size: float = (memory_size - previous_memory_size)/100 
	print("size ", size)
	print("memory_size ", memory_size)
	previous_memory_size = memory_size
	return Vector2(current_scale.x + size, current_scale.y + size)
